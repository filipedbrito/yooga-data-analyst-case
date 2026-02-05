with daily_sales_transactions as (
    select
        date(dateTime) as transaction_date,
        franchiseID,
        sum(totalPrice) as daily_revenue
    from samples.bakehouse.sales_transactions
    group by 
        1, 2
)

--- para um cenário real, a data início pode ser de o início de um período específico (ano/mês/semana), ou até a própria data de 'abertura' da franquia
, first_sale_franchise as (
    select
        franchiseID,
        min(transaction_date) as first_sale_date
    from daily_sales_transactions
    group by 
        1
)

--- para um cenário real, a data início pode ser de o fim de um período específico (ano/mês/semana), ou até a data corrente (considerando uma franquia em atividade)
, last_sale_franchise as (
    select
        franchiseID,
        max(transaction_date) as last_sale_date
    from daily_sales_transactions
    group by 
        1
)

--- o calendário se faz necessário para contemplar o caso de uma franquia não vender num dia e, por conta disso, não ter esse dia populado na tabela de transações. Com um calendário com todos os dias possíveis de uma franquia existindo da primeira até a última venda (poderia ser a data atual, também), essa ausência de vendas é considerada para soma acumulada
, calendar_franchise as (
    select
        distinct f.franchiseID,
        explode(sequence(f.first_sale_date, l.last_sale_date, interval 1 day)) as calendar_date
    from first_sale_franchise f
    cross join last_sale_franchise l
)

, final as (
    select
        c.franchiseID,
        c.calendar_date as transaction_date,
        coalesce(d.daily_revenue, 0) as daily_revenue, -- caso não tenha vendas no dia, o valor de receita diário da franquia será zero
        sum(coalesce(d.daily_revenue, 0)) over (partition by c.franchiseID order by c.calendar_date rows between unbounded preceding and current row) as cumulative_revenue
    from calendar_franchise c
    left join daily_sales_transactions d
        on c.franchiseID = d.franchiseID
        and c.calendar_date = d.transaction_date
)

select
    *
from
    final
order by 
    1,2


-- Obsevações:

-- - Identificada necessidade de criação de calendário por franquia para evitar distorções no cálculo da receita bruta acumulada em dias sem vendas.

-- - A franquia 3000046 tem um patamar de receita acumulada significativamente superior às demais,
-- Hipóteses: maior maturidade, volume de clientes ou ticket médio.

-- -- A franquia 3000047 inicia o período com comportamento próximo ao grupo médio mas apresenta aceleração a partir do dia 6, sugerindo um evento pontual.
-- Hipóteses: impacto de campanha, ajuste operacional ou sazonalidade.

-- - Franquias com crescimento linear e consistente caracterizam um perfil de vendas previsível e estável ao longo do período observado.

-- - O período de observação é limitado e não considera fatores como data de abertura da franquia ou sazonalidades de médio e longo prazo.