select distinct 
	person.id
from 
	person, 
    person_visits
where 
	person.id = person_visits.person_id and 
	(
		person_visits.visit_date between '2022-01-06' and '2022-01-09' or
		person_visits.pizzeria_id = 2
	)
order by person.id desc;