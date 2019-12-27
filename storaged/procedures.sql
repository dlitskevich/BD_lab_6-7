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

-- DROP PROCEDURE view_cases;;
CREATE PROCEDURE view_cases(IN curr_person INT)
BEGIN
	SELECT case_id, article_name,
			start_date, end_date, authority, 
            sentence_text, times
	FROM cases
    NATURAL JOIN article
    NATURAL JOIN sentence
    WHERE person_id = curr_person;
END;;

-- DROP PROCEDURE view_afterlife;;
CREATE PROCEDURE view_afterlife (IN curr_person INT)
BEGIN
	SELECT CAST(AES_DECRYPT(person_name, 'name') AS CHAR) AS person_name,
		   CAST(AES_DECRYPT(person_surname, 'surname') AS CHAR) AS person_surname,
		   afterlife.address AS address, occupation, afterlife.biography AS bio, afterlife_start_date
    FROM afterlife
    INNER JOIN person ON person.person_id = afterlife.person_id
    WHERE afterlife.person_id = curr_person;
END;;

CREATE PROCEDURE view_relatives (IN curr_person INT)
BEGIN
	SELECT CAST(AES_DECRYPT(person.person_name, 'name') AS CHAR) AS person_name,
		   CAST(AES_DECRYPT(person.person_surname, 'surname') AS CHAR) AS person_surname,
           criminal_relative.relation2criminal AS relation2criminal FROM person
    INNER JOIN criminal_relative ON criminal_relative.relative_id = person.person_id
    WHERE criminal_relative.criminal_id = curr_person;
END;;

-- DROP PROCEDURE transfer_history;;
CREATE PROCEDURE transfer_history (IN curr_case INT)
BEGIN
	SELECT temp.transfer_action AS action, temp.transfer_date AS tr_date,
			temp.placeD_name AS curr_placeD, placeD.placeD_name AS placeD_prev FROM
    (SELECT transfer.*, placeD.* FROM transfer
    INNER JOIN placeD ON transfer.placeD_current = placeD.placeD_id) AS temp
    LEFT JOIN placeD ON temp.placeD_prev = placeD.placeD_id
    WHERE case_id = curr_case;
END;;

CREATE PROCEDURE add_compromat(IN curr_person INT, IN compromat_content BLOB, IN compromat_description TEXT)
BEGIN
	INSERT INTO compromat
    (person_id, compromat_content, compromat_description)
    VALUES
    (curr_person, compromat_content, compromat_description);
END;;

-- DROP PROCEDURE spy_actions;;
CREATE PROCEDURE spy_actions (IN spy INT)
BEGIN
	SELECT episode_date, spyorg_name, standing,
		   CAST(AES_DECRYPT(info_description, 'info_description') AS CHAR) AS info_description,
           AES_DECRYPT(info_content, 'content') AS info_content,
           spy_ep_info.info_id AS info_id
    FROM person_spyorg
    NATURAL JOIN spyorg
    INNER JOIN spy_ep_info ON spy_ep_id = episode_id
    WHERE person_id = spy;
END;;

-- DROP PROCEDURE view_person_by_id;;
CREATE PROCEDURE view_person_by_id (IN curr_id INT)
BEGIN
	SELECT CAST(AES_DECRYPT(person_name, 'name') AS CHAR) AS person_name,
		   CAST(AES_DECRYPT(person_surname, 'surname') AS CHAR) AS person_surname,
           CAST(AES_DECRYPT(address, 'address') AS CHAR) AS person_address,
           CAST(AES_DECRYPT(birth, 'birth') AS DATE) AS birthdate,
           CAST(AES_DECRYPT(death, 'death') AS DATE) AS deathdate,
           CAST(AES_DECRYPT(biography, 'biography') AS CHAR) AS biography,
           gender,
           article_text,
           start_date,
           sentence_text,
           party_name
    FROM person
	NATURAL JOIN cases
    NATURAL JOIN article
    NATURAL JOIN sentence
    NATURAL JOIN politics
    NATURAL JOIN party
    WHERE person_id = curr_id;
END;;


CREATE PROCEDURE view_person_by_name(IN name_pattern VARCHAR(45), IN surname_pattern VARCHAR(45))
BEGIN
	SELECT * FROM
    (SELECT CAST(AES_DECRYPT(person_name, 'name') AS CHAR) AS person_name,
		   CAST(AES_DECRYPT(person_surname, 'surname') AS CHAR) AS person_surname,
           CAST(AES_DECRYPT(address, 'address') AS CHAR) AS person_address,
           CAST(AES_DECRYPT(birth, 'birth') AS DATE) AS birthdate,
           CAST(AES_DECRYPT(death, 'death') AS DATE) AS deathdate,
           CAST(AES_DECRYPT(biography, 'biography') AS CHAR) AS biography,
           gender
    FROM person) AS decrypted
    WHERE decrypted.person_name LIKE name_pattern AND decrypted.person_surname LIKE surname_pattern;
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

CREATE PROCEDURE view_person_afterlife(IN name_pattern VARCHAR(45), IN surname_pattern VARCHAR(45))
BEGIN
	SELECT decrypted.person_name AS person_name,
		   decrypted.person_surname AS person_surname,
           afterlife.address AS address,
           afterlife.occupation AS occupation,
           afterlife.biography AS bio,
           afterlife.afterlife_start_date AS start_date
	FROM afterlife
    NATURAL JOIN (SELECT CAST(AES_DECRYPT(person_name, 'name') AS CHAR) AS person_name,
						 CAST(AES_DECRYPT(person_surname, 'surname') AS CHAR) AS person_surname,
						 person_id
				  FROM person) AS decrypted
	WHERE person_name LIKE name_pattern AND person_surname LIKE surname_pattern;           
END;;

-- drop procedure get_compromat;;
CREATE PROCEDURE get_compromat(IN curr_person INT)
BEGIN
	SELECT importance,
		   CAST(AES_DECRYPT(compromat_description, 'compromat_description') AS CHAR) AS compromat_description,
           AES_DECRYPT(compromat_content, 'compromat') AS compromat_content
	FROM compromat
    WHERE person_id = curr_person
    ORDER BY importance DESC;
END;;

DELIMITER ;

-- call view_compromat(9);
-- call get_compromat(9);