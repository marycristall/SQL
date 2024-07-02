WITH all_p AS (
    SELECT p.gender,
        piz.name
    FROM person p
        JOIN person_order po on p.id = po.person_id
        JOIN menu m ON po.menu_id = m.id
        JOIN pizzeria piz on m.pizzeria_id = piz.id
),
men AS (
    SELECT name
    FROM all_p
    WHERE gender = 'male'
),
women AS (
    SELECT name
    FROM all_p
    WHERE gender = 'female'
)
SELECT name AS pizzeria_name
FROM women
EXCEPT
SELECT name AS pizzeria_name
FROM men;