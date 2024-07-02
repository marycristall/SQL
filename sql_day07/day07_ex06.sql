SELECT pizzeria.name, count(menu_id) AS count_of_orders, ROUND(AVG(price)) AS average_price, MAX(price) AS max_price, MIN(price) AS min_price FROM pizzeria
JOIN menu m ON pizzeria.id = m.pizzeria_id
JOIN person_order po ON m.id = po.menu_id
GROUP BY pizzeria.name
ORDER BY pizzeria.name;