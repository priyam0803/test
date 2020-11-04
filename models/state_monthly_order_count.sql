with state_monthly_order_count as
(
--Statewise monthly order count in 2017
    select S.STATE_NAME,MonthName(o.order_purchase_timestamp) as Month,Count(C.customer_order_id) as OrderCount_of_Month
  from Customer C
  JOIN STATE S ON c.customer_st=S.ST_CD
  JOIN Orders O on c.customer_order_id=o.customer_order_id and YEAR(o.order_purchase_timestamp)=2017
  group by S.STATE_NAME, Month
 order by STATE_NAME,Month
)

select * from state_monthly_order_count