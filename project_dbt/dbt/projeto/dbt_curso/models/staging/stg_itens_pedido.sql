WITH SELECT_ITENS_PEDIDO AS (
SELECT id_item_pedido, id_pedido, id_produto
, CASE WHEN quantidade <= 0 THEN 0
ELSE quantidade END AS quantidade
, COALESCE(CAST(REGEXP_REPLACE(preco_unitario,'[^0-9.]','','g') AS NUMERIC),0) AS preco_unitario
, COALESCE(CAST(REGEXP_REPLACE(desconto,'[^0-9.]','','g') AS NUMERIC),0) AS desconto
FROM raw.itens_pedido)
SELECT SELECT_ITENS_PEDIDO.*
, CASE WHEN quantidade <= 0 THEN 1
ELSE 0 END AS fl_quantidade_invalida
, CASE WHEN preco_unitario <= 0 THEN 1
ELSE 0 END AS fl_preco_unitario_nulo
FROM SELECT_ITENS_PEDIDO