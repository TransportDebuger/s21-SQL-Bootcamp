SELECT
    generated_date as missing_date
FROM   
    v_generated_dates
    left join person_visits on generated_date = visit_date
WHERE
    visit_date is null;