with transaction_per_customer as (
select
    customerID,
    count(distinct transactionID) as total_transactions -- distinct partindo do princípio que uma mesma transação poderia contemplar mais de um produto (não é o caso, mas o distinct cobriria esse cenário)
from
    samples.bakehouse.sales_transactions
group by
    1
)

, final as (
select
    customerID,
    total_transactions,
    if(total_transactions <=5, 'Cliente Ocasional', 'Cliente Recorrente') as customer_type
from
    transaction_per_customer
)

select
    *
from
    final
order by
    2 desc


-- Obsevações:

-- A classificação de clientes baseada número total de transações fornece uma visão inicial de recorrência/engajamento, mas não contempla um contexto temporal e financeiro.
-- Clientes com poucas transações também podem representar alto valor (ticket médio elevado), enquanto clientes recorrentes podem ter baixo impacto financeiro (ainda sendo engajados).

-- Em um cenário real, essa análise poderia ter um período de observação bem amarrado (ex: últimos 90 dias), e considerar outras:
-- - Ticket médio por cliente
-- - Frequência média de compras em um período definido
-- - Recência da última transação

-- Uma abordagem RFM é um caminho para segmentar esses perfis e definir estratégias de retenção e engajamento.