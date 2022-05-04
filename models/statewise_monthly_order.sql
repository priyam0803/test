select S.STATE_NAME,MonthName(o.order_purchase_timestamp) as Month,C.customer_order_id
  from Customer C
  JOIN STATE S ON c.customer_st=S.ST_CD
  JOIN Orders O on c.customer_order_id=o.customer_order_id and YEAR(o.order_purchase_timestamp)={{ var('year','2017') }}--2017
