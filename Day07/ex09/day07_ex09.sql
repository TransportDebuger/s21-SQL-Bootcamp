SELECT
    person.address,
    round(max(person.age::numeric) - (min(person.age::numeric) / max(person.age::numeric)), 2) AS formula,
    round(AVG(person.age::numeric), 2) AS average,
    (CASE
        WHEN (MAX(person.age::numeric) - (MIN(person.age::numeric) / MAX(person.age::numeric))) > AVG(person.age::numeric)
        THEN TRUE
        ELSE FALSE
    END) AS comparison
FROM
    person
GROUP BY
    person.address
ORDER BY
    person.address