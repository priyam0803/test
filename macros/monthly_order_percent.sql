
{% macro order_percent_round(column_name, precision=2) %}
    ({{ column_name }})::numeric(16, {{ precision }})
{% endmacro %}
