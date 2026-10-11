
SELECT 
    id_cliente
    ,TRIM(nome_completo) AS nome_completo
    ,CASE WHEN TRIM(email) = '' THEN NULL
      ELSE LOWER(TRIM(email))
      END AS email
    ,CAST(data_cadastro AS DATE) AS data_cadastro
    ,TRIM(cidade) AS cidade
    ,UPPER(TRIM(estado)) AS estado
    ,CASE WHEN ((email IS NULL) OR (TRIM(email) = '')) THEN 1
      ELSE 0
     END AS fl_email_nulo
     FROM raw.clientes 
     