with revenue_customer_franchise as (
select
    franchiseID,
    customerID,
    sum(totalPrice) as customer_revenue
from
    samples.bakehouse.sales_transactions
group by 
    1,2
) 

, percent_revenue as (
select
    franchiseID,
    customerID,
    customer_revenue,
    sum(customer_revenue) over(partition by franchiseID) as franchise_revenue,
    customer_revenue/(sum(customer_revenue) over(partition by franchiseID))*100.00 as revenue_share_pct
from
    revenue_customer_franchise
)

, final as (
select
    *,
    row_number() over(partition by franchiseID order by customer_revenue desc) as revenue_rank 
--- o row number corresponde ao output esperado, porém, desconsidera que mesmos clientes podem ter a mesma receita bruta por franquia e, nesse caso, ocupariam a mesma posição no rank. Dense_rank faria mais sentido, mas poderiam ter mais de 5 clientes
from
    percent_revenue
)

select
    *
from
    final
where
    revenue_rank <= 5
order by franchiseID, revenue_rank


-- Observações

-- O uso de row_number garante exatamente 5 clientes por franquia, conforme o output esperado. Em um cenário real, dense_rank poderia ser mais adequado para respeitar empates de receita

-- Nesse dataset não há evidência de alta concentração de receita em poucos clientes (top 1 de 3% a 7% da receita, top 5 de 15% a 25%). Num cenário real, participações elevadas poderiam indicar dependência excessiva de um grupo específico de clientes, sendo um possível risco

-- Por considerar todo o histórico, o ranking pode incluir clientes que tiveram relevância no passado, mas que hoje não representam mais o mesmo impacto para a franquia. Não é o caso desse dataset (janela de menos de 1 mês) mas, num cenário real, poderia ter um cliente que comprou muito há 1 ano e não comprou mais. Da mesma forma que um cliente com share baixo pode ter uma frequência alta mais recentemente. Do ponto de vista de CRM, isso seria enganoso
