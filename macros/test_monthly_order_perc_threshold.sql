{% macro perc_check(column_name,model) %}

select count(*) From {{model}}
where {{column_name}} >=20

{% endmacro %}