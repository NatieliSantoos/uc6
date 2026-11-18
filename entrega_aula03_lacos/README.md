# Sistema Web de Vendas de Laços — Laços Tio Gênio

**Projeto acadêmico | Prototipação Rápida de Aplicações com IA**  
**Idioma:** Português (Brasil) · **Região:** Brasil

## Visão geral

MVP web para apresentar modelos de laços, permitir a escolha de peso, espessura, cor, adicionais e quantidade, organizar os itens em um pedido e encaminhar os dados ao vendedor pelo WhatsApp. O projeto evolui de protótipo visual para uma aplicação com persistência usando Supabase e PostgreSQL.

> O sistema não processa pagamentos nem calcula frete nesta versão. Essas condições são combinadas com o vendedor.

---

# Aula 01 — Descoberta e requisitos

## 01. Contexto

As vendas de laços acontecem principalmente por canais de conversa, como WhatsApp e Instagram. Para montar cada pedido, o vendedor precisa perguntar individualmente sobre modelo, peso, espessura, cor, quantidade e adicionais, além de combinar pagamento e envio. O processo é repetitivo, consome tempo e aumenta o risco de erros. O MVP permite que o cliente consulte o catálogo, personalize os produtos, monte o carrinho, confira os valores e encaminhe o pedido organizado pelo WhatsApp.

## 02. Persona primária

### Geneir Martins — vendedor e fabricante de laços
- **Idade:** 38 anos (persona fictícia).
- **Profissão:** empreendedor e fabricante de laços.
- **Cidade:** Cerro Negro, Santa Catarina.
- **Tecnologia:** intermediário; utiliza WhatsApp e Instagram para divulgar e administrar as vendas.
- **Dor:** atendimento repetitivo e organização manual dos pedidos.
- **Cenário:** compartilha o link do catálogo; o cliente escolhe e personaliza os laços e encaminha o pedido organizado pelo WhatsApp.
- **Métrica:** reduzir o tempo médio de atendimento individual para montar um pedido.

## 03. Requisitos funcionais

- **RF01:** apresentar catálogo de modelos com foto, nome, descrição e preço.
- **RF02:** permitir selecionar peso, espessura, cor e adicionais disponíveis.
- **RF03:** permitir adicionar produtos ao carrinho, alterar quantidades e remover itens.
- **RF04:** calcular subtotais e total dos produtos.
- **RF05:** coletar dados necessários do comprador e permitir revisar o pedido.
- **RF06:** preparar mensagem organizada e abrir conversa com o vendedor no WhatsApp.

## 04. Requisitos não funcionais

- **RNF01:** interface responsiva para celular, tablet e computador.
- **RNF02:** navegação simples, com rótulos claros e feedback de validação.
- **RNF03:** carregamento e interação sem demora excessiva.
- **RNF04:** proteção de dados pessoais e tratamento conforme a LGPD.

## 05. Histórias de usuário

### US01 — Consultar e personalizar um laço
**Como** cliente, **quero** visualizar o catálogo e escolher modelo, peso, espessura, cor e adicionais, **para** montar um laço conforme minhas preferências.

**Critérios de aceitação**
- [ ] AC01: catálogo apresenta os modelos disponíveis.
- [ ] AC02: sistema apresenta opções de personalização do modelo selecionado.
- [ ] AC03: sistema valida opções obrigatórias antes de adicionar.
- [ ] AC04: carrinho registra as características selecionadas.

**MoSCoW:** Must Have.

### US02 — Montar e conferir o carrinho
**Como** cliente, **quero** adicionar laços ao carrinho e visualizar quantidades e valores, **para** conferir o pedido antes de encaminhá-lo.

**Critérios de aceitação**
- [ ] AC01: sistema permite adicionar mais de um produto.
- [ ] AC02: alteração de quantidade atualiza os valores.
- [ ] AC03: sistema permite remover itens.
- [ ] AC04: resumo apresenta características, quantidade, subtotal e total.

**MoSCoW:** Must Have.

### US03 — Encaminhar pedido pelo WhatsApp
**Como** cliente, **quero** informar meus dados e encaminhar o pedido completo pelo WhatsApp, **para** facilitar a comunicação com o vendedor.

**Critérios de aceitação**
- [ ] AC01: sistema solicita dados necessários para contato e entrega.
- [ ] AC02: apresenta revisão dos dados e dos itens.
- [ ] AC03: permite corrigir informações antes do encaminhamento.
- [ ] AC04: abre o WhatsApp com a mensagem preenchida.
- [ ] AC05: informa que o cliente ainda precisa enviar a mensagem.

**MoSCoW:** Must Have.

## 06. Critérios de aceite

Os critérios acima descrevem comportamentos verificáveis que podem ser usados em testes funcionais e na validação das histórias de usuário.

## 07. Fora do escopo inicial

- Pagamento integrado ou armazenamento de dados de cartão.
- Cálculo automático de frete e integração com transportadoras.
- Rastreamento de entrega.
- Gestão avançada de estoque e produção.
- Painel administrativo completo e relatórios.

---

# Aula 02 — UX, UI e prototipação

## 08. UX e UI

- **UX (User Experience):** organiza a jornada, identifica fricções e facilita a compra.
- **UI (User Interface):** define apresentação visual, cores, tipografia, botões, campos e estados.

## 09. Jornada do usuário

| Etapa | Ação | Necessidade |
|---|---|---|
| Descoberta | Acessa o link | Encontrar os produtos |
| Exploração | Consulta catálogo | Comparar modelos e preços |
| Personalização | Escolhe características | Entender e selecionar opções |
| Conferência | Revisa carrinho e dados | Evitar erros |
| Conclusão | Abre WhatsApp | Encaminhar pedido sem redigitar |

**Ponto de fricção:** dúvidas sobre opções e características.  
**Momento de verdade:** montar e conferir o pedido sem ajuda do vendedor.  
**Métrica:** percentual de clientes que concluem o fluxo sem ajuda.

## 10. Mapa de telas

```text
Catálogo
└── Personalização do laço
    └── Carrinho e resumo
        └── Dados e envio pelo WhatsApp
```

## 11. Wireframes Lo-Fi

### Tela 01 — Catálogo
```text
+--------------------------------------+
| LOGO LAÇOS TIO GÊNIO       [Carrinho]|
+--------------------------------------+
| Encontre seu laço                    |
| [ Buscar modelo.................. ]  |
| [Foto] Laço 4 tentos       R$ ...    |
|        [ Ver opções ]                |
| [Foto] Laço 6 tentos       R$ ...    |
|        [ Ver opções ]                |
+--------------------------------------+
```

### Tela 02 — Personalização
```text
+--------------------------------------+
| [Voltar]       Personalizar laço     |
+--------------------------------------+
| Peso       [Selecionar             v]|
| Espessura  [Selecionar             v]|
| Cor        [Selecionar             v]|
| Adicionais [ ] Acabamento especial   |
| Quantidade          [ - ] 1 [ + ]    |
| Valor estimado: R$ ...               |
| [ Adicionar ao carrinho ]            |
+--------------------------------------+
```

### Tela 03 — Carrinho
```text
+--------------------------------------+
| [Voltar]             Meu carrinho    |
+--------------------------------------+
| Produto e características            |
| Quantidade [ - ] 1 [ + ] [Remover]   |
| Subtotal: R$ ...                     |
| Total do pedido: R$ ...              |
| [ Continuar comprando ]              |
| [ Informar dados e continuar ]       |
+--------------------------------------+
```

### Tela 04 — Finalização
```text
+--------------------------------------+
| [Voltar]          Finalizar pedido   |
+--------------------------------------+
| Nome [__________________________]    |
| Telefone [______________________]    |
| Endereço [______________________]    |
| Resumo dos produtos e opções         |
| Total: R$ ...                        |
| [ ] Revisei as informações           |
| [ Enviar pedido pelo WhatsApp ]      |
+--------------------------------------+
```

## 12. Tokens visuais

| Token | Valor | Uso |
|---|---|---|
| Primary | `#244B3C` | Ações principais |
| Accent | `#B9783F` | Destaques |
| Background | `#F7F4ED` | Fundo |
| Surface | `#FFFFFF` | Cartões e formulários |
| Text | `#242824` | Texto principal |
| Muted | `#68736C` | Texto auxiliar |
| Border | `#DED8CC` | Bordas |

- Tipografia: system-ui / Arial.
- Texto padrão: 16 px; auxiliar: 14 px.
- Espaçamento: escala de 4, 8, 12, 16, 24, 32, 48 e 64 px.
- Botões e alvos de toque: mínimo de 44 px.
- Estados: padrão, foco, desabilitado, erro e sucesso.

## 13. Protótipo Hi-Fi

O arquivo `prototipo-lacos.html` apresenta quatro telas navegáveis:
1. Catálogo de produtos.
2. Personalização.
3. Carrinho.
4. Finalização e preparação da mensagem para WhatsApp.

Os produtos e preços são demonstrativos. O número comercial deve ser configurado antes de qualquer teste de envio.

## 14. Responsividade e acessibilidade

- Estratégia mobile-first.
- Rótulos visíveis em formulários.
- Navegação por teclado e foco visível.
- Mensagens de validação que indiquem como corrigir.
- Não depender somente de cores para comunicar estados.
- Princípios POUR: Perceptível, Operável, Compreensível e Robusto.
- Contraste recomendado: 4,5:1 para texto normal e 3:1 para texto grande.

## 15. Avaliação heurística

Avaliação inicial por inspeção, não substitui testes com usuários reais.

| Tela | Visibilidade | Correspondência | Controle | Consistência | Prevenção |
|---|---|---|---|---|---|
| Catálogo | Contador do carrinho | Nomes familiares | Voltar ao catálogo | Cartões padronizados | Mostrar preço e descrição |
| Personalização | Atualizar valor | Termos do domínio | Alterar escolhas | Campos uniformes | Validar opções obrigatórias |
| Carrinho | Mostrar itens e total | Resumo fiel | Alterar/remover | Formato monetário uniforme | Revisar antes de avançar |
| Finalização | Indicar última etapa | Campos compreensíveis | Corrigir dados | Botão padrão | Avisar que WhatsApp não envia sozinho |

---

# Aula 03 — Backend, BaaS e APIs

## 16. Objetivo da aula

Evoluir o protótipo para uma aplicação com persistência de dados. O backend recebe solicitações do front-end, aplica validações, consulta ou altera o banco e devolve respostas. Foi escolhido o Supabase, que oferece PostgreSQL, autenticação, APIs e políticas de segurança como serviço gerenciado.

## 17. Arquitetura escolhida

```text
CLIENTE
Navegador / interface web
       |
       | HTTPS + Supabase JS SDK
       v
SUPABASE
Autenticação + API REST + RLS
       |
       v
POSTGRESQL
Produtos · Pedidos · Itens do pedido
```

O navegador não acessa diretamente o banco. O SDK se comunica com as APIs do Supabase, e o PostgreSQL aplica as políticas de acesso.

## 18. Modelagem de dados

### Tabela `produtos`
| Campo | Tipo | Regra |
|---|---|---|
| id | uuid | PK, gerado automaticamente |
| nome | text | Obrigatório, mínimo 3 caracteres |
| descricao | text | Opcional |
| preco_base | numeric(10,2) | Maior que zero |
| ativo | boolean | Padrão true |
| imagem_url | text | Opcional |
| criado_em | timestamptz | Data de criação |
| atualizado_em | timestamptz | Data de atualização |

### Tabela `pedidos`
| Campo | Tipo | Regra |
|---|---|---|
| id | uuid | PK |
| created_by_user_id | uuid | FK para auth.users |
| cliente_nome | text | Obrigatório |
| cliente_telefone | text | Obrigatório |
| endereco_entrega | text | Obrigatório |
| status | text | Valor controlado por CHECK |
| observacoes | text | Opcional |
| criado_em | timestamptz | Data de criação |
| atualizado_em | timestamptz | Data de atualização |

### Tabela `itens_pedido`
| Campo | Tipo | Regra |
|---|---|---|
| id | uuid | PK |
| pedido_id | uuid | FK para pedidos |
| produto_id | uuid | FK para produtos |
| peso | text | Obrigatório |
| espessura | text | Obrigatório |
| cor | text | Obrigatório |
| adicionais | text[] | Lista de adicionais |
| quantidade | integer | Entre 1 e 100 |
| preco_unitario | numeric(10,2) | Definido no banco |
| subtotal | numeric(12,2) | Quantidade × preço |

### Relacionamentos
- Um produto pode aparecer em vários itens de pedido.
- Um pedido pode conter vários itens.
- Cada item pertence a um pedido e referencia um produto.

**Decisões de integridade:** PKs UUID, FKs, `NOT NULL`, `CHECK`, índices de busca e `ON DELETE` apropriado. Produtos referenciados não podem ser apagados; pedidos podem ser excluídos em cascata com seus itens.

## 19. CRUD e APIs REST

| Operação | HTTP | SQL | Aplicação |
|---|---|---|---|
| Create | POST | INSERT | Criar produto/pedido/item |
| Read | GET | SELECT | Consultar catálogo e pedidos próprios |
| Update | PATCH | UPDATE | Atualizar dados ou status permitido |
| Delete | DELETE | DELETE | Remover item próprio |

O Supabase gera APIs para as tabelas. O SDK JavaScript permite consumir essas operações sem criar um servidor próprio.

## 20. Segurança e privacidade

- RLS ativada nas três tabelas.
- Visitantes podem consultar somente produtos ativos.
- Cada sessão autenticada pode acessar somente seus próprios pedidos e itens.
- A chave `service_role` nunca deve ser usada no navegador.
- Credenciais ficam em variáveis de ambiente.
- HTTPS deve ser utilizado.
- Logs não devem expor senhas, tokens ou dados pessoais.
- Coletar somente dados necessários, com finalidade clara e tratamento conforme a LGPD.
- Backups e retenção precisam ser conferidos nas configurações do projeto Supabase.

**Sessão do cliente:** para o checkout sem cadastro tradicional, a implementação proposta utiliza autenticação anônima do Supabase. É necessário habilitar Anonymous Sign-Ins no painel antes de testar o fluxo.

## 21. Regras de negócio por camada

| Camada | Responsabilidade |
|---|---|
| Banco | Integridade, chaves, preço de catálogo e RLS |
| Servidor/serviço | Regras condicionais e integrações externas |
| Front-end | Feedback, validação de formulário e experiência |

Validação no navegador melhora a experiência, mas não substitui segurança no banco ou servidor.

## 22. Arquivos técnicos da Aula 03

- `schema.sql`: criação das tabelas, relacionamentos, constraints, índices, trigger de preço, view de total, RLS e três produtos demonstrativos.
- `lib/supabase.ts`: inicialização do SDK e função de sessão anônima.
- `.env.example`: nomes das variáveis necessárias, sem credenciais.
- `.gitignore`: impede o envio de arquivos `.env` ao Git.

## 23. Como executar a etapa de backend

1. Criar um projeto no Supabase e escolher a região adequada.
2. Abrir o SQL Editor e executar `schema.sql`.
3. Habilitar autenticação anônima em Auth.
4. Instalar o SDK no projeto front-end:

```bash
npm install @supabase/supabase-js
```

5. Copiar `.env.example` para `.env` e preencher URL e anon key do projeto.
6. Criar `lib/supabase.ts` usando o arquivo fornecido.
7. Conferir se `.env` está no `.gitignore`.
8. Integrar as consultas do catálogo e as operações de pedido.
9. Testar CRUD e confirmar os dados no Table Editor.

## 24. Plano de testes CRUD

| Teste | Ação | Resultado esperado |
|---|---|---|
| READ catálogo | Consultar produtos | Retornar os produtos ativos |
| CREATE pedido | Criar sessão anônima e pedido | Pedido vinculado ao usuário da sessão |
| CREATE item | Inserir item no pedido | Item persistido com preço do catálogo |
| READ pedido | Consultar pedido da própria sessão | Retornar apenas dados próprios |
| UPDATE | Atualizar item próprio | Alteração persistida |
| DELETE | Remover item próprio | Item removido e total recalculado na view |
| RLS | Tentar acessar pedido de outra sessão | Acesso negado/nenhuma linha retornada |

## 25. Critérios de conclusão da Aula 03

- [x] Entidades e relacionamentos modelados para o domínio de vendas de laços.
- [x] Script SQL documentado com PK, FK, constraints e índices.
- [x] Políticas RLS definidas no script.
- [x] Arquivo de integração do SDK preparado.
- [x] Modelo de variáveis de ambiente criado.
- [ ] Projeto Supabase criado e configurado.
- [ ] Script executado no SQL Editor.
- [ ] SDK instalado e integrado ao front-end.
- [ ] Variáveis reais configuradas localmente.
- [ ] Operações CRUD testadas no front-end.
- [ ] Três produtos confirmados no Table Editor.

> Os itens marcados como pendentes dependem da execução no projeto Supabase e no repositório real. A documentação e os arquivos de configuração não significam que o serviço externo já foi criado ou que os testes remotos foram executados.

## 26. Fora do escopo desta versão

- Gateway de pagamento.
- Cálculo e compra de frete.
- Rastreamento de encomendas.
- Painel administrativo completo.
- Gestão avançada de estoque.
- Integração automática com transportadoras.

---

## Histórico de evolução

| Aula | Entrega |
|---|---|
| 01 | Contexto, persona, requisitos funcionais e não funcionais, histórias de usuário e critérios de aceitação |
| 02 | Jornada, mapa de telas, wireframes, tokens visuais, protótipo e avaliação heurística |
| 03 | Arquitetura backend, modelagem relacional, SQL, RLS e preparação da integração Supabase |
