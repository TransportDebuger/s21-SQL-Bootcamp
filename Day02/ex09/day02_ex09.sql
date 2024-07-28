with p_lovers as (
    select 
	    person_order.person_id
    from
	    menu
	inner join person_order on menu.id = person_order.menu_id
    where 
	    menu.pizza_name = 'cheese pizza'

    intersect

    select 
	    person_order.person_id
    from
	    menu
	inner join person_order on menu.id = person_order.menu_id
    where 
	    menu.pizza_name = 'pepperoni pizza'
)
select
	person.name
from
	person
where
	person.id in (select person_id from p_lovers) and
	person.gender = 'female'
order by 
    person.name;