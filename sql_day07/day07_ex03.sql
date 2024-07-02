WITH visits AS (
    SELECT pizzeria.name,
        COUNT(*) as total_count
    FROM person_visits
        JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.name
),
orders AS (
    SELECT pizzeria.name,
        COUNT(*) as total_count
    FROM person_order
        JOIN menu ON menu.id = person_order.menu_id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY pizzeria.name
)
SELECT pizzerias.name,
    SUM(pizzerias.total_count) AS total_count
FROM (
        SELECT *
        FROM visits
        UNION ALL
        SELECT *
        FROM orders
    ) AS pizzerias
GROUP BY pizzerias.name
ORDER BY total_count DESC;