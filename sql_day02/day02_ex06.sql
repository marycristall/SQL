WITH orders AS (
    SELECT m.pizza_name,
        pz.name AS pizzeria_name
    FROM person_order po
        JOIN menu m ON po.menu_id = m.id
        JOIN pizzeria pz ON pz.id = m.pizzeria_id
        JOIN person p ON po.person_id = p.id
    WHERE p.name = 'Anna'
        OR p.name = 'Denis'
)
SELECT *
FROM orders
ORDER BY pizza_name,
    pizzeria_name;