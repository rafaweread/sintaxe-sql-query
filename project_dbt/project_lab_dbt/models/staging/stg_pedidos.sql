SELECT id_pedido, id_cliente,
COALESCE(
CASE WHEN data_pedido ~ '^\d{4}-\d{2}-\d{2}$' THEN TO_DATE(data_Pedido, 'YYYY-MM-DD')
     WHEN data_pedido ~ '^\d{2}-\d{2}-\d{4}$' THEN TO_DATE(data_Pedido, 'DD-MM-YYYY')
	 ELSE NULL END, DATE '1900-01-01') AS data_Pedido,
CASE WHEN status IS NULL OR TRIM(status) = '' THEN 'undefined'
     WHEN LOWER(TRIM(status)) IN ('canceled', 'cancelled') THEN 'canceled'
	 WHEN LOWER(TRIM(status)) IN ('completed', 'complete') THEN 'completed' 
ELSE LOWER(TRIM(status)) END AS status,	 
CASE WHEN forma_pagamento IS NULL OR TRIM(forma_pagamento) = '' THEN 'undefined'
ELSE LOWER(TRIM(forma_pagamento)) END AS forma_pagamento
FROM raw.pedidos