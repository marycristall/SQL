WITH women AS (
    SELECT piz.name AS pizzeria_name,
        COUNT(piz.name) AS num_w
    FROM person_visits pv
        JOIN pizzeria piz ON pv.pizzeria_id = piz.id
        JOIN person p ON p.id = pv.person_id
        AND gender = 'female'
    GROUP BY piz.name
),
men AS (
    SELECT piz.name AS pizzeria_name,
        COUNT(piz.name) AS num_m
    FROM person_visits pv
        JOIN pizzeria piz ON pv.pizzeria_id = piz.id
        JOIN person p ON p.id = pv.person_id
        AND gender = 'male'
    GROUP BY piz.name
)
SELECT m.pizzeria_name
FROM women w
    JOIN men m ON m.pizzeria_name = w.pizzeria_name
    AND num_w <> num_m
ORDER BY pizzeria_name;