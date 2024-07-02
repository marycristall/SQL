CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
        IN pperson varchar default 'Dmitriy',
        IN pprice numeric default 500,
        IN pdate date default '2022-01-08'
    ) RETURNS TABLE (name varchar) AS 
    $$
BEGIN RETURN QUERY
select p.name as pizzeria_name
from menu
    join pizzeria p on p.id = menu.pizzeria_id
    join person_visits pv on menu.pizzeria_id = pv.pizzeria_id
    join person p2 on p2.id = pv.person_id
where price < pprice
    and p2.name = pperson
    and visit_date = pdate
    ORDER BY 1 DESC;
    
END;
$$
LANGUAGE plpgsql;

select * from fnc_person_visits_and_eats_on_date(pprice := 800);
select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');