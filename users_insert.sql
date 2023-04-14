INSERT INTO users (name, email, created_at)
SELECT CONCAT('user_', number), CONCAT('user_', number, '@some_mail.com'), DATE_SUB(NOW(), INTERVAL 3 YEAR)
FROM (
  SELECT number
  FROM seq_1_to_1000000
) t;