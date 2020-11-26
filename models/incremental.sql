{{
    config(
        materialized='incremental',
        unique_key='md5_value'
    )
}}


select s.ST_CD,s.STATE_NAME,s.MD5_VALUE from "DEMO_DB"."PUBLIC"."STATE" s
left join "DEMO_DB"."PUBLIC"."INCREMENTAL" t
on s.md5_value = t.md5_value
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where t.md5_value is null
  --where md5_value not in (select md5_value from {{ this }})
  --where created_on > (select max(created_on) from {{ this }})
{% endif %}