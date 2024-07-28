select 
	person.id as object_id,
	person.name as object_name
from
	person

union
select
	menu.id as object_id,
	menu.pizza_name as object_name
from
	menu

order by object_id, object_name;