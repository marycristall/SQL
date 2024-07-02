SELECT p.name, count(*) as count_of_visits from person_visits
JOIN person p on person_visits.person_id = p.id
GROUP BY p.name
ORDER BY count_of_visits desc, p.name limit 4;