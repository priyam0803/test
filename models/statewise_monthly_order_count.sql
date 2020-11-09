with statewise_monthly_order_count as
(
--Statewise monthly order count in 2017
    select SO.STATE_NAME,So.Month,Count(SO.customer_order_id) as OrderCount_of_Month
  from ({{ ref('statewise_monthly_order') }}) SO
  group by SO.STATE_NAME, SO.Month
 order by SO.STATE_NAME,SO.Month
)

select * from statewise_monthly_order_count