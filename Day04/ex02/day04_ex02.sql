CREATE OR REPLACE VIEW v_generated_dates (generated_date)
AS
	SELECT 
    	generate_series('2022-01-01', '2022-01-31', interval '1 day')::date as generated_date;
    ORDER BY
        generated_date;