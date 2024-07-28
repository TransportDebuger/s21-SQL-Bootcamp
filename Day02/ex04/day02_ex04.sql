with prod_selected as(
    select 
	    menu.pizzeria_id,
	    menu.pizza_name,
	    menu.price
    from 
        menu
    where 
        menu.pizza_name = 'mushroom pizza' or 
        menu.pizza_name = 'pepperoni pizza'
)
select
	prod_selected.pizza_name,
	pizzeria.name as pizzeria_name,
	prod_selected.price
from
	pizzeria
	inner join prod_selected on pizzeria.id = prod_selected.pizzeria_id
order by 
    prod_selected.pizza_name, 
    pizzeria_name, 
    prod_selected.price desc;