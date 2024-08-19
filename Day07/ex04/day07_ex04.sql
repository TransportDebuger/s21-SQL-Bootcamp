SELECT
    person.name AS person_name,
    count(person.name) AS count_of_visits
FROM
    person
    INNER JOIN person_visits ON person.id = person_visits.person_id
GROUP BY 
    person.name
HAVING 
    count(person.name) > 3;