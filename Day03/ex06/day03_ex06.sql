with 
	pizzas as (
		select
			menu.id,
			menu.pizza_name,
			menu.price,
			pizzeria.name as pizzeria_name
		from
			menu
			inner join pizzeria on menu.pizzeria_id = pizzeria.id
	)
select
	p1.pizza_name,
	p1.pizzeria_name as pizzeria_name1,
	p2.pizzeria_name as pizzeria_name2,
	p1.price
from
	pizzas as p1
	cross join pizzas as p2
where
	p1.pizza_name = p2.pizza_name and
	p1.price = p2.price and 
	p1.pizzeria_name != p2.pizzeria_name and 
	p1.id > p2.id