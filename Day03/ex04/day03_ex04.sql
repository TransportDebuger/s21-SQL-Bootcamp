with
	w_haveorder as (
		select
			pizzeria.name as pizzeria_name
		from
			pizzeria
			inner join menu on pizzeria.id = menu.pizzeria_id
			inner join person_order on menu.id = person_order.menu_id
			inner join person on person_order.person_id = person.id
		where
			person.gender = 'female'
	),
	m_haveorder as (
		select
			pizzeria.name as pizzeria_name
		from
			pizzeria
			inner join menu on pizzeria.id = menu.pizzeria_id
			inner join person_order on menu.id = person_order.menu_id
			inner join person on person_order.person_id = person.id
		where
			person.gender = 'male'
	)
(select
	pizzeria_name
from
	w_haveorder

except

select
	pizzeria_name
from
	m_haveorder
)

union

(select
	pizzeria_name
from
	m_haveorder

except

select
	pizzeria_name
from
	w_haveorder
)
order by 1;
