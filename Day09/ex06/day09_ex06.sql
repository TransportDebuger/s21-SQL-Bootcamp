create or replace function
    fnc_person_visits_and_eats_on_date(in pperson varchar DEFAULT 'Dmitriy',
                                        in pprice numeric DEFAULT 500,
                                            in pdate date DEFAULT '2022-01-08')
returns table (
        name varchar
) as $$
    begin
        return QUERY
           select
                pizzeria.name
                from person_visits
                inner join person_order on person_order.person_id = person_visits.person_id
                inner join pizzeria ON person_visits.pizzeria_id = pizzeria.id
                inner join menu on menu.id = person_order.menu_id and menu.pizzeria_id = pizzeria.id
                inner join person on person.id = person_order.person_id and person.id = person_visits.person_id
                where person.name = pperson and visit_date = pdate and price < pprice;
   end;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');