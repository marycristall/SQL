SELECT pizza_name,
    price,
    p.name AS pizzeria_name
FROM menu m
    LEFT JOIN person_order po ON m.id = po.menu_id
    JOIN pizzeria p ON m.pizzeria_id = p.id
WHERE menu_id IS NULL
ORDER BY pizza_name,
    price;