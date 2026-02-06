# Yooga – Case Técnico | Analista de Dados

Este repositório contém a resolução do Case Técnico para a vaga de Analista de Dados na Yooga.

O objetivo do case é demonstrar competências técnicas e analíticas a partir de um dataset sintético que simula dados operacionais de uma rede de franquias do setor alimentício, permitindo análises relacionadas a desempenho financeiro, comportamento de clientes e apoio à tomada de decisão.

---

## Ambiente

- **Databricks Free Edition**
- **Databricks SQL**
- Dataset público: `samples.bakehouse`

> As queries foram desenvolvidas para execução direta no ambiente do Databricks, utilizando as tabelas públicas do dataset Bakehouse.  
> Não há dependência de execução local.

Para execução das queries:

1. Criar uma conta no **Databricks Free Edition**  
2. Acessar o **Databricks SQL Editor**
3. Executar as queries disponíveis na pasta `/sql`
4. Todas as queries utilizam exclusivamente tabelas do schema `samples.bakehouse`

> As queries são independentes entre si e podem ser executadas separadamente.

---

## Organização do material

- **Resumo das questões (`resumo_do_case.md`)**  
  Compila os principais achados e leituras durante a resolução das questões, focando na interpretação dos dados e implicações práticas.

- **Notas analíticas (`sql/notas_analiticas.md`)**  
  Observações, hipóteses e limitações levantadas durante a resolução das questões.

- **Execução técnica (`sql/`)**  
  Queries SQL desenvolvidas para as questões propostas.

---

## Estrutura do repositório

```text

├── dashboard/
│
├── sql/
│   ├── notas_analiticas.md
│   ├── q1_evolucao_de_receita.sql
│   ├── q2_recorrencia_por_cliente.sql
│   ├── q3_ranking_clientes.sql
│   ├── q4_reviews_vs_receita.sql
│   └── q5_evolucao_ticket_medio_semanal.sql
│
├── README.md
│
└── resumo_questoes.md
