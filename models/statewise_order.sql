

select S.STATE_NAME,C.customer_order_id,'{{ invocation_id}}' as invocation_id
  from {{ source('source_test','customer')}} C
  JOIN {{ source('source_test','state')}} S ON c.customer_st=S.ST_CD
  JOIN {{ source('source_test','orders')}} O on c.customer_order_id=o.customer_order_id and YEAR(o.order_purchase_timestamp) = {{ var(order_year,2017) }}

