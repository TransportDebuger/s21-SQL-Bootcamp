select
	person_order.order_date,
	(person_tmp.name || '(age:' || person_tmp.age || ')') as person_information
from person_order
natural join 
    (select 
        person.id as person_id, 
        person.name, 
        person.age 
    from person) as person_tmp
order by person_order.order_date asc, person_information asc;