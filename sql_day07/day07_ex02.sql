(SELECT name, COUNT(*), 'order' AS action_type
 FROM person_order po
          INNER JOIN menu m ON m.id = po.menu_id
          INNER JOIN pizzeria p ON p.id = m.pizzeria_id
 GROUP BY name
 ORDER BY 2 DESC
 LIMIT 3)
UNION
(SELECT name, COUNT(*), 'visit' AS action_type
 FROM person_visits pv
          INNER JOIN pizzeria p ON p.id = pv.pizzeria_id
 GROUP BY name
 ORDER BY 2 DESC
 LIMIT 3)
ORDER BY 3, 2 DESC;