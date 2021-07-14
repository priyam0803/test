
select S.STATE_NAME,MonthName(cast(o.order_purchase_timestamp as date)) as Month,C.customer_order_id
  from Customer C
  JOIN STATE S ON c.customer_st=S.ST
  JOIN Orders O on c.customer_order_id=o.customer_order_id and YEAR(cast(o.order_purchase_timestamp as date))={{ var('year','2017') }}--2017
