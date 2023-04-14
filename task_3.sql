WITH cur12month AS
(SELECT
    DATE_FORMAT(created_at, '%M') AS month,
    DATE_FORMAT(created_at, '%Y') AS year,
    ROUND(AVG(total_price),2) AS avg_total_price,
    (MONTH(created_at) + (YEAR(created_at) - YEAR(NOW())) * 12) AS month_order
FROM
    orders
WHERE
    created_at >= DATE_SUB(NOW(), INTERVAL 12 MONTH)
    AND (MONTH(created_at), YEAR(created_at)) != (MONTH(now()), YEAR(now())-1)
GROUP BY
    YEAR(created_at),
    MONTH(created_at)
ORDER BY 
    month_order DESC),

prev12month AS
(SELECT
    DATE_FORMAT(created_at, '%M') AS month,
    DATE_FORMAT(created_at, '%Y') AS year,
    ROUND(AVG(total_price),2) AS avg_total_price,
    (MONTH(created_at) + (YEAR(created_at) - YEAR(NOW())) * 12) AS month_order
FROM
    orders
WHERE
    (DATE_SUB(NOW(), INTERVAL 12 MONTH) > created_at AND created_at >= DATE_SUB(NOW(), INTERVAL 24 MONTH))
    and (MONTH(created_at), YEAR(created_at)) != (MONTH(now()), YEAR(now())-2)
GROUP BY
    YEAR(created_at),
    MONTH(created_at)
ORDER BY 
    month_order DESC)
SELECT c.month, c.year AS cur12month, c.avg_total_price AS cur12month_avg, 
p.year AS prev12month, p.avg_total_price AS prev12month_avg,
c.avg_total_price - p.avg_total_price AS difference
FROM cur12month c
INNER JOIN prev12month p
ON c.month=p.month