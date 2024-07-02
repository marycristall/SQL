 SELECT person_order.order_date,
    person.name || ' (age:' || person.age || ')' AS person_information
FROM person_order
    NATURAL JOIN (SELECT id AS person_id, age, name FROM person) person
ORDER BY order_date,
    person_information;
