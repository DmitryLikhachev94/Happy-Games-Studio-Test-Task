INSERT INTO orders (user_id, total_price, created_at)
SELECT 
  FLOOR(RAND() * 1000000) + 1, 
  ROUND(RAND() * (10000000 - 5000) + 5000, 2), 
  DATE_ADD(NOW(), INTERVAL - FLOOR(RAND() * 730) DAY)
FROM seq_1_to_1000000 seq;

