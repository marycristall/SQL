WITH num_visits AS (
    select name,
        COUNT(pizzeria_id) AS count_of_visits
    FROM person
        JOIN person_visits pv ON person.id = pv.person_id
    GROUP BY name
)

 SELECT * FROM num_visits WHERE num_visits.count_of_visits > 3;