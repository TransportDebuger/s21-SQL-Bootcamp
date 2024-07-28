select 
	--Anna (age:16,gender:'female',address:'Moscow')
	(person.name || ' (age:' || 
		person.age || ',gender:''' || 
		person.gender || ''',address:''' || 
		person.address || ''')') as person_information
from 
	person
order by
	person_information;