# Notas

Este documento reúne observações e reflexões analíticas levantadas durante a resolução das questões do case, com o objetivo de explicitar o raciocínio adotado, hipóteses formuladas e limitações percebidas nos dados.

---

## Q1 – Evolução de receita

- Identificada a necessidade de criação de um calendário por franquia (da primeira à última transação) para evitar distorções no cálculo da receita bruta acumulada em dias sem vendas.
  
- A franquia 3000046 apresenta um patamar de receita acumulada significativamente superior às demais.  
  **Hipóteses:** maior maturidade da unidade, maior volume de clientes ou ticket médio mais elevado.
  
- A franquia 3000047 inicia o período com comportamento próximo ao grupo médio, mas acelera a partir do dia 6, sugerindo a ocorrência de um evento pontual.  
  **Hipóteses:** impacto de campanha, ajuste operacional ou efeito de sazonalidade local.
  
- Um grupo de franquias apresenta crescimento linear e consistente, caracterizando um perfil de vendas previsível e estável ao longo do período observado.
  
- O período de observação é limitado e não considera fatores como data de abertura da franquia ou sazonalidades de médio e longo prazo.

---

## Q2 – Recorrência por cliente

- A classificação baseada apenas no número total de transações fornece uma visão inicial de recorrência, mas não contempla contexto temporal nem financeiro.
  
- Clientes pouco recorrentes podem, ainda assim, representar alto valor agregado.
  
- Uma abordagem RFM permitiria uma segmentação mais precisa do perfil de clientes, incorporando recência, frequência e valor.

---

## Q3 – Ranking de clientes por receita

- O ranking foi construído com base na receita bruta acumulada por cliente dentro de cada franquia, permitindo identificar os clientes com maior participação financeira em cada unidade.
  
- Foi utilizado `row_number` para garantir exatamente cinco clientes por franquia, conforme solicitado no output esperado. Em um cenário real, o uso de `dense_rank` poderia ser mais adequado para respeitar empates de receita, ainda que isso implicasse mais de cinco clientes no ranking.
  
- Neste dataset, não se observa alta concentração de receita em poucos clientes. Em geral, o cliente com maior receita representa entre 3% e 7% do faturamento da franquia, e o top 5 entre 15% e 25%.
  
- Embora não seja um comportamento identificado aqui, uma concentração elevada de receita em poucos clientes poderia, em um cenário real, indicar dependência excessiva de um grupo restrito, representando um possível risco para a franquia.
  
- A análise considera todo o histórico disponível e não diferencia clientes ativos de clientes históricos. Em contextos reais, a aplicação de recortes temporais poderia alterar significativamente o ranking, priorizando clientes mais relevantes no período atual do ponto de vista de CRM.

---

## Q4 – Reviews e desempenho financeiro

- A análise relaciona volume de reviews com métricas financeiras por franquia, porém não permite inferir causalidade entre engajamento e desempenho financeiro.
  
- Reviews e vendas não são eventos necessariamente simultâneos. Um review pode estar associado a uma experiência anterior ou ocorrer fora da janela de vendas analisada.
  
- Franquias com maior volume de vendas tendem naturalmente a concentrar mais reviews, o que pode gerar viés de escala na interpretação dos dados.
  
- Embora o join restrinja a análise a franquias com ao menos um review, em cenários reais nem todo review está necessariamente associado a uma compra recente.
  
- Para análises mais conclusivas, seria necessário incorporar recorte temporal e associação entre review e transação, quando disponível.

---

## Q5 – Evolução do ticket médio e média móvel

- Ao agregar os dados por semana, a semana corrente pode estar incompleta, tornando a comparação week over week assimétrica (ex.: poucos dias da semana atual versus semana anterior completa).
  
- Em um cenário real, uma alternativa seria trabalhar com médias móveis diárias (ex.: últimos 7, 28 ou 35 dias), reduzindo efeitos de sazonalidade de fim de semana e início/final de mês.
  
- A média móvel é um indicador mais “suave”, porém tende a reagir com atraso quando ocorrem mudanças mais bruscas no ticket médio.
