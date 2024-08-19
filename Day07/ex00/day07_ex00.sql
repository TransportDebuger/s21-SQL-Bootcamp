SELECT DISTINCT
    person_id,
    count(*) OVER (PARTITION BY person_id) AS count_of_visits
FROM 
    person_visits
ORDER BY 
    count_of_visits DESC, person_id ASC;