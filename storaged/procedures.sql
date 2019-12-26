USE ALLIDB;

DELIMITER ;;

CREATE PROCEDURE shoot_person(IN curr_case INT, IN curr_date DATE)
BEGIN
	START TRANSACTION;
    
    INSERT INTO shot
    (case_id, shot_date)
    VALUES
    (curr_case, curr_date);
    
    COMMIT;
END;;

CREATE PROCEDURE prisoner_transfer(IN from_place INT, IN to_place INT, IN person_case INT, IN transf_date DATE)
BEGIN
	START TRANSACTION;

	INSERT INTO transfer
    (transfer_action, transfer_date, placeD_prev, placeD_current, case_id)
    VALUES
    ('transfer', transf_date, from_place, to_place, person_case);
    
    COMMIT;    
END;;

CREATE PROCEDURE prisoner_arrival(IN to_place INT, IN person_case INT, IN transf_date DATE)
BEGIN
	START TRANSACTION;

	INSERT INTO transfer
    (transfer_action, transfer_date, placeD_current, case_id)
    VALUES
    ('arrival', transf_date, to_place, person_case);
    
    COMMIT;
END;;

CREATE PROCEDURE prisoner_release(IN from_place INT, IN person_case INT, IN transf_date DATE)
BEGIN
	START TRANSACTION;

	INSERT INTO transfer
    (transfer_action, transfer_date, placeD_current, case_id)
    VALUES
    ('release', transf_date, from_place, person_case);
    
    COMMIT;
END;;

CREATE PROCEDURE view_cases(IN curr_person INT)
BEGIN
	SELECT cases.case_id, cases.person_id, cases.article_id,
			cases.start_date, cases.end_date, cases.authority, 
            sentence.sentence_text, cases.times
	FROM cases
    INNER JOIN sentence ON sentence.sentence_id = cases.sentence_id
    WHERE cases.person_id = curr_person;
END;;

CREATE PROCEDURE view_afterlife (IN curr_person INT)
BEGIN
	SELECT CAST(AES_DECRYPT(person_name, 'name') AS CHAR) AS person_name,
		   CAST(AES_DECRYPT(person_surname, 'surname') AS CHAR) AS person_surname,
		   afterlife.address, afterlife.occupation, afterlife.biography, afterlife.afterlife_start_date
    FROM afterlife
    INNER JOIN person ON person.person_id = afterlife.person_id
    WHERE person_id = curr_person;
END;;

CREATE PROCEDURE view_relatives (IN curr_person INT)
BEGIN
	SELECT CAST(AES_DECRYPT(person.person_name, 'name') AS CHAR) AS person_name,
		   CAST(AES_DECRYPT(person.person_surname, 'surname') AS CHAR) AS person_surname,
           criminal_relative.relation2criminal AS relation2criminal FROM person
    INNER JOIN criminal_relative ON criminal_relative.relative_id = person.person_id
    WHERE criminal_relative.criminal_id = curr_person;
END;;

CREATE PROCEDURE transfer_history (IN curr_case INT)
BEGIN
	SELECT * FROM transfer
    WHERE case_id = curr_case;
END;;

CREATE PROCEDURE add_compromat(IN curr_person INT, IN compromat_content BLOB, IN compromat_description TEXT)
BEGIN
	INSERT INTO compromat
    (person_id, compromat_content, compromat_description)
    VALUES
    (curr_person, compromat_content, compromat_description);
END;;

CREATE PROCEDURE spy_actions (IN spy INT)
BEGIN
	SELECT CAST(AES_DECRYPT(spy_ep_info.info_description, 'description') AS CHAR) AS info_description,
		   AES_DECRYPT(spy_ep_info.info_content, 'content') AS info_content,
		   person_spyorg.episode_date AS episode_date,
           person_spyorg.standing AS standing,
           spyorg.spyorg_name AS spyorg_name
	FROM spy_ep_info
    INNER JOIN person_spyorg ON person_spyorg.episode_id = spy_ep_info.spy_ep_id
    INNER JOIN spyorg ON spyorg.spyorg_id = person_spyorg.spyorg_id
    WHERE person_spyorg.person_id = spy;
END;;

CREATE PROCEDURE view_person_by_id (IN curr_id INT)
BEGIN
	SELECT CAST(AES_DECRYPT(person_name, 'name') AS CHAR) AS person_name,
		   CAST(AES_DECRYPT(person_surname, 'surname') AS CHAR) AS person_surname,
           CAST(AES_DECRYPT(person_address, 'address') AS CHAR) AS person_address,
           CAST(AES_DECRYPT(birth, 'birth') AS DATE) AS birthdate,
           CAST(AES_DECRYPT(death, 'death') AS DATE) AS deathdate,
           CAST(AES_DECRYPT(biography, 'biography') AS CHAR) AS biography,
           gender
    FROM person
    WHERE person_id = curr_id;
END;;

CREATE PROCEDURE view_person_by_name(IN curr_name VARCHAR(45), IN curr_surname VARCHAR(45))
BEGIN
	SELECT curr_name AS person_name,
		   curr_surname AS person_surname,
           CAST(AES_DECRYPT(person_address, 'address') AS CHAR) AS person_address,
           CAST(AES_DECRYPT(birth, 'birth') AS DATE) AS birthdate,
           CAST(AES_DECRYPT(death, 'death') AS DATE) AS deathdate,
           CAST(AES_DECRYPT(biography, 'biography') AS CHAR) AS biography,
           gender
    FROM person
    WHERE AES_ENCRYPT(curr_name, 'name') = person_name AND AES_ENCRYPT(curr_surname, 'surname') = person_surname;
END;;

CREATE PROCEDURE view_compromat (IN curr_person INT)
BEGIN
	SELECT importance,
           AES_DECRYPT(compromat_content, 'compromat') AS compromat_content,
           CAST(AES_DECRYPT(compromat_description, 'compromat_description') AS CHAR) AS compromat_description
	FROM compromat
    WHERE person_id = curr_person
    ORDER BY importance DESC;
END;;

CREATE PROCEDURE case_details (IN curr_case INT)
BEGIN
	SELECT CAST(AES_DECRYPT(person.person_name, 'name') AS CHAR) AS person_name,
		   CAST(AES_DECRYPT(person.person_surname, 'surname') AS CHAR) AS person_surname,
           article.article_name AS article_name,
           cases.start_date AS start_date,
           cases.end_date AS end_date,
           cases.authority,
           sentence.sentence_text
	FROM cases
    INNER JOIN person ON person.person_id = cases.person_id
    INNER JOIN article ON article.article_id = cases.article_id
    INNER JOIN sentence ON sentence.sentence_id = cases.sentence_id
    WHERE cases.case_id = curr_case;
END;;

CREATE PROCEDURE create_case(IN curr_person INT, IN curr_article INT, IN curr_start DATE, IN curr_end DATE, IN curr_authority VARCHAR(45), IN curr_sentence INT)
BEGIN
	INSERT INTO cases
    (person_id, article_id, start_id, end_id, authority, sentence_id)
    VALUES
    (curr_person, curr_article, curr_start, curr_end, curr_authority, curr_sentence);
END;;

DELIMITER ;
