SELECT
	person.name AS person_name,
	menu.pizza_name,
	menu.price,
	(menu.price / 100 * 
		(100 - (SELECT discount 
				FROM person_discounts 
				WHERE 
					pizzeria_id = menu.pizzeria_id AND 
					person_id = person.id)
		)
	)::integer AS discount_price,
	pizzeria.name AS pizzeria_name
FROM
	person
	INNER JOIN person_order ON person.id = person_order.person_id
	INNER JOIN menu ON person_order.menu_id = menu.id
	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name, pizza_name;