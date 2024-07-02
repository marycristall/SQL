CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10) RETURNS SETOF integer LANGUAGE SQL AS $fibonacci$ WITH RECURSIVE fib(a, b) AS (
        SELECT 0 AS a,
            1 as b
        UNION ALL
        SELECT b,
            a + b
        FROM fib
        WHERE b < pstop
    )
SELECT a
FROM fib;
$fibonacci$;
-- To check yourself and call a function, you can make a statements like below.
select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();