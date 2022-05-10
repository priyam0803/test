{% macro model_audit_end(model) %}

{% set sql %}
update MODEL_AUDIT_TB set run_status='completed',run_end_time=current_timestamp
where  model_name = '{{ model }}' and  run_status='started';

commit;
{% endset %}

{% do run_query(sql) %}
{% do log("Record updated", info=True) %}

{% endmacro %}