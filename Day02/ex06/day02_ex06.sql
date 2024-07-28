with selected_orders AS (
	select distinct
		person_order.menu_id
	from person_order
		inner join person on person_order.person_id = person.id
	where person.name = 'Denis' or person.name = 'Anna'
)
select
	menu.pizza_name,
	pizzeria.name as pizzeria_name
from menu
	inner join pizzeria on menu.pizzeria_id = pizzeria.id
	inner join selected_orders on menu.id = selected_orders.menu_id
order by 
	pizza_name, 
	pizzeria_name;