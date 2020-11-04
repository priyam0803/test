with report as
(
select T1.State_name,T1.OrderCount as totalOrders,T2.Month,T2.OrderCount_of_Month, (T2.OrderCount_of_Month/T1.OrderCount)*100 as monthly_order_percentage
From
 (select S.STATE_NAME,Count(C.customer_order_id) as OrderCount
  from Customer C
  JOIN STATE S ON c.customer_st=S.ST_CD
  JOIN Orders O on c.customer_order_id=o.customer_order_id and YEAR(o.order_purchase_timestamp)=2017
  group by S.STATE_NAME
 order by STATE_NAME)T1
 JOIN (    select S.STATE_NAME,MonthName(o.order_purchase_timestamp) as Month,Count(C.customer_order_id) as OrderCount_of_Month
  from Customer C
  JOIN STATE S ON c.customer_st=S.ST_CD
  JOIN Orders O on c.customer_order_id=o.customer_order_id and YEAR(o.order_purchase_timestamp)=2017
  group by S.STATE_NAME, Month
 order by STATE_NAME,Month  ) T2 ON T1.STATE_name=T2.State_name
)

select * from report