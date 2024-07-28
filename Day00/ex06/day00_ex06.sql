select
	(
        select person.name 
        from person 
        where person.id = person_order.person_id
    ) as person_name, 
	(case when
		(select person.name from person where person.id = person_order.person_id) = 'Denis' 
			then true
		else false
		end) as calcfield
from
	person_order
where
	person_order.menu_id in (13, 14, 18) and
	person_order.order_date = '2022-01-07';