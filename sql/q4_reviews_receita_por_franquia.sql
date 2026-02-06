with franchise_review as (
select
    franchiseID,
    count(distinct new_id) as total_reviews
from
    samples.bakehouse.media_customer_reviews
group by 
    1
)

, frenchise_revenue as (
select
    franchiseID,
    sum(totalPrice) as total_revenue,
    sum(totalPrice)/count(distinct transactionID) as avg_ticket -- distinct para evitar distorção numa possível granularidade por item/produto
from
    samples.bakehouse.sales_transactions
group by 
    1
)

select
    revenue.franchiseID,
    review.total_reviews,
    revenue.total_revenue,
    revenue.avg_ticket
from
    frenchise_revenue as revenue
    join franchise_review as review
        on revenue.franchiseID = review.franchiseID
order by 
    1, 2 desc 


-- Observações:

-- A relação entre volume de reviews e métricas financeiras é somente descritiva. Não é possível inferir causalidade já que reviews e vendas não são eventos necessariamente simultâneos ou associados (ex: dá pra fazer um review sem ter comprado, pode nem ser um review da mesma pessoa).

-- Franquias com maior volume de vendas tendem a concentrar mais reviews, o que pode colocar um viés na análise.

-- Em um cenário real, análises temporais ou associações diretas entre review e transação seriam necessárias pra uma conclusão mais sólida.