
with state_order_count as
(
 --- Statewise order count in 2017
    select S.STATE_NAME,Count(C.customer_order_id) as OrderCount
  from Customer C
  JOIN STATE S ON c.customer_st=S.ST_CD
  JOIN Orders O on c.customer_order_id=o.customer_order_id and YEAR(o.order_purchase_timestamp)=2017
  group by S.STATE_NAME
 order by STATE_NAME
)

select * from state_order_count
--i am happy