SELECT
  CASE
    WHEN data_pedido ~ '^\d{4}-\d{2}-\d{2}$' THEN to_date(data_pedido, 'YYYY-MM-DD')
    WHEN data_pedido ~ '^\d{2}-\d{2}-\d{4}$' THEN to_date(data_pedido, 'DD-MM-YYYY')
    ELSE NULL
  END AS data_formatada
FROM raw.pedidos