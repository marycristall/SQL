SELECT p.name FROM person p
    JOIN person_order po 
        ON po.person_id = p.id 
            AND p.gender = 'female' 
            AND p.id IN (SELECT person_id FROM person_order po
                        JOIN menu m ON po.menu_id = m.id AND m.pizza_name = 'pepperoni pizza')
    JOIN menu m ON m.id = po.menu_id AND m.pizza_name = 'cheese pizza' 
    ORDER BY p.name
