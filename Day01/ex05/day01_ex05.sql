select 
	person.*, 
	pizzeria.*
from
	person,
	person_visits,
	pizzeria

intersect

select 
	person.*, 
	pizzeria.*
from
	person,
	person_visits,
	pizzeria;