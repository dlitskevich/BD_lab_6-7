create database ALLIDB;
use ALLIDB;

create table person(
	person_id int primary key auto_increment,
    person_name blob,
    person_surname blob,
    address blob,
    birth blob,
    gender enum('male','female','undefined'),
    biography blob,
    death blob,
    repressed bool -- political
);

--
DELIMITER //
create trigger person_crypt before insert on person
for each row
begin
	if new.person_name  regexp "^\\w+$" then
		set new.person_name = aes_encrypt(new.person_name, "name");
	elseif not cast(aes_decrypt(new.person_name, 'name') as char) regexp "^\\w+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad person name (trigger)...";
	end if
    ;
    if new.person_surname  regexp "^\\w+$" then
		set new.person_surname = aes_encrypt(new.person_surname, "surname");
	elseif not cast(aes_decrypt(new.person_surname, 'surname') as char) regexp "^\\w+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad person surname (trigger)...";
	end if
    ;
    if new.address  regexp "^.*$" then
		set new.address = aes_encrypt(new.address, "address");
	elseif not cast(aes_decrypt(new.address, 'address') as char) regexp "^.*$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad address (trigger)...";
	end if
    ;
    if new.birth  regexp "^([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$" then
		set new.birth = aes_encrypt(new.birth, "birth");
	elseif not cast(aes_decrypt(new.birth, 'birth') as char) regexp "^([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad birth date (trigger)...";
	end if
    ;
    if new.death  regexp "^([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$" then
		set new.death = aes_encrypt(new.death, "death");
	elseif not cast(aes_decrypt(new.death, 'death') as char) regexp "^([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad death date (trigger)...";
	end if
    ;
end //
DELIMITER ;

DELIMITER //
create trigger person_update_crypt before update on person
for each row
begin
	if new.person_name  regexp "^\\w+$" then
		set new.person_name = aes_encrypt(new.person_name, "name");
	elseif not cast(aes_decrypt(new.person_name, 'name') as char) regexp "^\\w+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad person name (trigger)...";
	end if
    ;
    if new.person_surname  regexp "^\\w+$" then
		set new.person_surname = aes_encrypt(new.person_surname, "surname");
	elseif not cast(aes_decrypt(new.person_surname, 'surname') as char) regexp "^\\w+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad person surname (trigger)...";
	end if
    ;
    if new.address  regexp "^.*$" then
		set new.address = aes_encrypt(new.address, "address");
	elseif not cast(aes_decrypt(new.address, 'address') as char) regexp "^.*$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad address (trigger)...";
	end if
    ;
    if new.birth  regexp "^([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$" then
		set new.birth = aes_encrypt(new.birth, "birth");
	elseif not cast(aes_decrypt(new.birth, 'birth') as char) regexp "^([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad birth date (trigger)...";
	end if
    ;
    if new.death  regexp "^([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$" then
		set new.death = aes_encrypt(new.death, "death");
	elseif not cast(aes_decrypt(new.death, 'death') as char) regexp "^([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad death date (trigger)...";
	end if
    ;
end //

DELIMITER ;;
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

insert into person
	(person_name,person_surname,address,birth,gender,biography,death,repressed)
values
	('John',"Smith",'32 avenue', '1994-03-12','male','bio', null, null)
;
--
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

DELIMITER ;;
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
DELIMITER ;

CREATE TABLE case_info
(
	info_id INT PRIMARY KEY AUTO_INCREMENT,
    info_description BLOB,
    case_id INT,
    info_content BLOB,
    CONSTRAINT fk_info_cases FOREIGN KEY (case_id) REFERENCES cases (case_id)
);

--
create table party(
	party_id int primary key auto_increment,
    party_name varchar(45)
);

create table politics(
	politics_id int primary key auto_increment,
    person_id int not null,
	party_id int,
    constraint fk_politics_person foreign key (person_id) references person(person_id),
    constraint fk_politics_party foreign key (party_id) references party(party_id)
);

create table placeD(
	placeD_id int primary key auto_increment,
    placeD_name varchar(45),
	location blob,
    placeD_type enum('camp','prison')
);

DELIMITER //
create trigger placeD_crypt before insert on placeD
for each row
begin
	if new.location  regexp "^.+$" then
		set new.location = aes_encrypt(new.location, "location");
	elseif not cast(aes_decrypt(new.location, 'location') as char) regexp "^.+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad location (trigger)...";
	end if
    ;
end //
DELIMITER ;

DELIMITER //
create trigger placeD_update before update on placeD
for each row
begin
	signal sqlstate '45000'
	SET MESSAGE_TEXT = "No update is allowed (trigger)...";
end //
DELIMITER ;

create table transfer(
	transfer_id int primary key auto_increment,
    transfer_action ENUM('arrival', 'transfer', 'release'),
	transfer_date date,
    case_id int not null,
    placeD_prev int,
    placeD_current int not null,
	constraint fk_transfer_cases foreign key (case_id) references cases(case_id),
    constraint fk_transfer_placeD_prev foreign key (placeD_prev) references placeD(placeD_id),
    constraint fk_transfer_placeD_current foreign key (placeD_current) references placeD(placeD_id)
);

DELIMITER //
create trigger transfer_insert before insert on transfer
for each row
begin
	declare death_date date;
    declare cur_person_id int;
    declare released bool;
    set released = 0;
    
    select person_id into cur_person_id from cases
    where case_id = new.case_id
    ;
    select death into death_date from person
    where person_id = cur_person_id
    ;
    select count(*) into released from transfer
    where case_id = new.case_id and transfer_action='release'
    ;
    
	if transfer_action='transfer' and new.placeD_prev=new.placeD_current then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = 'Not allowed transfer to the same place (trigger)...';
	end if
    ;
    if new.transfer_date>death_date then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = 'Not allowed transfer of dead person (trigger)...';
	end if
    ;
    if released>0 then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = 'Not allowed transfer of free person (trigger)...';
	end if
    ;
end //
DELIMITER ;

DELIMITER //
create trigger transfer_update before update on transfer
for each row
begin
	signal sqlstate '45000'
	SET MESSAGE_TEXT = "No update is allowed (trigger)...";
end //
DELIMITER ;

-- 2-nd part


CREATE TABLE rehabilitation
(
	rehabilitation_id INT PRIMARY KEY AUTO_INCREMENT,
    rehabilitation_date DATE,
    rehabilitation_authority VARCHAR(45),
    case_id INT,
    CONSTRAINT fk_rehabilitation_cases FOREIGN KEY (case_id) REFERENCES cases (case_id)
);

DELIMITER ;;
-- DROP TRIGGER rehabilitation_check;;
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
DELIMITER ;

CREATE TABLE shot
(
	shot_id INT PRIMARY KEY AUTO_INCREMENT,
    case_id INT,
    shot_date DATE,
    CONSTRAINT fk_shot_cases FOREIGN KEY (case_id) REFERENCES cases (case_id)
);

DELIMITER ;;
-- DROP TRIGGER multiple_shot;;
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
DELIMITER ;

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
DELIMITER ;

-- 3-rd 
CREATE TABLE spyorg
(
	spyorg_id INT PRIMARY KEY AUTO_INCREMENT,
    spyorg_name VARCHAR(45),
    country VARCHAR(45)
);

CREATE TABLE person_spyorg
(
	episode_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT,
    spyorg_id INT,
    episode_date DATE,
    episode_action TEXT,
    standing ENUM('spotted', 'suspected'),
    CONSTRAINT fk_episode_person FOREIGN KEY (person_id) REFERENCES person (person_id),
    CONSTRAINT fk_episode_spyorg FOREIGN KEY (spyorg_id) REFERENCES spyorg (spyorg_id)
);

CREATE TABLE spy_ep_info
(
	info_id INT PRIMARY KEY AUTO_INCREMENT,
    info_description BLOB,
    info_content BLOB,
    spy_ep_id INT,
    CONSTRAINT fk_info_episode FOREIGN KEY (spy_ep_id) REFERENCES person_spyorg (episode_id)
);

CREATE TABLE compromat
(
	compromat_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT,
    importance DOUBLE,
    compromat_content BLOB,
    CONSTRAINT fk_compromat_person FOREIGN KEY (person_id) REFERENCES person (person_id)
);

DELIMITER ;;
CREATE TRIGGER compromat_importance_eval BEFORE INSERT ON compromat
FOR EACH ROW
BEGIN
	SET NEW.importance = RAND(); # function to evaluate importance
END;;
DELIMITER ;

CREATE TABLE criminal_relative
(
	criminal_id INT,
    relative_id INT,
    relation2criminal ENUM('spouse', 'sibling', 'parent', 'child', 'distant'),
    CONSTRAINT fk_relative_person FOREIGN KEY (relative_id) REFERENCES person (person_id),
    CONSTRAINT fk_criminal_person FOREIGN KEY (criminal_id) REFERENCES person (person_id)
);

DELIMITER ;;
CREATE TRIGGER criminal_relative_check BEFORE INSERT ON criminal_relative
FOR EACH ROW
BEGIN
	IF NEW.criminal_id = NEW.relative_id THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'An error occurred: relative and criminal are the same person.';
	END IF; 
END;;
DELIMITER ;