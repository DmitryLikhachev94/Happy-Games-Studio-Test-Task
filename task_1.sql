SELECT u.id, u.name, COUNT(*) AS total_orders
FROM users u
INNER JOIN orders o ON o.user_id = u.id
GROUP BY u.id, u.name
HAVING COUNT(*) > 10;