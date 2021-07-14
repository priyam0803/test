
select
    state_name,
    month,
    monthly_order_percentage
from {{ ref('monthwise_order_perc' )}}
where  (monthly_order_percentage< 0)
