SELECT
    location,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(CAST(REPLACE(REPLACE("approx_cost(for two people)", ',', ''), ' ', '') AS REAL)), 2) AS average_cost
FROM zomato
WHERE location IS NOT NULL
  AND TRIM(location) <> ''
  AND "approx_cost(for two people)" IS NOT NULL
GROUP BY location
HAVING COUNT(*) >= 100
ORDER BY restaurant_count DESC
LIMIT 10;