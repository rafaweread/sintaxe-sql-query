
{{ config(materialized='table')}}

SELECT DISTINCT
s.status, s.descricao
FROM {{ ref('fct_pedidos') }} p
LEFT JOIN {{ ref('status_mapeamento') }} s
ON p.status = s.status

