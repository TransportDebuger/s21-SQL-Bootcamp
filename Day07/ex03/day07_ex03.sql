WITH
	restaurant_statistics AS (
		(SELECT DISTINCT
			pizzeria.name AS pizzeria_name,
			count(pizzeria.name) AS "count"
		FROM
			person_visits
		INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
		GROUP BY
			pizzeria.name)

		UNION ALL

		(SELECT DISTINCT
    		pizzeria.name AS pizzeria_name,
    		count(pizzeria.name) OVER (PARTITION BY pizzeria.name) AS "count"
		FROM
    		person_order
    		INNER JOIN menu ON person_order.menu_id = menu.id
    		INNER JOIN pizzeria ON menu.id = pizzeria.id)

		UNION ALL

		(SELECT
			pizzeria.name AS pizzeria_name,
			0 as "count"
		FROM
			pizzeria)
	)
SELECT DISTINCT
	pizzeria_name,
	sum(restaurant_statistics."count") OVER (PARTITION BY pizzeria_name) AS total_count
FROM
	restaurant_statistics
ORDER BY
	2 DESC, 1;