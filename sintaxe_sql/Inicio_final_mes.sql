SELECT 
    CASE 
        WHEN EXTRACT(DAY FROM CURRENT_DATE) <= 3 
        THEN date_trunc('month', CURRENT_DATE - INTERVAL '1 month')
        ELSE date_trunc('month', CURRENT_DATE)
    END AS data_ini,

    CASE 
        WHEN EXTRACT(DAY FROM CURRENT_DATE) <= 3 
        THEN (date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')
        ELSE (date_trunc('month', CURRENT_DATE) + INTERVAL '1 month - 1 day')
    END AS data_fim;