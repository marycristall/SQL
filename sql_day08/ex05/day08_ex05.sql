-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #1
SELECT sum(rating)
FROM pizzeria;
-- Session #2
INSERT INTO pizzeria
VALUES (10, 'Kazan Pizza', 5);
COMMIT;
-- Session #1
SELECT sum(rating)
FROM pizzeria;
COMMIT;
SELECT sum(rating)
FROM pizzeria;
-- Session #2
SELECT sum(rating)
FROM pizzeria;