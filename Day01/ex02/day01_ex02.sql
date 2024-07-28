select
	menu.pizza_name
from menu

intersect

select
	menu.pizza_name
from menu

order by pizza_name desc;