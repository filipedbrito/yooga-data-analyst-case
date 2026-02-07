with daily_sales_transactions as (
    select
        date(dateTime) as transaction_date,
        franchiseID,
        count(distinct transactionID) as daily_transactions,
        sum(totalPrice) as daily_revenue
    from samples.bakehouse.sales_transactions
    group by 
        1, 2
)

, first_sale_franchise as (
    select
        franchiseID,
        min(transaction_date) as first_sale_date
    from daily_sales_transactions
    group by 
        1
)

, last_sale_franchise as (
    select
        franchiseID,
        max(transaction_date) as last_sale_date
    from daily_sales_transactions
    group by 
        1
)

, calendar_franchise as (
    select
        distinct f.franchiseID,
        explode(sequence(f.first_sale_date, l.last_sale_date, interval 1 day)) as calendar_date
    from first_sale_franchise f
    cross join last_sale_franchise l
)

, week_base as (
    select
        c.franchiseID,
        date_trunc('week', c.calendar_date) as transaction_week,
        row_number() over (partition by c.franchiseID, date_trunc('week', c.calendar_date) order by calendar_date) as rn_weekday,
        coalesce(d.daily_revenue, 0) as daily_revenue,
        coalesce(d.daily_transactions, 0) as daily_transactions
    from calendar_franchise c
    left join daily_sales_transactions d
        on c.franchiseID = d.franchiseID
        and c.calendar_date = d.transaction_date
)

, last_week as (
    select
        max(transaction_week) as current_week
    from week_base
    group by franchiseID
)

, max_rn_current_week as (
    select
        max(w.rn_weekday) as max_rn_weekday
    from week_base w
    join last_week lw
        on w.transaction_week = lw.current_week
)

, aligned_weeks as (
    select
        w.franchiseID,
        w.transaction_week,
        sum(w.daily_revenue) as revenue,
        sum(w.daily_transactions) as transactions
    from week_base w
    join max_rn_current_week m
        on w.rn_weekday <= m.max_rn_weekday
    group by
        1,2
)

, final as (
select
    franchiseID,
    transaction_week,
    row_number() over (partition by franchiseID order by transaction_week desc) as rn_week,
    revenue as revenue_current_week,
    transactions as transactions_current_week,
    lag(revenue) over(partition by franchiseid order by transaction_week) as revenue_last_week,
    lag(transactions) over(partition by franchiseid order by transaction_week) as transactions_last_week
from aligned_weeks as aw
order by
    1, 2
)

select
    -- final.franchiseID,
    -- transaction_week,
    sum(revenue_current_week) as revenue_current_week,
    sum(transactions_current_week) as transactions_current_week,
    round(sum(revenue_current_week)/sum(transactions_current_week),2) as avg_ticket_current_week,
    sum(revenue_last_week) as revenue_last_week,
    sum(transactions_last_week) as transactions_last_week,
    round(sum(revenue_last_week)/sum(transactions_last_week),2) as avg_ticket_last_week
from final
join samples.bakehouse.sales_franchises as franchise
    on final.franchiseID = franchise.franchiseID

   