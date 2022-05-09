select SO.STATE_NAME,So.Month,Count(SO.customer_order_id) as OrderCount_of_Month,'{{ invocation_id}}' as invocation_id
  from ({{ ref('statewise_monthly_order') }}) SO
  group by SO.STATE_NAME, SO.Month
 order by SO.STATE_NAME,SO.Month
