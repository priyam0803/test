{% test perc_check(model, column_name) %}

select * From {{ model }} 
where {{ column_name }} >= 20

{% endtest %}