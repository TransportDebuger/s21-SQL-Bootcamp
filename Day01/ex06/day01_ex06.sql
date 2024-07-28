select
	person_order.order_date as action_date,
	(select 
        person.name 
    from 
        person 
    where 
        person.id = person_order.person_id) as person_name
from
	person_order

intersect

select
	person_visits.visit_date as action_date,
	(select 
        person.name 
    from 
        person 
    where 
        person.id = person_visits.person_id) as person_name
from
	person_visits

order by action_date asc, person_name desc;