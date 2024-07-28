with s_p as (
	select
		person_visits.pizzeria_id as "id"
	from person
		inner join person_visits on person.id = person_visits.person_id
	where
		person.name = 'Dmitriy' and visit_date = '2022-01-08'
)
select
	pizzeria.name as pizeria_name
from 
	pizzeria
	inner join menu on pizzeria.id = menu.pizzeria_id
where
	pizzeria.id in (select "id" from s_p) and 
	menu.price < 800;