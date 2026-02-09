# Yooga — Case Técnico | Analista de Dados

Este repositório contém a resolução do Case Técnico para a vaga de Analista de Dados na Yooga.

O objetivo do case é demonstrar a capacidade de estruturar análises e extrair insights relevantes a partir de dados operacionais de uma rede de franquias do setor alimentício, apoiando a tomada de decisão estratégica.

O foco da entrega não está apenas nos números, mas na interpretação dos dados, identificação de padrões e direcionamento de ações de negócio.

---

## Ambiente e ferramentas

- **Databricks Free Edition**
- **Databricks SQL**
- Dataset público: `samples.bakehouse`

> Todas as análises foram desenvolvidas diretamente no ambiente do Databricks SQL, utilizando exclusivamente as tabelas públicas do dataset Bakehouse.
> Não há dependência de execução local.

### Execução das queries

1. Criar uma conta no **Databricks Free Edition**
2. Acessar o **Databricks SQL Editor**
3. Executar as queries disponíveis na pasta `/sql`
4. Todas as queries utilizam o schema `samples.bakehouse`

> As queries são independentes entre si e podem ser executadas separadamente.

---

## Dashboard analítico 

O dashboard ([link](https://dbc-905e5752-09c9.cloud.databricks.com/dashboardsv3/01f1022ebb671b5eaa6a1c610a731bad/published?o=7474647676028865)) - também no ambiente do Databricks - foi construído com foco executivo e permite:

- acompanhamento do desempenho semanal consolidado;
- comparação entre semanas (WoW);
- análise da evolução de receita, clientes ativos, frequência e valor médio;
- leitura da distribuição de receita por país e porte da franquia;
- identificação de franquias com sinais de atenção ou oportunidade da perspectiva de monetização.

Prints das principais visões estão disponíveis em: dashboard/screenshots/

---

## Insights e interpretação dos dados

Os principais insights extraídos do dashboard estão documentados em:

- **`dashboard/insights.md`**

O documento apresenta uma leitura executiva e objetiva dos dados, destacando:
- comportamento geral da semana;
- relação entre os principais indicadores;
- concentração de receita por país;
- análise direcionada por mercado;
- sinais de atenção e oportunidades por franquia.

---

## Organização do repositório

```text
├── dashboard/
│   ├── screenshots/
│   │   ├── 1_visao_geral_da_semana.png
│   │   ├── 2_evolucao_por_semana.png
│   │   ├── 3_share_de_receita.png
│   │   └── 4_oportunidades_e_riscos.png
│   └── insights.md
│
├── sql/
│   ├── notas_analiticas.md
│   ├── q1_evolucao_de_receita.sql
│   ├── q2_recorrencia_por_cliente.sql
│   ├── q3_ranking_receita_cliente_franquia.sql
│   ├── q4_reviews_vs_receita.sql
│   └── q5_evolucao_ticket_medio_semanal.sql
│
├── README.md
