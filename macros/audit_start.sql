{% macro model_audit_start(model) %}

{% set sql %}
insert into DBT_INTEGRATION.PUBLIC.MODEL_AUDIT_TB(run_status,run_end_time,model_name,invocation_id)
values('started',null,'{{model}}','{{invocation_id}}');

commit;
{% endset %}

{% do run_query(sql) %}
{% do log("Record inserted", info=True) %}

{% endmacro %}


