{% macro agregacao_soma (campo) %}
   SUM({{campo}})
{% endmacro %}