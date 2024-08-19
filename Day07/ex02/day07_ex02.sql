(SELECT DISTINCT
	pizzeria.name AS pizzeria_name,
	count(pizzeria.name),
	'visit' AS action_type
FROM
	person_visits
	INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY
	pizzeria.name
ORDER BY 
	"count" DESC, pizzeria_name
LIMIT 3)

UNION

(SELECT DISTINCT
    pizzeria.name AS pizzeria_name,
    count(pizzeria.name) OVER (PARTITION BY pizzeria.name) AS "count",
    'order' AS action_type
FROM
    person_order
    INNER JOIN menu ON person_order.menu_id = menu.id
    INNER JOIN pizzeria ON menu.id = pizzeria.id
ORDER BY
    "count" DESC, pizzeria_name
LIMIT 3)

ORDER BY
    3, 2 DESC;


