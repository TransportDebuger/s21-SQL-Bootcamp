CREATE OR REPLACE VIEW v_persons_male ("id", "name", age, gender, address)
AS
	SELECT 
		"id", "name", age, gender, address
	FROM
		person
	WHERE
		gender = 'male';

CREATE OR REPLACE VIEW v_persons_female ("id", "name", age, gender, address)
AS
	SELECT 
		"id", "name", age, gender, address
	FROM
		person
	WHERE
		gender = 'female';