SELECT address, p.name, count(po.person_id) count_of_orders FROM person
JOIN person_order po ON person.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria p ON p.id = m.pizzeria_id
GROUP BY address, p.name
ORDER BY address, p.name;