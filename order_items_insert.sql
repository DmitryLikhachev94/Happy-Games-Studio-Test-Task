INSERT INTO order_items (order_id, product_name, price, quantity)
SELECT 
  MIN(id) AS order_id,
  CONCAT('Product_', FLOOR(RAND() * 10000)) AS product_name,
  ROUND(RAND() * (1000 - 10) + 10, 2) AS price,
  FLOOR(RAND() * 10) + 1 AS quantity
FROM orders
WHERE id BETWEEN 1 AND 2048560
GROUP BY RAND()
LIMIT 1000000;