SELECT p.name
FROM person_order po
    JOIN person p ON po.person_id = p.id
    AND p.address IN ('Samara', 'Moscow')
    AND p.gender = 'male'
    JOIN menu m ON po.menu_id = m.id
    AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY p.name DESC

