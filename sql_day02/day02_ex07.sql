SELECT pz.name
FROM person_visits pv
    JOIN person p ON p.id = pv.person_id
    AND p.name = 'Dmitriy'
    AND pv.visit_date = '2022-01-08'
    JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    JOIN menu m ON pv.pizzeria_id = m.pizzeria_id
    AND m.price < 800
