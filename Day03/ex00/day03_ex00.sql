SELECT
	menu.pizza_name,
	menu.price,
	pizzeria.name as pizzeria_name,
	person_visits.visit_date
FROM
	person
	inner join person_visits on person.id = person_visits.person_id
	inner join pizzeria on person_visits.pizzeria_id = pizzeria.id
	inner join menu on pizzeria.id = menu.pizzeria_id
WHERE
	person.name = 'Kate' and 
	menu.price between 800 and 1000
order by
	pizza_name,
	price,
	pizzeria_name;