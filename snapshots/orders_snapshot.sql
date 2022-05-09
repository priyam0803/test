{% snapshot orders_snapshot %}

{{
    config(
      target_database='DBT_INTEGRATION',
      target_schema='PUBLIC',
      unique_key='ORDER_ID',
      strategy='check',
      check_cols='all',
      invalidate_hard_deletes=True,
    )
}}

select * from {{ source('source_test', 'orders') }}

{% endsnapshot %}