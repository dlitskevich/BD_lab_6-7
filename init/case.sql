USE ALLIDB;

CREATE TABLE article
(
	article_id INT PRIMARY KEY AUTO_INCREMENT,
    article_number VARCHAR(45),
    article_name VARCHAR(45),
    article_text TEXT
);

CREATE TABLE sentence
(
	sentence_id INT PRIMARY KEY AUTO_INCREMENT,
    sentence_text TEXT
);

CREATE TABLE cases
(
	case_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT,
    article_id INT,
    start_date DATE,
    end_date DATE,
    authoruty VARCHAR(45),
    sentence_id INT,
    times INT,
    CONSTRAINT fk_cases_person FOREIGN KEY (person_id) REFERENCES person (person_id),
    CONSTRAINT fk_cases_article FOREIGN KEY (article_id) REFERENCES article (article_id),
    CONSTRAINT fk_cases_sentence FOREIGN KEY (sentence_id) REFERENCES sentence (sentence_id)
);

CREATE TABLE case_info
(
	info_id INT PRIMARY KEY AUTO_INCREMENT,
    info_description BLOB,
    case_id INT,
    info_content BLOB,
    CONSTRAINT fk_info_cases FOREIGN KEY (case_id) REFERENCES cases (case_id)
);

CREATE TABLE rehabilitation
(
	rehabilitation_id INT PRIMARY KEY AUTO_INCREMENT,
    rehabilitation_date DATE,
    rehabilitation_authority VARCHAR(45),
    case_id INT,
    CONSTRAINT fk_rehabilitation_cases FOREIGN KEY (case_id) REFERENCES cases (case_id)
);

CREATE TABLE shot
(
	shot_id INT PRIMARY KEY AUTO_INCREMENT,
    case_id INT,
    shot_date DATE,
    CONSTRAINT fk_shot_cases FOREIGN KEY (case_id) REFERENCES cases (case_id)
);

CREATE TABLE afterlife
(
	afterlife_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT,
    case_id INT,
    address VARCHAR(45),
    occupation VARCHAR(45),
    biography LONGTEXT,
    afterlife_start_date DATE,
    CONSTRAINT fk_afterlife_cases FOREIGN KEY (case_id) REFERENCES cases (case_id),
    CONSTRAINT fk_afterlife_person FOREIGN KEY (person_id) REFERENCES person (person_id)
);

DELIMITER ;;

# SHOT TRIGGERS
DROP TRIGGER multiple_shot;;
CREATE TRIGGER multiple_shot BEFORE INSERT ON shot
FOR EACH ROW
BEGIN
	DECLARE case_count INT DEFAULT 0;
    DECLARE new_case INT;
    SET new_case = NEW.case_id;
    
    SELECT COUNT(case_id) INTO case_count 
    FROM shot
    WHERE case_id = new_case;
    
    IF case_count > 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred: person was shot already (trigger)';
	END IF;
END;;

CREATE TRIGGER shot_sentence BEFORE INSERT ON shot
FOR EACH ROW
BEGIN
	DECLARE sentence INT;
    DECLARE new_case INT;
    SET new_case = NEW.case_id;
    
    SELECT sentence_id INTO sentence
    FROM cases
    WHERE case_id = new_case;
    
    IF sentence_id <> -1 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred: person cannot be shot (trigger)';
	END IF;
END;;

CREATE TRIGGER shot_death_date BEFORE INSERT ON shot
FOR EACH ROW
BEGIN
	DECLARE new_case INT;
    DECLARE new_person INT;
    SET new_case = NEW.case_id;
    
    SELECT person_id INTO new_person
    FROM cases
    WHERE case_id = new_case;
    
    UPDATE person
		SET death = NEW.shot_date
        WHERE person_id = new_person;
END;;

CREATE TRIGGER shot_update BEFORE UPDATE ON shot
FOR EACH ROW
BEGIN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'An error occurred: you cannot update this table.';
END;;

# REHABILITATION TRIGGERS
DROP TRIGGER rehabilitation_check;;
CREATE TRIGGER rehabilitation_check BEFORE INSERT ON rehabilitation
FOR EACH ROW
BEGIN
	DECLARE case_count INT DEFAULT 0;
    DECLARE new_case INT;
    DECLARE case_start DATE;
    SET new_case = NEW.case_id;
    
    SELECT COUNT(case_id) INTO case_count 
    FROM rehabilitation
    WHERE case_id = new_case;
    
    SELECT start_date INTO case_start
    FROM cases
    WHERE case_id = new_case;
    
    IF case_count > 0 OR case_start > NEW.rehabilitation_date THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred: cannot insert, check data (trigger)';
	END IF;
END;;

CREATE TRIGGER rehabilitation_update BEFORE UPDATE ON rehabilitation
FOR EACH ROW
BEGIN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'An error occurred: you cannot update this table.';
END;;

CREATE TRIGGER cases_check BEFORE INSERT ON cases
FOR EACH ROW
BEGIN
	DECLARE prev_times INT DEFAULT 0;
    DECLARE new_case INT;
    SET new_case = NEW.case_id;
    
	IF NEW.start_date < NEW.end_date THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'An error occurred: incorrect time period, check dates.';
	END IF;
    
    SELECT times INTO prev_times
    FROM cases
    WHERE case_id = new_case
    ORDER BY start_date DESC
    LIMIT 1;
    
    SET NEW.times = prev_times + 1;
    
END;;

CREATE TRIGGER afterlife_check BEFORE INSERT ON afterlife
FOR EACH ROW
BEGIN
	DECLARE prev_times INT DEFAULT 0;
    DECLARE case_end DATE;
    DECLARE person_death DATE;
    DECLARE new_case INT;
    DECLARE new_person INT;
    DECLARE case_person INT;
    SET new_person = NEW.person_id;
    SET new_case = NEW.case_id;
    
    SELECT end_date, person_id INTO case_end, case_person
    FROM cases
    WHERE case_id = new_case;
    
    SELECT death INTO person_death
    FROM person
    WHERE person_id = NEW.person_id;
    
	IF NOT NEW.afterlife_start_date BETWEEN case_end AND person_death THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'An error occurred: incorrect start_date.';
	END IF;
    
    IF new_person <> person_case AND (SELECT COUNT(criminal_id)
									  FROM criminal_reative
                                      WHERE criminal_id = new_case AND relative_id = new_person) <> 1
		THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'An error occurred: person and criminal are not relatives.';
	END IF;    
END;;

CREATE TRIGGER criminal_relative_check BEFORE INSERT ON criminal_relative
FOR EACH ROW
BEGIN
	IF NEW.criminal_id = NEW.relative_id THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'An error occurred: relative and criminal are the same person.';
	END IF; 
END;;

CREATE TRIGGER compromat_importance_eval BEFORE INSERT ON compromat
FOR EACH ROW
BEGIN
	SET NEW.importance = RAND(); # function to evaluate importance
END;;

CREATE TRIGGER person_check_ins BEFORE INSERT ON person
FOR EACH ROW 
BEGIN
	IF NEW.birth >= NEW.death THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'An error occurred: check birth and death dates.';
	END IF; 
END;;

CREATE TRIGGER person_check_upd BEFORE UPDATE ON person
FOR EACH ROW 
BEGIN
	IF NEW.birth >= NEW.death THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'An error occurred: check birth and death dates.';
	END IF; 
END;;

DELIMITER ;

/*

*/