SELECT
	person.name AS person_name,
	t1.count_of_visits
FROM
	person
	inner join (
		SELECT DISTINCT
    		person_id,
    		count(person_id) OVER (PARTITION BY person_id) AS count_of_visits
		FROM 
    		person_visits
		ORDER BY 
    		count_of_visits DESC, person_id ASC
		LIMIT 4) t1 ON person.id = t1.person_id
ORDER BY 2 DESC, 1;