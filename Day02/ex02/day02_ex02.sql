select
	(case 
		when (person.name is null) then '-' 
		else person.name 
	end) as person_name,
	bt.visit_date,
	(case 
		when (pizzeria.name is null) then '-' 
		else pizzeria.name 
	end) as pizzeria_name
from 
	(select 
		person_id, 
		pizzeria_id, 
		visit_date 
	from 
		person_visits 
	where 
		visit_date between '2022-01-01' and '2022-01-03') as bt
	full join person on bt.person_id = person.id
	full join pizzeria on bt.pizzeria_id = pizzeria.id
order by person_name, visit_date, pizzeria_name;