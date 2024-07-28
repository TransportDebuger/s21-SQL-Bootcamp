select
	person.name
from
	menu
	inner join person_order on menu.id = person_order.menu_id
	inner join person on person_order.person_id = person.id
where
	(pizza_name = 'pepperoni pizza' or
	    pizza_name = 'mushroom pizza') and 
	(person.address = 'Moscow' or 
	    person.address = 'Samara') and
	person.gender = 'male'
order by 
    person.name desc;