with ordered_menu as(
	select distinct
		person_order.menu_id as "id"
	from
		person_order
)
select
	menu.pizza_name,
	menu.price,
	pizzeria.name as pizzeria_name
from
	menu
	inner join pizzeria on menu.pizzeria_id = pizzeria.id
where
	menu.id not in (select ordered_menu.id from ordered_menu)
order by pizza_name, price;