with franchise_week as (
    select 
        franchiseID,
        date(date_trunc('week', dateTime)) as week,
        count(distinct transactionID) as total_transactions,
        sum(totalPrice) / count(distinct transactionID) as avg_ticket_week
    from samples.bakehouse.sales_transactions
    group by 
        1, 2
)

, franchise_avg_windown as (
select
    franchiseID,
    week,
    total_transactions,
    avg_ticket_week,
    row_number() over(partition by franchiseID order by week desc) as filter_week,
    avg(avg_ticket_week) over (partition by franchiseID order by week rows between 3 preceding and current row) as avg_ticket_4w_ma,
    lag(avg_ticket_week) over (partition by franchiseID order by week) as avg_ticket_prev_week
from franchise_week
)

, final as (
select
    franchiseID,
    week,
    total_transactions,
    avg_ticket_week,
    avg_ticket_4w_ma,
    avg_ticket_prev_week,
    case
        when avg_ticket_prev_week is null or avg_ticket_prev_week = 0 then null
        else (avg_ticket_week - avg_ticket_prev_week) / avg_ticket_prev_week
    end as wow_ticket_change_pct
from
    franchise_avg_windown
where
    filter_week <= 8
)

select
    *
from
    final
order by
    franchiseID, week


-- Observações:

-- Agregando por semana, a semana corrente pode estar incompleta, dessa forma a comparação week over week seria 'injusta' (ex: 2 ou 3 da semana atual vs semana anterior completa ).

-- Em um cenário real, uma alternativa seria trabalhar com médias móveis diárias (ex: últimos 7, 28 ou 35 dias), reduzindo efeitos de sazonalidade de fim de semana e início/final de mês.

-- A média móvel é um indicador 'suave', mas acaba reagindo com atraso caso aconteça uma mudança bruscas no ticket médio.