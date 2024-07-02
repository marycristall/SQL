WITH summ AS 
(SELECT b.user_id, b.currency_id, b.type, SUM(b.money) FROM balance b GROUP BY user_id, currency_id, b.type),

last_course (id, name, rate_to_usd, updated) AS 
(SELECT id, c.name, rate_to_usd, 
ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated DESC) 
FROM currency c GROUP BY id, name, rate_to_usd, updated)

SELECT COALESCE (u.name, 'not defined') AS name,
       COALESCE (u.lastname, 'not defined') AS lastname,
       s.type AS type,
       s.sum  AS volume,
     COALESCE(lc.name, 'not defined') AS currency_name,
    COALESCE(lc.rate_to_usd, 1) AS last_rate_to_usd,
     s.sum * COALESCE(lc.rate_to_usd, 1)::float AS total_volume_in_usd
    FROM summ s
    LEFT JOIN "user" u  ON s.user_id = u.id 
    LEFT JOIN last_course lc ON s.currency_id = lc.id AND lc.updated = 1
    ORDER BY 1 DESC, 2 ASC, 3 ASC; 