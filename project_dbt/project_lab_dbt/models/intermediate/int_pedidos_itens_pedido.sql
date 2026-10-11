SELECT 
    p.id_PEDIDO,
    p.id_cliente,
    p.data_pedido,
    p.status,
    i.id_Produto,
    i.quantidade,
    i.preco_unitario,
    i.desconto

FROM
    {{ref('stg_pedidos')}} p
INNER JOIN {{ref('stg_itens_pedidos')}} i ON p.id_pedido = i.id_pedido
WHERE i.fl_quantidade_invalida = 0 
AND i.fl_preco_unitario_nulo = 0