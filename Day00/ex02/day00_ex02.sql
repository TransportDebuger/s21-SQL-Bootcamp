
-- Variant 1 (ordered with ascending order)
select 
	pizzeria.name, pizzeria.rating 
from 
	pizzeria
where 
	pizzeria.rating >= 3.5 and pizzeria.rating <= 5
order by pizzeria.rating;

--Variant 2 (ordered with ascending order)
select 
	pizzeria.name, pizzeria.rating 
from 
	pizzeria
where 
	pizzeria.rating between 3.5 and 5
order by pizzeria.rating;