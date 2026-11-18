-- ============================================================
-- LAÇOS TIO GÊNIO — Aula 03
-- Banco: PostgreSQL (Supabase)
-- Modelo: catálogo, pedidos e itens de pedido
-- Execute no SQL Editor de um projeto Supabase novo.
-- ============================================================

create extension if not exists pgcrypto;

-- 1. CATÁLOGO
create table if not exists public.produtos (
    id uuid primary key default gen_random_uuid(),
    nome text not null check (char_length(trim(nome)) >= 3),
    descricao text,
    preco_base numeric(10,2) not null check (preco_base > 0),
    ativo boolean not null default true,
    imagem_url text,
    criado_em timestamptz not null default now(),
    atualizado_em timestamptz not null default now()
);

create index if not exists idx_produtos_ativo
    on public.produtos (ativo);

-- 2. PEDIDOS
-- created_by_user_id vincula o pedido à sessão autenticada
-- (incluindo sessão anônima do Supabase Auth).
create table if not exists public.pedidos (
    id uuid primary key default gen_random_uuid(),
    created_by_user_id uuid not null references auth.users(id) on delete restrict,
    cliente_nome text not null check (char_length(trim(cliente_nome)) >= 2),
    cliente_telefone text not null check (char_length(trim(cliente_telefone)) >= 8),
    endereco_entrega text not null check (char_length(trim(endereco_entrega)) >= 5),
    status text not null default 'aguardando_contato'
        check (status in ('aguardando_contato', 'em_negociacao', 'confirmado',
                          'enviado', 'concluido', 'cancelado')),
    observacoes text,
    criado_em timestamptz not null default now(),
    atualizado_em timestamptz not null default now()
);

create index if not exists idx_pedidos_usuario_criado
    on public.pedidos (created_by_user_id, criado_em desc);

create index if not exists idx_pedidos_status
    on public.pedidos (status);

-- 3. ITENS DO PEDIDO
-- As características são registradas como fotografia da escolha feita
-- pelo cliente. Assim, alterações futuras no catálogo não mudam pedidos antigos.
create table if not exists public.itens_pedido (
    id uuid primary key default gen_random_uuid(),
    pedido_id uuid not null references public.pedidos(id) on delete cascade,
    produto_id uuid not null references public.produtos(id) on delete restrict,
    peso text not null check (char_length(trim(peso)) > 0),
    espessura text not null check (char_length(trim(espessura)) > 0),
    cor text not null check (char_length(trim(cor)) > 0),
    adicionais text[] not null default '{}',
    quantidade integer not null check (quantidade between 1 and 100),
    preco_unitario numeric(10,2) not null check (preco_unitario > 0),
    subtotal numeric(12,2) generated always as
        (quantidade * preco_unitario) stored,
    criado_em timestamptz not null default now()
);

create index if not exists idx_itens_pedido_pedido
    on public.itens_pedido (pedido_id);

create index if not exists idx_itens_pedido_produto
    on public.itens_pedido (produto_id);

-- O preço unitário é obtido do catálogo no banco, não confiamos no preço
-- enviado pelo navegador. Adicionais, nesta versão, são apenas descritivos.
create or replace function public.definir_preco_item()
returns trigger
language plpgsql
security invoker
set search_path = ''
as $$
declare
    preco_catalogo numeric(10,2);
    produto_ativo boolean;
begin
    select p.preco_base, p.ativo
      into preco_catalogo, produto_ativo
      from public.produtos p
     where p.id = new.produto_id;

    if preco_catalogo is null or produto_ativo is distinct from true then
        raise exception 'Produto inexistente ou indisponível.';
    end if;

    new.preco_unitario := preco_catalogo;
    return new;
end;
$$;

drop trigger if exists trg_definir_preco_item on public.itens_pedido;
create trigger trg_definir_preco_item
before insert or update of produto_id, preco_unitario
on public.itens_pedido
for each row execute function public.definir_preco_item();

-- Visão de consulta: total calculado a partir dos itens persistidos.
create or replace view public.pedidos_com_total
with (security_invoker = true)
as
select
    p.id,
    p.created_by_user_id,
    p.cliente_nome,
    p.cliente_telefone,
    p.endereco_entrega,
    p.status,
    p.observacoes,
    p.criado_em,
    p.atualizado_em,
    coalesce(sum(i.subtotal), 0)::numeric(12,2) as total
from public.pedidos p
left join public.itens_pedido i on i.pedido_id = p.id
group by p.id;

-- RLS: ativar antes de criar políticas.
alter table public.produtos enable row level security;
alter table public.pedidos enable row level security;
alter table public.itens_pedido enable row level security;

-- Catálogo: visitantes e usuários autenticados podem consultar apenas ativos.
drop policy if exists "catalogo_publico_produtos_ativos" on public.produtos;
create policy "catalogo_publico_produtos_ativos"
on public.produtos for select
to anon, authenticated
using (ativo = true);

-- Pedidos: cada sessão autenticada só pode consultar/inserir/alterar os próprios.
drop policy if exists "cliente_visualiza_proprio_pedido" on public.pedidos;
create policy "cliente_visualiza_proprio_pedido"
on public.pedidos for select
to authenticated
using (auth.uid() = created_by_user_id);

drop policy if exists "cliente_cria_proprio_pedido" on public.pedidos;
create policy "cliente_cria_proprio_pedido"
on public.pedidos for insert
to authenticated
with check (auth.uid() = created_by_user_id);

drop policy if exists "cliente_atualiza_proprio_pedido" on public.pedidos;
create policy "cliente_atualiza_proprio_pedido"
on public.pedidos for update
to authenticated
using (auth.uid() = created_by_user_id)
with check (auth.uid() = created_by_user_id);

-- Itens: acesso somente quando o pedido relacionado pertence à sessão.
drop policy if exists "cliente_visualiza_itens_proprios" on public.itens_pedido;
create policy "cliente_visualiza_itens_proprios"
on public.itens_pedido for select
to authenticated
using (
    exists (
        select 1 from public.pedidos p
        where p.id = pedido_id
          and p.created_by_user_id = auth.uid()
    )
);

drop policy if exists "cliente_insere_itens_no_proprio_pedido" on public.itens_pedido;
create policy "cliente_insere_itens_no_proprio_pedido"
on public.itens_pedido for insert
to authenticated
with check (
    exists (
        select 1 from public.pedidos p
        where p.id = pedido_id
          and p.created_by_user_id = auth.uid()
    )
);

drop policy if exists "cliente_atualiza_itens_proprios" on public.itens_pedido;
create policy "cliente_atualiza_itens_proprios"
on public.itens_pedido for update
to authenticated
using (
    exists (
        select 1 from public.pedidos p
        where p.id = pedido_id
          and p.created_by_user_id = auth.uid()
    )
)
with check (
    exists (
        select 1 from public.pedidos p
        where p.id = pedido_id
          and p.created_by_user_id = auth.uid()
    )
);

drop policy if exists "cliente_remove_itens_proprios" on public.itens_pedido;
create policy "cliente_remove_itens_proprios"
on public.itens_pedido for delete
to authenticated
using (
    exists (
        select 1 from public.pedidos p
        where p.id = pedido_id
          and p.created_by_user_id = auth.uid()
    )
);

-- Produtos são administrados pelo responsável no painel do Supabase nesta etapa.
-- Não há políticas públicas de INSERT/UPDATE/DELETE no catálogo.

-- Dados demonstrativos: preços fictícios, substituir pelos valores confirmados.
insert into public.produtos (nome, descricao, preco_base, ativo)
values
    ('Laço 4 tentos', 'Modelo demonstrativo de quatro tentos.', 179.00, true),
    ('Laço 6 tentos', 'Modelo demonstrativo de seis tentos.', 299.00, true),
    ('Laço de couro', 'Modelo demonstrativo em couro.', 185.00, true)
on conflict do nothing;

-- ============================================================
-- NOTAS DE IMPLEMENTAÇÃO
-- 1. No Supabase Dashboard, habilite Anonymous Sign-Ins em Auth.
-- 2. O front deve executar signInAnonymously() antes de criar pedido.
-- 3. Não use a chave service_role no navegador.
-- 4. O cliente só pode ler produtos ativos e seus próprios pedidos.
-- 5. O preço de cada item é definido pelo trigger a partir do catálogo.
-- 6. Adicionais são descritivos no MVP; seus preços não são somados.
-- 7. Frete e pagamento continuam combinados diretamente no WhatsApp.
-- ============================================================
