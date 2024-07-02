insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH id_name_cur as (SELECT DISTINCT currency.id, currency.name
                           FROM currency)
                           
SELECT COALESCE (u.name, 'not defined') AS name,
       COALESCE (u.lastname, 'not defined') AS lastname,
       i.name AS currency_name,
       COALESCE(
               (SELECT rate_to_usd
                FROM currency c
                WHERE b.currency_id = c.id
                  AND c.updated < b.updated
                ORDER BY c.updated DESC
               LIMIT 1),
               (SELECT rate_to_usd
                FROM currency c
                WHERE b.currency_id = c.id
                  AND c.updated > b.updated
                ORDER BY c.updated
                LIMIT 1)
       ) * money::float          AS currency_to_usd
       FROM  balance b
        JOIN id_name_cur i ON b.currency_id = i.id
       LEFT JOIN "user" u ON u.id = b.user_id
       ORDER BY 1 DESC, 2, 3;