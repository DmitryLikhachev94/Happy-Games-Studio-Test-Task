SELECT 
    o.user_id, 
    COUNT(*) AS order_count, 
    AVG(CASE 
            WHEN o.created_at >= DATE_SUB(LAST_DAY(NOW() - INTERVAL 1 MONTH), INTERVAL 1 MONTH) 
            THEN o.total_price 
        END) AS avg_last_month_total_price
FROM 
    orders o
WHERE 
    o.created_at >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
GROUP BY 
    o.user_id
ORDER BY 
    order_count DESC 
LIMIT 
    10;