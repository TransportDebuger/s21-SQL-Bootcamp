SELECT
    pizzeria.name AS pizzeria_name,
    count(pizzeria.name) AS count_of_orders,
    round(avg(menu.price), 0) AS average_price,
    MAX(menu.price) AS max_price,
    MIN(menu.price) AS min_price
FROM
    pizzeria
    INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
    INNER JOIN person_order ON menu.id = person_order.menu_id
GROUP BY
    pizzeria.name
ORDER BY 1;