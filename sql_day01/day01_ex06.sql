SELECT visit_date AS action_date,
    (
        SELECT name
        from person
        where id = person_id
    ) AS person_name
FROM person_visits
INTERSECT
SELECT order_date AS action_date,
    (
        SELECT name
        from person
        where id = person_id
    ) AS person_name
FROM person_order
ORDER BY action_date,
    person_name DESC;