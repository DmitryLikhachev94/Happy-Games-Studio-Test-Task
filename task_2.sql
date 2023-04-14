SELECT u.id, u.name, round(AVG(o.total_price),2) AS avg_order_price
FROM users u
INNER JOIN orders o ON o.user_id = u.id
WHERE o.created_at >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY u.id, u.name;