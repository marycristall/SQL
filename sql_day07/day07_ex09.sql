SELECT address,
    ROUND(MAX(age) - (MIN(age) / MAX(age)), 2)::float AS formula,
    ROUND(AVG(age), 2)::float AS average,
    ROUND(MAX(age) - (MIN(age) / MAX(age)), 2) > ROUND(AVG(age), 2)::float AS comparison
FROM person
GROUP BY address
ORDER BY 1;