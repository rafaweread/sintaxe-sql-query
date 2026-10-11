WITH SELECT_PRODUTOS AS (
SELECT 
id_produto
,TRIM(nome_produto) AS nome_produto
,LOWER(TRIM(categoria)) AS categoria
,CAST(TRIM(REPLACE(LOWER(TRIM(preco_unitario)),'r$','')) AS NUMERIC) AS preco_unitario
,CASE WHEN LOWER(TRIM(ativo)) IN ('sim', 's', '1', 'true') THEN true
      WHEN LOWER(TRIM(ativo)) IN ('nao', 'mão', 'n', '0', 'false') THEN false
 ELSE false
 END AS ativo     
 FROM raw.produtos)
 SELECT id_produto, nome_produto, categoria, 
 CASE WHEN preco_unitario IS NULL THEN 0 ELSE preco_unitario END AS preco_unitario, 
 ativo 
 FROM SELECT_PRODUTOS