# Insights Executivos — Desempenho Semanal das Franquias

Este dashboard ([link](https://dbc-905e5752-09c9.cloud.databricks.com/dashboardsv3/01f1022ebb671b5eaa6a1c610a731bad/published?o=7474647676028865)) foi construído para apoiar decisões executivas a partir da leitura consolidada do desempenho semanal das franquias,
com possibilidade de aprofundamento por país, porte e visão detalhada por unidade.

O período de observação adotado foi semanal pela limitação do período da base sintética de dados (samples.bakehouse).

As análises utilizam comparação semana a semana (WoW), garantindo consistência temporal entre semanas incompletas.

---

## 1. Leitura geral da semana (rede consolidada)

![1](/dashboard/screenshots/1_visao_geral_da_semana.png)

Na visão global (sem filtros aplicados), observa-se:

- **Queda moderada de receita (~-5% WoW)**  
- **Crescimento sutil de clientes ativos**
- **Aumento sutil da frequência média**
- **Redução do valor médio por transação**

Em conjunto, os dados indicam que a queda de receita **não está relacionada à perda de clientes**, mas a uma mudança no padrão de consumo:
mais compras, porém com menor valor médio.

O problema não está em atração ou engajamento, mas em **monetização**.

---

## 2. Evolução semanal dos indicadores

![2](/dashboard/screenshots/2_evolucao_por_semana.png)

A decomposição do resultado mostra que:

- O crescimento de clientes ativos e frequência compensou parcialmente a queda do valor médio;
- O efeito ainda é negativo para a receita total.

Isso permite separar as alavancas do negócio:
- base de clientes: saudável;
- recorrência: estável ou crescente;
- valor capturado por compra: em queda.

---

## 3. Distribuição de receita e concentração geográfica

![3](/dashboard/screenshots/3_share_de_receita.png)

A análise de participação de receita mostra dois pontos relevantes:

- **Estabilidade por porte de franquia**, sem mudanças relevantes de participação;
- **Mudança na distribuição por país**, com:
  - perda de participação de alguns mercados (ex: Itália);
  - aumento relativo de participação de Estados Unidos e Austrália.

Esse movimento reflete **realocação de participação**, e não necessariamente crescimento absoluto dos mercados que ganharam share.

---

## 4. Comparação por país

Ao observar os principais mercados individualmente:

### Itália
- Queda relevante de receita e clientes ativos;
- Valor médio elevado, mas com menor volume;
- Resultado mais dependente de poucos clientes com alto valor.

### Estados Unidos
- Crescimento consistente de receita;
- Expansão da base de clientes;
- Valor médio estável.

Indica um mercado mais equilibrado entre volume e valor.

### Austrália
- Queda simultânea de receita, clientes ativos e frequência;
- Mesmo com ganho relativo de participação, o desempenho absoluto piora.

Sinaliza necessidade de atenção operacional e comercial no curto prazo.

---

## 5. Oportunidades e sinais de atenção por franquia

![4](/dashboard/screenshots/4_oportunidades_e_riscos.png)

A classificação das franquias considera:
- escala de receita, definida pela posição relativa na distribuição (percentis 40 e 75);
- variação semanal da receita (queda, estabilidade ou crescimento).

Essa leitura permite:
- priorizar rapidamente franquias com impacto relevante negativo;
- identificar unidades que crescem mesmo partindo de uma base menor;
- direcionar ações de acompanhamento com foco em impacto.

---

## 6. Direcionamento para próximos aprofundamentos

A partir dessa visão inicial, os próximos passos são:

- aprofundar a análise nos mercados com maior concentração (Estados Unidos e Austrália);
- avaliar o desempenho por porte dentro desses países;
- focar nas franquias classificadas como atenção e potencial;
- incorporar métricas complementares (ex: satisfação do cliente), quando disponíveis.
