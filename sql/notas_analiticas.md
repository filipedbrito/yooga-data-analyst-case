# Notas

Este documento reúne observações e reflexões analíticas levantadas durante a resolução das questões do case, com o objetivo de explicitar o raciocínio adotado, hipóteses formuladas e limitações percebidas nos dados.

---

## Q1 – Evolução de receita

- Identificada a necessidade de criação de um calendário por franquia (da primeira à última transação) para evitar distorções no cálculo da receita bruta acumulada em dias sem vendas.
  
- A franquia 3000046 apresenta um patamar de receita acumulada significativamente superior.  
  **Hipóteses:** maior maturidade da unidade, maior volume de clientes ou ticket médio mais elevado.
  
- A franquia 3000047 inicia o período com comportamento próximo ao grupo médio, mas acelera a partir do dia 6, sugerindo a ocorrência de um evento pontual.  
  **Hipóteses:** impacto de campanha, ajuste operacional ou efeito de sazonalidade local.
  
- Franquias com crescimento linear e consistente caracterizam um perfil de vendas previsível e estável ao longo do período observado.
  
- O período de observação é limitado e não considera fatores como data de abertura da franquia ou sazonalidades de médio e longo prazo.

---

## Q2 – Recorrência por cliente

- A classificação baseada apenas no número total de transações fornece uma visão inicial de recorrência, mas não contempla contexto temporal nem financeiro.
  
- Clientes pouco recorrentes podem representar alto valor agregado.
  
- Uma abordagem RFM permitiria uma segmentação mais precisa do perfil de clientes, incorporando recência, frequência e valor.

---

## Observações Gerais

- O período analisado é curto e não permite inferências mais robustas sobre sazonalidade.
  
- As métricas devem ser interpretadas considerando o estágio de maturidade de cada franquia.
