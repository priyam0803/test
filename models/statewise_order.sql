with statewise_order as
(
select S.STATE_NAME,C.customer_order_id
  from Customer C
  JOIN STATE S ON c.customer_st=S.ST_CD
  JOIN Orders O on c.customer_order_id=o.customer_order_id and YEAR(o.order_purchase_timestamp)={{ var('year','2017') }}--2017
)

select * From statewise_order
--
