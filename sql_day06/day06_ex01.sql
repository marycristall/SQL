WITH work_table AS (
    SELECT po.person_id,
        m.pizzeria_id,
        COUNT(m.pizzeria_id) AS count,
        CASE
            WHEN (COUNT(m.pizzeria_id) = 1) THEN 10.5
            WHEN (COUNT(m.pizzeria_id) = 2) THEN 22
            ELSE 30
        END AS discount
    FROM person_order po
        JOIN menu m ON po.menu_id = m.id
    GROUP BY person_id,
        pizzeria_id
    ORDER BY 1
)
INSERT INTO person_discounts
SELECT ROW_NUMBER() OVER () AS id,
    wt.person_id,
    wt.pizzeria_id,
    wt.discount
FROM work_table wt;