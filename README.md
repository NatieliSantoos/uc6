# Sistema Web de Vendas de Laços para Rodeio

> Documento de requisitos e prototipação — Aulas 01 e 02  
> Idioma: Português (Brasil) · Região: Brasil

## 01. CONTEXT — Contexto
O projeto propõe um sistema web para facilitar a venda de laços utilizados em rodeios. Atualmente, as vendas acontecem principalmente pelo WhatsApp e Instagram. Para montar cada pedido, o vendedor precisa perguntar individualmente sobre modelo, peso, espessura, cor, quantidade e adicionais, além de combinar pagamento e envio. Esse processo é repetitivo, consome tempo, dificulta atender vários clientes simultaneamente e aumenta o risco de erros. O MVP permitirá que o cliente escolha e personalize os produtos, monte seu carrinho, confira os valores e encaminhe o pedido organizado ao vendedor pelo WhatsApp. Nesta primeira versão, o pagamento e o envio serão combinados diretamente com o vendedor.

## 02. PERSON — Persona primária
### Geneir Martins — Vendedor e fabricante de laços
- **Idade:** 38 anos.
- **Profissão:** Empreendedor e fabricante de laços.
- **Cidade:** Cerro Negro, Santa Catarina.
- **Tecnologia:** Intermediário; utiliza WhatsApp e Instagram para divulgar e administrar as vendas.
- **Dor:** Atendimento repetitivo e organização manual dos pedidos, com risco de esquecer ou registrar incorretamente características.
- **Cenário:** Geneir divulga o catálogo e envia o link do sistema. O cliente escolhe e personaliza os laços, informa seus dados e encaminha o pedido organizado pelo WhatsApp.
- **Métrica:** Reduzir em pelo menos 60% o tempo médio gasto no atendimento individual para montar um pedido.

## 03. RF — Requisitos funcionais
- **RF01 — Catálogo:** apresentar modelos disponíveis, com foto, nome, descrição e preço.
- **RF02 — Personalização:** permitir selecionar peso, espessura, cor e adicionais disponíveis.
- **RF03 — Carrinho:** permitir adicionar produtos, alterar quantidades e remover itens.
- **RF04 — Cálculo:** calcular subtotais e valor total considerando quantidades e adicionais.
- **RF05 — Dados e revisão:** permitir informar nome, telefone e endereço e revisar o pedido.
- **RF06 — WhatsApp:** gerar mensagem organizada com os dados do pedido e abrir conversa com o vendedor.

## 04. RNF — Requisitos não funcionais
- **RNF01 — Responsividade:** adaptar as telas a celulares, tablets e computadores.
- **RNF02 — Usabilidade:** apresentar navegação simples e intuitiva.
- **RNF03 — Desempenho:** carregar páginas e processar seleções sem demora excessiva.
- **RNF04 — Privacidade e segurança:** proteger dados pessoais e tratá-los conforme a LGPD.

## 05. US — Histórias de usuário

### US01 — Consultar e personalizar um laço
**Como** cliente, **quero** visualizar o catálogo e escolher modelo, peso, espessura, cor e adicionais, **para** montar um laço conforme minhas preferências.

**Critérios de aceitação:**
- [ ] **AC01:** O catálogo apresenta modelos com foto, nome e descrição.
- [ ] **AC02:** Ao selecionar um modelo, o sistema apresenta as opções disponíveis.
- [ ] **AC03:** O sistema impede adicionar o produto se opções obrigatórias não foram selecionadas.
- [ ] **AC04:** O carrinho registra o modelo e as características escolhidas.

**MoSCoW:** Must Have.

### US02 — Montar e conferir o carrinho
**Como** cliente, **quero** adicionar diferentes laços ao carrinho e visualizar quantidades e valores, **para** conferir o pedido antes de encaminhá-lo.

**Critérios de aceitação:**
- [ ] **AC01:** O sistema permite adicionar diferentes modelos.
- [ ] **AC02:** Ao alterar quantidades, atualiza subtotal e total.
- [ ] **AC03:** Permite remover produtos e recalcular o total.
- [ ] **AC04:** O resumo apresenta modelo, características, quantidade, subtotal e total.

**MoSCoW:** Must Have.

### US03 — Encaminhar o pedido pelo WhatsApp
**Como** cliente, **quero** informar meus dados e encaminhar o pedido completo pelo WhatsApp, **para** facilitar a comunicação com o vendedor.

**Critérios de aceitação:**
- [ ] **AC01:** Solicita nome, telefone e endereço de entrega.
- [ ] **AC02:** Apresenta revisão dos dados, produtos, características, quantidades e total.
- [ ] **AC03:** Permite corrigir informações antes do encaminhamento.
- [ ] **AC04:** Abre conversa no WhatsApp com a mensagem preenchida.
- [ ] **AC05:** Informa que o cliente ainda precisa enviar a mensagem no WhatsApp.

**MoSCoW:** Must Have.

## 06. AC — Critérios de aceite
Os critérios de aceitação estão em checklist e descrevem comportamentos verificáveis para apoiar os testes e a validação das histórias de usuário.

## 07. OUT — Fora de escopo do MVP
- **OUT01:** Pagamento integrado ou armazenamento de dados de cartão.
- **OUT02:** Cálculo automático de frete.
- **OUT03:** Rastreamento da entrega.
- **OUT04:** Gestão completa de estoque e produção.
- **OUT05:** Painel administrativo avançado e relatórios.
- **OUT06:** Área do cliente para acompanhamento de status.

---

# Aula 02 — UX/UI e Prototipação

## 08. UX e UI no projeto
- **UX (User Experience):** organiza a jornada, identifica fricções e facilita a compra do início ao envio do pedido.
- **UI (User Interface):** define a apresentação visual, cores, tipografia, botões, campos, cartões e estados dos componentes.

A UX orienta a experiência; a UI materializa essa experiência na interface.

## 09. Jornada do usuário

| Etapa | Ação do cliente | Necessidade / fricção |
|---|---|---|
| 1. Descoberta | Acessa o link do Instagram ou WhatsApp. | Encontrar rapidamente os produtos. |
| 2. Exploração | Visualiza os modelos no catálogo. | Comparar modelos, fotos e preços. |
| 3. Personalização | Escolhe peso, espessura, cor, adicionais e quantidade. | Entender as opções e preencher os campos obrigatórios. |
| 4. Conferência | Revisa carrinho e informa endereço. | Identificar erros antes do envio. |
| 5. Conclusão | Abre o WhatsApp com o pedido preenchido. | Enviar dados completos sem redigitar. |

**Ponto de fricção:** dúvidas sobre as opções de personalização e campos obrigatórios.  
**Momento de verdade:** cliente consegue montar e conferir o pedido sem ajuda do vendedor.  
**Métrica:** percentual de clientes que concluem o fluxo sem ajuda.

## 10. Mapa de telas — Arquitetura da informação

```text
Catálogo (Tela 01)
└── Personalização do laço (Tela 02)
    └── Carrinho e resumo (Tela 03)
        └── Dados e envio pelo WhatsApp (Tela 04)
```

O cliente pode voltar às etapas anteriores para corrigir escolhas. A barra de etapas indica a localização no fluxo.

## 11. Wireframes de baixa fidelidade (Lo-Fi)

### Tela 01 — Catálogo
```text
+--------------------------------------+
| LOGO LAÇOS TIO GÊNIO       [Carrinho]|
+--------------------------------------+
| Encontre seu laço                    |
| [ Buscar modelo.................. ]  |
| [Foto] Laço 4 tentos       R$ 179,00 |
|        [ Ver opções ]                |
| [Foto] Laço 6 tentos       R$ 299,00 |
|        [ Ver opções ]                |
| [Foto] Laço de couro      R$ 185,00 |
|        [ Ver opções ]                |
+--------------------------------------+
```

### Tela 02 — Personalização
```text
+--------------------------------------+
| [Voltar]       Personalizar laço     |
+--------------------------------------+
| [Foto do produto]                    |
| Laço 4 tentos                        |
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
| Laço 4 tentos                        |
| Peso / Espessura / Cor               |
| Quantidade [ - ] 1 [ + ] [Remover]   |
| Subtotal: R$ ...                     |
|                                      |
| Total do pedido: R$ ...              |
| [ Continuar comprando ]              |
| [ Informar dados e continuar ]       |
+--------------------------------------+
```

### Tela 04 — Dados e envio
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
| Você precisará enviar a mensagem.   |
+--------------------------------------+
```

## 12. Tokens visuais — Design System

A proposta visual usa tons terrosos e verdes, relacionados ao universo country e rodeio.

### Paleta de cores

| Token | Cor | Código | Uso |
|---|---|---|---|
| Primary | Verde escuro | `#244B3C` | Botões principais e navegação |
| Accent | Caramelo | `#B9783F` | Destaques e etiquetas |
| Background | Areia clara | `#F7F4ED` | Fundo das páginas |
| Surface | Branco | `#FFFFFF` | Cartões e formulários |
| Text | Grafite | `#242824` | Textos e títulos |
| Muted | Cinza esverdeado | `#68736C` | Textos auxiliares |
| Border | Bege acinzentado | `#DED8CC` | Bordas e divisórias |
| Success | Verde | `#26734D` | Confirmações |
| Danger | Vermelho | `#B43B32` | Erros e remoções |

### Tipografia e espaçamento
- Família: system-ui / Arial.
- Título principal: 28–32 px, peso 700.
- Título de seção: 20–24 px, peso 700.
- Texto padrão: 16 px; auxiliar: 14 px.
- Grid de espaçamento: 4, 8, 12, 16, 24, 32, 48 e 64 px.
- Bordas: 6 px em campos, 12 px em cartões e 16 px em superfícies maiores.
- Botões e alvos de toque: mínimo de 44 px.
- Componentes reutilizáveis: botão primário, secundário, campo, cartão de produto, etiqueta e barra de etapas.
- Estados: padrão, foco, desabilitado, erro e sucesso.

## 13. Protótipo de alta fidelidade (Hi-Fi)
O arquivo `prototipo-lacos.html` contém quatro telas navegáveis:
1. **Catálogo:** lista modelos e permite iniciar a personalização.
2. **Personalização:** seleciona peso, espessura, cor, adicionais e quantidade.
3. **Carrinho:** mostra itens, características, quantidades e total; permite alterar e remover.
4. **Finalização:** coleta dados, apresenta revisão e prepara a mensagem para WhatsApp.

O protótipo usa produtos e preços fictícios. Antes de usar com clientes, substituir os dados demonstrativos pelos dados reais. O número de WhatsApp comercial também precisa ser configurado no código HTML. O protótipo não processa pagamento nem calcula frete.

## 14. Responsividade e acessibilidade
- Estratégia mobile-first, com adaptação para telas maiores.
- Alvos de toque confortáveis e campos com rótulos visíveis.
- Navegação por teclado e foco visível.
- Mensagens de validação devem explicar como corrigir o problema.
- Não depender apenas de cores para indicar estados.
- Princípios POUR: Perceptível, Operável, Compreensível e Robusto.
- Contraste recomendado: 4,5:1 para texto normal e 3:1 para texto grande.

## 15. Avaliação heurística — 5 heurísticas principais

Avaliação inicial por inspeção do protótipo. Não substitui testes com clientes reais.

### Tela 01 — Catálogo
| Heurística | Verificação | Ajuste / observação |
|---|---|---|
| Visibilidade do status | Contador do carrinho visível? | Manter contador e etapa atual. |
| Correspondência com o mundo real | Nomes compreensíveis? | Usar nomes conhecidos pelos compradores. |
| Controle e liberdade | É possível voltar ao catálogo? | Manter navegação clara. |
| Consistência e padrões | Cartões seguem mesmo padrão? | Reutilizar componente de produto. |
| Prevenção de erros | Preços e descrições aparecem antes da seleção? | Exibir informações essenciais no cartão. |

### Tela 02 — Personalização
| Heurística | Verificação | Ajuste / observação |
|---|---|---|
| Visibilidade do status | Preço estimado é atualizado? | Atualizar ao mudar adicionais e quantidade. |
| Correspondência com o mundo real | Termos dos campos são familiares? | Usar peso, espessura, cor e adicionais. |
| Controle e liberdade | Cliente consegue alterar escolhas? | Permitir alterar antes de adicionar. |
| Consistência e padrões | Campos e seletores são uniformes? | Reutilizar estilos de formulário. |
| Prevenção de erros | Opções obrigatórias são validadas? | Indicar campos que faltam. |

### Tela 03 — Carrinho
| Heurística | Verificação | Ajuste / observação |
|---|---|---|
| Visibilidade do status | Itens e total ficam claros? | Destacar total e quantidade. |
| Correspondência com o mundo real | Resumo descreve o produto corretamente? | Mostrar todas as características. |
| Controle e liberdade | É possível alterar ou remover? | Disponibilizar controles de quantidade e remoção. |
| Consistência e padrões | Valores seguem o mesmo formato? | Usar Real (R$) com duas casas decimais. |
| Prevenção de erros | É possível conferir antes de avançar? | Permitir voltar e corrigir. |

### Tela 04 — Finalização
| Heurística | Verificação | Ajuste / observação |
|---|---|---|
| Visibilidade do status | Cliente entende que está na última etapa? | Mostrar etapa de finalização. |
| Correspondência com o mundo real | Campos são adequados para entrega? | Usar rótulos claros. |
| Controle e liberdade | Pode corrigir os dados? | Manter opção de voltar. |
| Consistência e padrões | Botão principal mantém o padrão? | Reutilizar botão primário. |
| Prevenção de erros | Cliente sabe que precisa enviar a mensagem? | Avisar que abrir WhatsApp não envia automaticamente. |

**Resultado geral:** o fluxo possui início, continuidade e retorno entre etapas. Os pontos críticos a validar com usuários são clareza das opções, atualização do preço, validação dos campos e entendimento do envio pelo WhatsApp.

## 16. Fora do escopo desta prototipação
- Pagamento integrado.
- Integração com transportadoras e cálculo de frete.
- Rastreamento.
- Estoque e painel administrativo.
- Banco de dados e persistência real de pedidos.
- Envio automático sem ação do cliente no WhatsApp.

## 17. Entregáveis da Aula 02
- [x] Mapa de telas em árvore de navegação.
- [x] Quatro wireframes Lo-Fi.
- [x] Tokens visuais documentados.
- [x] Quatro telas Hi-Fi no protótipo HTML.
- [x] Navegação funcional entre as telas.
- [x] Relatório heurístico com cinco heurísticas por tela.

## Status do projeto
- **Aula 01:** levantamento e documentação inicial de requisitos.
- **Aula 02:** arquitetura da informação, wireframes, tokens visuais e protótipo navegável.
- **Próxima etapa:** testar com usuários, registrar dificuldades e ajustar antes do desenvolvimento definitivo.
