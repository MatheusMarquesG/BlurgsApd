# 🍔 Blurgs — Game Design Document

> **Versão:** 1.0  
> **Data:** 12 de maio de 2026  
> **Engine:** Godot 4.x (exportação Web/HTML5)  
> **Gênero:** Simulação / Gerenciamento / Tycoon  
> **Perspectiva:** Top-Down 2D Pixel Art  
> **Plataforma:** Web (navegador)  
> **Tempo de jogo estimado:** ~20 minutos  

---

## 1. Visão Geral

**Blurgs** é um jogo de simulação e gerenciamento em pixel art com visão top-down, onde o jogador assume o papel de um empreendedor que acaba de abrir uma pequena hamburgueria. O objetivo é transformar um restaurante próspero, aprendendo conceitos básicos de empreendedorismo de forma lúdica e intuitiva.

O jogo se passa em uma única sessão curta (~20 minutos), funcionando como uma experiência completa e acessível diretamente no navegador.

### 1.1 Público-Alvo

- Jogadores casuais interessados em simulação
- Estudantes e curiosos sobre empreendedorismo
- Faixa etária: 12+

### 1.2 Pilares de Design

| Pilar | Descrição |
|---|---|
| **Acessibilidade** | Controles simples, sessão curta, roda no navegador |
| **Progressão tangível** | O jogador vê sua hamburgueria crescer visualmente |
| **Educação sutil** | Conceitos de empreendedorismo integrados à gameplay |
| **Satisfação** | Feedback visual e sonoro constante nas ações do jogador |

---

## 2. História e Contexto

### 2.1 Premissa

O jogador é **Blu**, um personagem simpático que sonha em ter a melhor hamburgueria da cidade. Ele começa com um pequeno espaço, uma chapa velha, e alguns trocados no bolso. Ao longo do jogo, Blu precisa:

- Atender clientes
- Gerenciar o caixa
- Investir em melhorias
- Contratar funcionários
- Expandir o negócio

### 2.2 Cenário

A cidade fictícia de **Vila Grelha**, um bairro urbano e colorido. O jogo se passa inteiramente dentro e ao redor da hamburgueria, que cresce conforme o jogador progride.

### 2.3 Tom e Atmosfera

- Visual alegre e colorido em pixel artvw1
- Trilha sonora animada com vibe de lanchonete retrô
- Humor leve nas falas dos clientes e nos eventos

---

## 3. Gameplay

### 3.1 Loop Principal

```
Clientes chegam → Jogador prepara pedidos → Recebe dinheiro →
Investe em melhorias → Mais clientes / clientes melhores → Repete
```

### 3.2 Controles

| Ação | Controle |
|---|---|
| Mover personagem | WASD / Setas |
| Interagir | E / Clique esquerdo |
| Abrir menu de upgrades | Tab / Botão UI |
| Pausar | Esc |

### 3.3 Mecânicas Principais

#### 3.3.1 Atendimento de Clientes

- Clientes entram na hamburgueria e fazem fila no balcão
- Um balão de pensamento mostra o pedido (ex: hambúrguer simples, combo, especial)
- O jogador precisa ir até a estação correta, interagir e preparar o pedido
- Pedidos têm um **timer de paciência** — se demorar demais, o cliente vai embora (e o jogador perde reputação)

#### 3.3.2 Preparo de Hambúrgueres

O sistema de preparo é simplificado para manter a sessão curta:

1. Ir até a **chapa** → interagir para grelhar a carne (mini-espera de ~2s)
2. Ir até o **balcão de montagem** → interagir para montar o hambúrguer
3. Entregar ao cliente no **caixa**

Conforme o jogador compra equipamentos melhores, os tempos de preparo diminuem e novos itens ficam disponíveis.

#### 3.3.3 Sistema Financeiro (Caixa)

| Recurso | Descrição |
|---|---|
| **Dinheiro (R$)** | Moeda principal, obtida vendendo hambúrgueres |
| **Reputação (⭐)** | Sobe com bom atendimento, desce com clientes insatisfeitos |

- O preço dos hambúrgueres aumenta conforme a reputação sobe
- Clientes mais exigentes (e lucrativos) aparecem com reputação alta
- O jogador precisa equilibrar **gastos** (upgrades, salários) e **receita**

#### 3.3.4 Sistema de Upgrades

O jogador pode abrir um **menu de loja** a qualquer momento para investir o dinheiro ganho:

##### Equipamentos

| Equipamento | Custo (R$) | Efeito |
|---|---|---|
| Chapa Básica | *(inicial)* | Grelha 1 carne por vez, tempo: 3s |
| Chapa Industrial | 150 | Grelha 2 carnes por vez, tempo: 2s |
| Fritadeira | 200 | Desbloqueia batata frita (novos combos) |
| Máquina de Refrigerante | 120 | Desbloqueia bebidas (aumenta valor dos combos) |
| Forno de Pão Artesanal | 300 | +20% no valor de cada hambúrguer |
| Chapa Premium | 400 | Grelha 3 carnes, tempo: 1.5s |

##### Expansões

| Expansão | Custo (R$) | Efeito |
|---|---|---|
| Mais Mesas (4→8) | 250 | Aumenta capacidade de clientes simultâneos |
| Área Externa | 400 | +6 lugares, atrai mais clientes |
| Decoração Temática | 180 | +15% de reputação passiva |
| Fachada Nova | 300 | Atrai clientes "VIP" que pagam mais |

##### Funcionários

| Funcionário | Salário/min (R$) | Função |
|---|---|---|
| Cozinheiro Auxiliar | 5/min | Grelha carnes automaticamente |
| Atendente | 4/min | Entrega pedidos prontos ao cliente |
| Caixa | 3/min | Cobra automaticamente os clientes |

> **Nota de design:** Os salários dos funcionários criam uma tensão financeira saudável — o jogador precisa calcular se a automação vale o custo.

---

## 4. Progressão e Estrutura do Jogo

O jogo é dividido em **5 fases/dias**, cada uma durando aproximadamente **4 minutos**:

### Dia 1 — "O Começo" (~4 min)
- **Tutorial interativo**: Blu abre a hamburgueria pela primeira vez
- Aprende a se mover, grelhar e atender clientes
- Poucos clientes, pedidos simples (só hambúrguer)
- Objetivo: ganhar R$ 100
- **Conceito ensinado:** *Capital inicial e primeiras vendas*

### Dia 2 — "Investindo no Negócio" (~4 min)
- Menu de upgrades é desbloqueado
- O jogador pode comprar a primeira melhoria
- Mais clientes aparecem, combos são introduzidos
- Objetivo: atingir 2⭐ de reputação
- **Conceito ensinado:** *Reinvestimento de lucros*

### Dia 3 — "Mão de Obra" (~4 min)
- Contratação de funcionários é desbloqueada
- Fluxo de clientes aumenta significativamente
- Salários começam a pesar no caixa
- Objetivo: manter o caixa positivo com pelo menos 1 funcionário
- **Conceito ensinado:** *Gestão de pessoas e custos fixos*

### Dia 4 — "Expansão" (~4 min)
- Expansões físicas são desbloqueadas
- Clientes VIP começam a aparecer
- Eventos aleatórios podem ocorrer (ver seção 5)
- Objetivo: atingir 4⭐ de reputação
- **Conceito ensinado:** *Escalabilidade e crescimento*

### Dia 5 — "O Grande Dia" (~4 min)
- Um **crítico gastronômico** visita a hamburgueria
- O jogador precisa gerenciar um rush de clientes enquanto atende o crítico
- Final varia conforme o desempenho (ver seção 4.1)
- **Conceito ensinado:** *Reputação e qualidade do serviço*

### 4.1 Finais

| Final | Condição | Descrição |
|---|---|---|
| 🥇 **Ouro** | 5⭐ + R$ 500+ no caixa | Blu recebe 5 estrelas do crítico. A hamburgueria vira referência na cidade. Tela com a hamburgueria totalmente expandida e lotada |
| 🥈 **Prata** | 3-4⭐ + Caixa positivo | O crítico dá uma boa avaliação. Blu continua crescendo. Tela com a hamburgueria em bom estado |
| 🥉 **Bronze** | 1-2⭐ ou Caixa negativo | O crítico faz uma avaliação mediana. Blu percebe que precisa melhorar, mas não desiste. Tela com Blu pensativo olhando para a hamburgueria |

> Todos os finais são positivos no tom — o jogo reforça que empreender é um processo de aprendizado.

---

## 5. Eventos Aleatórios

Eventos surgem via pop-up durante os dias 3-5 e forçam decisões do jogador:

| Evento | Escolha A | Escolha B |
|---|---|---|
| **Fornecedor em promoção** | Comprar estoque em massa (-R$ 80, -20% custo por 1 min) | Ignorar |
| **Inspeção sanitária** | Pagar taxa de adequação (-R$ 60) | Arriscar (50% chance de multa de R$ 120) |
| **Cliente influencer** | Dar refeição grátis (+reputação) | Cobrar normalmente |
| **Chuva forte** | Fluxo de clientes cai pela metade por 30s | — (evento automático) |
| **Funcionário pede aumento** | Aceitar (+30% salário, +produtividade) | Recusar (chance de ele sair) |

> **Conceitos ensinados:** Tomada de decisão, análise de risco, marketing, custos operacionais.

---

## 6. Interface do Usuário (UI)

### 6.1 HUD Principal (durante o gameplay)

```
┌─────────────────────────────────────────────────┐
│  💰 R$ 245    ⭐ 3.2    📅 Dia 3    ⏱ 2:34     │
├─────────────────────────────────────────────────┤
│                                                 │
│           [Área de jogo — Top-Down]             │
│                                                 │
│    🧑‍🍳 Blu                                      │
│         🍔 ← balão de pedido do cliente         │
│                                                 │
│                                                 │
├─────────────────────────────────────────────────┤
│  [🛒 Loja]   [👥 Equipe]   [⏸ Pausa]           │
└─────────────────────────────────────────────────┘
```

### 6.2 Tela de Loja/Upgrades

- Lista de itens disponíveis com ícone, nome, custo e efeito
- Itens já comprados aparecem com checkmark
- Itens bloqueados aparecem em cinza com condição para desbloquear

### 6.3 Tela de Fim de Dia

- Resumo financeiro: receita, despesas, lucro
- Reputação atual
- Dica de empreendedorismo relacionada ao dia jogado
- Botão "Próximo Dia"

### 6.4 Menu Inicial

- **Jogar** — Inicia nova partida
- **Como Jogar** — Tela com controles e explicação rápida
- **Créditos**

---

## 7. Arte e Estilo Visual

### 7.1 Estilo

- **Pixel Art** com resolução base de **320×180** (escalonado para tela cheia)
- Paleta de cores vibrante e quente (tons de laranja, vermelho, amarelo, marrom)
- Tiles de **16×16 pixels**
- Sprites de personagens: **16×16** ou **16×24** (com animações de 4 frames)

### 7.2 Paleta de Cores Sugerida

| Uso | Cor | Hex |
|---|---|---|
| Fundo / Chão | Bege claro | `#F5E6C8` |
| Paredes | Marrom quente | `#8B5E3C` |
| Balcão | Madeira | `#C4956A` |
| Destaque / UI | Amarelo mostarda | `#E8A838` |
| Acento positivo | Verde | `#6BCB77` |
| Acento negativo | Vermelho | `#E84545` |
| Texto | Marrom escuro | `#3D2C1E` |

### 7.3 Animações Essenciais

- Blu andando (4 direções × 4 frames)
- Blu grelhando (2 frames loop)
- Blu entregando pedido (3 frames)
- Carne na chapa (3 frames: crua → grelhando → pronta)
- Clientes entrando/sentando/saindo
- Moedas pulando ao receber pagamento
- Fumaça da chapa
- Estrelas de reputação brilhando

---

## 8. Áudio

### 8.1 Música

| Contexto | Estilo |
|---|---|
| Menu principal | Lo-fi chill, violão suave |
| Gameplay (dia calmo) | Upbeat, lanchonete retrô, chiptune leve |
| Gameplay (rush) | Ritmo acelerado, percussão forte |
| Fim de dia | Melodia calma e satisfatória |
| Final (qualquer) | Música triunfante com variações de intensidade |

### 8.2 Efeitos Sonoros

- Carne na chapa (chiar)
- Moedas (tilintar)
- Cliente satisfeito (som alegre curto)
- Cliente insatisfeito (som triste)
- Compra de upgrade (cash register / ka-ching)
- Clique de menu (pop suave)
- Notificação de evento (sino)

---

## 9. Conceitos de Empreendedorismo Ensinados

O jogo integra conceitos de empreendedorismo de forma orgânica, sem ser didático demais:

| Conceito | Como aparece no jogo |
|---|---|
| **Capital inicial** | Jogador começa com dinheiro limitado |
| **Receita e despesas** | Balancete mostrado ao final de cada dia |
| **Reinvestimento** | Comprar upgrades para melhorar produção |
| **Gestão de pessoas** | Contratar e pagar funcionários |
| **Custos fixos vs variáveis** | Salários (fixo) vs ingredientes (variável) |
| **Reputação e marca** | Sistema de estrelas afeta clientes |
| **Tomada de decisão** | Eventos aleatórios com escolhas |
| **Risco** | Eventos com consequências incertas |
| **Escalabilidade** | Expandir espaço para atender mais clientes |
| **Fluxo de caixa** | Manter dinheiro suficiente para operar |

---

## 10. Arquitetura Técnica (Godot)

### 10.1 Estrutura de Cenas

```
Main
├── UI/
│   ├── HUD.tscn
│   ├── ShopMenu.tscn
│   ├── StaffMenu.tscn
│   ├── DaySummary.tscn
│   ├── EventPopup.tscn
│   └── MainMenu.tscn
├── World/
│   ├── Restaurant.tscn        ← Cena principal do restaurante (TileMap)
│   ├── Furniture.tscn          ← Equipamentos interativos
│   └── Expansion.tscn          ← Áreas de expansão
├── Characters/
│   ├── Player.tscn             ← Blu (CharacterBody2D)
│   ├── Customer.tscn           ← Cliente genérico (CharacterBody2D)
│   └── Employee.tscn           ← Funcionário (CharacterBody2D)
└── Managers/
    ├── GameManager.gd          ← Estado global, controle de dias
    ├── EconomyManager.gd       ← Dinheiro, preços, salários
    ├── ReputationManager.gd    ← Sistema de estrelas
    ├── CustomerSpawner.gd      ← Spawn e fila de clientes
    └── EventManager.gd         ← Eventos aleatórios
```

### 10.2 Scripts Autoload (Singletons)

- `GameManager` — Controla estado do jogo, dia atual, timers
- `EconomyManager` — Controla dinheiro, transações, balancete
- `ReputationManager` — Controla reputação e seus efeitos

### 10.3 Exportação Web

- Exportar via **Godot HTML5 export template**
- Resolução base: 320×180 com stretch mode **canvas_items** e aspect **keep**
- Testar em Chrome, Firefox e Edge
- Tamanho alvo do build: < 15 MB
- Considerar loading screen customizada para o carregamento do WASM

### 10.4 Máquina de Estados do Jogo

```
MENU → PLAYING → DAY_SUMMARY → PLAYING → ... → GAME_OVER
              ↕
          EVENT_POPUP
              ↕
          SHOP_MENU
```

---

## 11. Escopo e Prioridades

### 11.1 MVP (Must Have)

- [x] Movimentação do jogador
- [ ] Sistema de preparo de hambúrguer (chapa + montagem + entrega)
- [ ] Spawn e fila de clientes com timer de paciência
- [ ] Sistema financeiro básico (ganhar e gastar R$)
- [ ] Menu de upgrades com pelo menos 4 itens
- [ ] Contratação de 1 tipo de funcionário
- [ ] 5 dias de jogo com progressão
- [ ] Tela de resumo do dia
- [ ] 3 finais diferentes
- [ ] Menu principal
- [ ] Exportação Web funcional

### 11.2 Nice to Have

- [ ] Eventos aleatórios (ao menos 3)
- [ ] Efeitos sonoros completos
- [ ] Múltiplos tipos de funcionários (3)
- [ ] Expansões visuais do restaurante
- [ ] Animação de transição entre dias
- [ ] Tela de "Como Jogar"
- [ ] Dicas de empreendedorismo no fim do dia

### 11.3 Polimento (se sobrar tempo)

- [ ] Partículas de fumaça na chapa
- [ ] Partículas de moedas ao receber dinheiro
- [ ] Trilha sonora original
- [ ] Efeitos de clima (chuva no evento)
- [ ] Variação visual dos clientes (cores de roupa)
- [ ] Leaderboard local (melhor pontuação)

---

## 12. Cronograma Estimado

| Fase | Duração estimada | Entregas |
|---|---|---|
| **Pré-produção** | 1 semana | GDD finalizado, assets base, protótipo de movimentação |
| **Produção — Core** | 2 semanas | Gameplay loop completo, sistemas financeiro e de reputação |
| **Produção — Conteúdo** | 1 semana | 5 dias, upgrades, funcionários, eventos |
| **Arte e Áudio** | 1 semana (paralelo) | Sprites, tiles, UI art, SFX |
| **Integração e Polimento** | 1 semana | UI final, balanceamento, transições |
| **Testes e Exportação** | 3-5 dias | Testes de gameplay, exportação web, bugs |
| **Total estimado** | **~5-6 semanas** | — |

---

## 13. Referências e Inspirações

| Jogo | O que inspira |
|---|---|
| **Overcooked** | Caos divertido de cozinha, tempo limitado |
| **Cook, Serve, Delicious** | Gerenciamento de restaurante, upgrades |
| **Lemonade Stand** | Simplicidade e conceitos de empreendedorismo |
| **Papers, Please** | Decisões morais e mecânicas simples com profundidade |
| **Moonlighter** | Loop de loja + ação + upgrades |

---

## 14. Glossário

| Termo | Definição |
|---|---|
| **Blu** | Personagem principal jogável |
| **Vila Grelha** | Cidade onde o jogo se passa |
| **Reputação** | Métrica de 0-5 estrelas que afeta o fluxo de clientes |
| **Rush** | Momento de alta demanda de clientes |
| **VIP** | Cliente especial que paga mais mas é mais exigente |
| **Crítico** | Personagem do Dia 5 que determina o final |

---

*Documento criado para o projeto Blurgs — Todos os valores de balanceamento são estimativas iniciais e devem ser ajustados durante playtesting.*
