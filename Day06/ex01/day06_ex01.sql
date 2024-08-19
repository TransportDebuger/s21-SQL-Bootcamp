INSERT INTO person_discounts 
WITH 
	ord_count AS (
		SELECT DISTINCT
			person_order.person_id,
			menu.pizzeria_id,
			count(person_id) OVER (PARTITION BY person_id, pizzeria_id) as order_count
		FROM 
			person_order
			inner join menu on person_order.menu_id = menu.id
			inner join pizzeria on menu.pizzeria_id = pizzeria.id
)
SELECT 
	ROW_NUMBER() OVER () AS "id",
	person_id,
	pizzeria_id,
	(case 
		when order_count = 1 then 10.5
		when order_count = 2 then 22
		else 30
	end) as discount
FROM
	ord_count;