SELECT m.pizza_name,
    p.name AS pizzeria_name,
    m.price
FROM pizzeria p
    INNER JOIN menu m ON p.id = m.pizzeria_id
WHERE m.pizza_name = 'mushroom pizza'
    or m.pizza_name = 'pepperoni pizza'
ORDER BY pizza_name,
    pizzeria_name;