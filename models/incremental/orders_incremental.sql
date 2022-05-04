{{
    config(
        materialized='incremental',
        unique_key='ORDER_ID'
    )
}}


select s.* from "DBT_INTEGRATION"."PUBLIC"."ORDERS" s
left join "DBT_INTEGRATION"."PUBLIC"."ORDERS_INCREMENTAL" t
on s.ORDER_ID = t.ORDER_ID
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  --where t.md5_value is null
  --where md5_value not in (select md5_value from {{ this }})
  where s.ORDER_PURCHASE_TIMESTAMP > (select coalesce(max(ORDER_PURCHASE_TIMESTAMP),'1900-12-31')
   from {{ this }})
{% endif %}
