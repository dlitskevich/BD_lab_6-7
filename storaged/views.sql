CREATE VIEW rehabilitated_cases AS
SELECT cases.* FROM cases
INNER JOIN rehabilitation ON rehabilitation.case_id = cases.case_id
WITH CASCADED CHECK OPTION;

select * from rehabilitated_cases;

CREATE VIEW criminal_code AS
SELECT * FROM article;

CREATE VIEW shot_person AS
SELECT CAST(AES_DECRYPT(person.person_name, 'name') AS CHAR) AS person_name,
	   CAST(AES_DECRYPT(person.person_surname, 'surname') AS CHAR) AS person_surname,
	   shot.shot_date AS shot_date
FROM shot
INNER JOIN cases ON cases.case_id = shot.case_id
INNER JOIN person ON person.person_id = cases.person_id
WHERE person.person_id = cases.person_id;