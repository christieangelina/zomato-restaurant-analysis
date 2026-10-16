SELECT
    online_order,
    COUNT(*) AS restaurant_count,
    ROUND(
        AVG(CAST(
            SUBSTR(TRIM(rate), 1, INSTR(TRIM(rate), '/') - 1)
            AS REAL
        )), 2
    ) AS average_rating
FROM zomato
WHERE online_order IN ('Yes', 'No')
  AND rate LIKE '%/5'
GROUP BY online_order
ORDER BY average_rating DESC;