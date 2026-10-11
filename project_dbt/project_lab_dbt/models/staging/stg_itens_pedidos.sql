WITH SELECT_ITENS_PEDIDO AS (
	SELECT 
		id_item_pedido, 
		id_pedido, 
		id_produto, 
		CASE WHEN quantidade <= 0 THEN 0
			ELSE quantidade 
		END AS quantidade,
		-- Uso do NULLIF para tratar a string vazia antes do CAST
		COALESCE(CAST(NULLIF(REGEXP_REPLACE(preco_unitario::TEXT, '[^0-9.]', '', 'g'), '') AS NUMERIC), 0) AS preco_unitario,
		COALESCE(CAST(NULLIF(REGEXP_REPLACE(desconto::TEXT, '[^0-9.]', '', 'g'), '') AS NUMERIC), 0) AS desconto
	FROM raw.itens_pedido
)
SELECT 
	SELECT_ITENS_PEDIDO.*, 
	CASE WHEN quantidade <= 0 THEN 1
		ELSE 0 
	END AS fl_quantidade_invalida, 
	CASE WHEN preco_unitario <= 0 THEN 1
		ELSE 0 
	END AS fl_preco_unitario_nulo
FROM 
	SELECT_ITENS_PEDIDO