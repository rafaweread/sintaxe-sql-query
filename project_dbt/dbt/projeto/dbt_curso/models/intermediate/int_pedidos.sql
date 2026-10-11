
SELECT id_pedido, id_cliente, data_pedido, status, 
{{ agregacao_soma ('valor_bruto')}} AS valor_bruto_total,
{{ agregacao_soma ('valor_liquido')}} AS valor_liquido_total
FROM {{ ref('int_pedidos_itens_pedido')}}
GROUP BY id_pedido, id_cliente, data_pedido, status