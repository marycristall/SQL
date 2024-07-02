set enable_seqscan to off;
EXPLAIN ANALYSE
SELECT m.pizza_name,
    p.name AS pizzeria_name
FROM menu m
    INNER JOIN pizzeria p ON m.pizzeria_id = p.id;