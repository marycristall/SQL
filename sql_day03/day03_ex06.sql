SELECT m_1.pizza_name,
    (
        SELECT name
        FROM pizzeria pz
        WHERE pz.id = m_1.pizzeria_id
    ) AS pizzeria_name_1,
    (
        SELECT name
        FROM pizzeria pz
        WHERE pz.id = m_2.pizzeria_id
    ) AS pizzeria_name_2,
    m_1.price
FROM menu AS m_1
    JOIN menu AS m_2 ON m_2.price = m_1.price
    AND m_1.pizza_name = m_2.pizza_name
    AND m_1.pizzeria_id > m_2.pizzeria_id
ORDER BY pizza_name;