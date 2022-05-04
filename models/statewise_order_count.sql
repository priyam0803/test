
 --- Statewise order count in 2017
    select SO.STATE_NAME,Count(SO.customer_order_id) as OrderCount
  from ({{ ref('statewise_order') }}) SO
  group by SO.STATE_NAME
 order by SO.STATE_NAME

