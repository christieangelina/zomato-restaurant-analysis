SELECT
    TRIM(cuisines) AS cuisine,
    COUNT(*) AS restaurant_count,
    ROUND(
        AVG(
            CAST(
                SUBSTR(TRIM(rate), 1, INSTR(TRIM(rate), '/') - 1)
                AS REAL
            )
        ), 2
    ) AS average_rating
FROM zomato
WHERE cuisines IS NOT NULL
  AND TRIM(cuisines) <> ''
  AND rate LIKE '%/5'
GROUP BY TRIM(cuisines)
HAVING COUNT(*) >= 50
ORDER BY average_rating DESC, restaurant_count DESC
LIMIT 10;