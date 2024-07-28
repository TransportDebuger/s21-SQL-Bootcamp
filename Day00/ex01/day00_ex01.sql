select 
	person.name, person.age 
from 
	person
where
	person.address = 'Kazan' and 
	person.gender = 'female'
order by 
	person.name;