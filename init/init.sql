create database ALLIDB;
use ALLIDB;

SET SQL_SAFE_UPDATES = 0;
SET global log_bin_trust_function_creators = 1;

create table person(
	person_id int primary key auto_increment,
    person_name blob,
    person_surname blob,
    address blob,
    birth blob,
    gender enum('male','female','undefined'),
    biography blob,
    death blob
);

--
DELIMITER ;;
CREATE TRIGGER person_check_ins BEFORE INSERT ON person
FOR EACH ROW 
BEGIN
	IF NEW.birth >= NEW.death THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'An error occurred: check birth and death dates.';
	END IF; 
END;;

-- drop trigger person_check_upd;;
CREATE TRIGGER person_check_upd BEFORE UPDATE ON person
FOR EACH ROW 
BEGIN
	declare was_shot bool;
    set was_shot = 0;
    
	select count(*) into was_shot from shot natural join cases
    where person_id=new.person_id;
    
    
    if was_shot > 0 and cast(aes_decrypt(old.death,'death')as date)!=new.death then
		signal sqlstate '45001'
        set message_text = 'bad death date: He definetly was shot (trigger)';
    end if;
    
	IF (NEW.birth = old.birth and cast(aes_decrypt(old.birth,'birth')as char) >= NEW.death) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'An error occurred : check birth and death dates.';
	elseif (NEW.birth != old.birth and NEW.birth > NEW.death) then
		SIGNAL SQLSTATE '45001'
				SET MESSAGE_TEXT = 'An error occurred: check birth and death dates.';
	END IF; 
    /* 🔥🔥🔥
    */
END;;
DELIMITER ;

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
    set new.address = aes_encrypt(new.address, "address");
    
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
    set new.biography = aes_encrypt(new.biography, "biography");
end //
DELIMITER ;

DELIMITER //
-- drop trigger person_update_crypt//
create trigger person_update_crypt before update on person
for each row
begin
	if new.person_id != old.person_id then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad id update is not allowed (trigger)...";
	end if
    ;
    if new.address != old.address then
		set new.address = aes_encrypt(new.address, "address");
	end if
    ;
    if new.biography != old.biography then
		set new.biography = aes_encrypt(new.biography, "biography");
	end if
    ;
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


--
CREATE TABLE article
(
	article_id INT PRIMARY KEY AUTO_INCREMENT,
    article_number VARCHAR(45) not null,
    article_name text not null,
    article_text TEXT not null
);

CREATE TABLE sentence
(
	sentence_id INT PRIMARY KEY AUTO_INCREMENT,
    sentence_text TEXT not null
);
insert into sentence
	(sentence_id,sentence_text)
values
	(-1, 'shot'),
    (0, 'innocent')
;

CREATE TABLE cases
(
	case_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT,
    article_id INT,
    start_date DATE not null,
    end_date DATE,
    authority VARCHAR(45),
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
    declare last_start date default null;
    
	IF NEW.start_date > NEW.end_date THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'An error occurred: ended before started.';
	END IF;
    
    /* that has unexpected behaviour together   (two cases one day) */
    SELECT times, start_date INTO prev_times, last_start FROM cases
    WHERE person_id = NEW.person_id
    ORDER BY start_date, times DESC
    LIMIT 1;
    
    IF (not last_start is null) and (NEW.start_date < last_start) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'An error occurred: incorrect time period, check dates.';
	END IF;
    
    SET NEW.times = prev_times + 1;
    
END;;

-- drop trigger cases_update;;
CREATE TRIGGER cases_update BEFORE update ON cases
FOR EACH ROW
BEGIN
    
	IF old.start_date > NEW.end_date THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'An error occurred: incorrect time period, check dates.';
	END IF;
    
    IF (NEW.start_date != old.start_date) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'An error occurred: no change of start date is allowed.';
	END IF;
    
    SET NEW.times = old.times;
END;;
DELIMITER ;

CREATE TABLE case_info(
	info_id INT PRIMARY KEY AUTO_INCREMENT,
    info_description BLOB not null,
    case_id INT not null,
    info_content BLOB,
    CONSTRAINT fk_info_cases FOREIGN KEY (case_id) REFERENCES cases(case_id)
);

DELIMITER //
create trigger case_info_crypt before insert on case_info
for each row
begin
	set new.info_content = aes_encrypt(new.info_content, "content")
    ;
    set new.info_description = aes_encrypt(new.info_description, "info_description");
    /*
    if new.info_description  regexp "^\\w+$" then
		
	elseif not cast(aes_decrypt(new.info_description, 'info_description') as char) regexp "^\\w+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad info description (trigger)...";
	end if
    ;*/
end //
DELIMITER ;

/*
DELIMITER //
create trigger case_info_update_crypt before update on case_info
for each row
begin
	set new.info_content = aes_encrypt(new.info_content, "content")
    ;
    set new.info_description = aes_encrypt(new.info_description, "info_description");
    /*
    if new.info_description  regexp "^\\w+$" then
		
	elseif not cast(aes_decrypt(new.info_description, 'info_description') as char) regexp "^\\w+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad info description (trigger)...";
	end if
    ;*
end //
DELIMITER ;
*/

DELIMITER //
create trigger case_update before update on case_info
for each row
begin
	signal sqlstate '45000'
	SET MESSAGE_TEXT = "No update on case information is allowed (trigger)...";
end //
DELIMITER ;

--
create table party(
	party_id int primary key auto_increment,
    party_name varchar(45) not null
);

create table politics(
    person_id int not null,
	party_id int,
    constraint fk_politics_person foreign key (person_id) references person(person_id),
    constraint fk_politics_party foreign key (party_id) references party(party_id),
    primary key(person_id, party_id)
);

create table placeD(
	placeD_id int primary key auto_increment,
    placeD_name varchar(45),
	location blob not null,
    placeD_type enum('camp','prison')
);

DELIMITER //
create trigger placeD_crypt before insert on placeD
for each row
begin
	set new.location = aes_encrypt(new.location, "location");
	/*
	if new.location  regexp "^.+$" then
		set new.location = aes_encrypt(new.location, "location");
	elseif not cast(aes_decrypt(new.location, 'location') as char) regexp "^.+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad location (trigger)...";
	end if
    ;*/
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
    transfer_action enum('arrival', 'transfer', 'release'),
	transfer_date date,
    case_id int not null,
    placeD_prev int default null,
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
    declare released bool default 0;
    
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


CREATE TABLE rehabilitation(
	rehabilitation_id INT PRIMARY KEY AUTO_INCREMENT,
    rehabilitation_date DATE not null,
    rehabilitation_authority VARCHAR(45),
    case_id INT not null,
    CONSTRAINT fk_rehabilitation_cases FOREIGN KEY (case_id) REFERENCES cases (case_id)
);

DELIMITER ;;
-- DROP TRIGGER rehabilitation_check;;
CREATE TRIGGER rehabilitation_check BEFORE INSERT ON rehabilitation
FOR EACH ROW
BEGIN
	DECLARE case_count INT DEFAULT 0;
    DECLARE case_start DATE;
   
    SELECT COUNT(case_id) INTO case_count FROM rehabilitation
    WHERE case_id = NEW.case_id;
    
    SELECT start_date INTO case_start FROM cases
    WHERE case_id = NEW.case_id;
    
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

CREATE TABLE shot(
	shot_id INT PRIMARY KEY AUTO_INCREMENT,
    case_id INT not null,
    shot_date DATE not null,
    CONSTRAINT fk_shot_cases FOREIGN KEY (case_id) REFERENCES cases(case_id)
);

DELIMITER ;;
-- DROP TRIGGER multiple_shot;;
CREATE TRIGGER multiple_shot BEFORE INSERT ON shot
FOR EACH ROW
BEGIN
	DECLARE shot_count INT DEFAULT 0;
    DECLARE curr_person INT;
    
    SELECT person_id INTO curr_person FROM cases
    WHERE case_id = NEW.case_id;
    
    SELECT COUNT(*) INTO shot_count FROM shot 
		natural join cases 
			natural join person
    WHERE person_id = curr_person;
    
    IF shot_count > 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred: person was shot already (trigger)';
	END IF;
END;;

CREATE TRIGGER shot_sentence BEFORE INSERT ON shot
FOR EACH ROW
BEGIN
	DECLARE curr_sentence INT;
    
    SELECT sentence_id INTO curr_sentence FROM cases
    WHERE case_id = NEW.case_id;
    
    IF curr_sentence <> -1 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred: person cannot be shot (trigger)';
	END IF;
END;;

--  drop trigger shot_death_date;;
CREATE TRIGGER shot_death_date BEFORE INSERT ON shot
FOR EACH ROW
BEGIN
    DECLARE curr_person INT;
    declare death_date date default null;
    declare case_end date default null;
    
    SELECT person_id INTO curr_person FROM cases
    WHERE case_id = NEW.case_id
    ;
    SELECT end_date INTO case_end FROM cases
    WHERE case_id = NEW.case_id
    ;
    SELECT cast(aes_decrypt(death,'death')as date) INTO death_date FROM person
    WHERE person_id = curr_person;
    
    IF NEW.shot_date > death_date THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred: person cannot be shot (trigger)';
	END IF;
    
    IF NEW.shot_date < case_end THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred: case is not closed (trigger)';
	END IF;
    
    UPDATE person
		SET death = NEW.shot_date
        WHERE person_id = curr_person;
END;;

CREATE TRIGGER shot_update BEFORE UPDATE ON shot
FOR EACH ROW
BEGIN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'An error occurred: you cannot update this table.';
END;;
DELIMITER ;

CREATE TABLE afterlife(
	afterlife_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT not null,
    case_id INT not null,
    address VARCHAR(45),
    occupation VARCHAR(45),
    biography LONGTEXT,
    afterlife_start_date DATE not null,
    CONSTRAINT fk_afterlife_cases FOREIGN KEY (case_id) REFERENCES cases (case_id),
    CONSTRAINT fk_afterlife_person FOREIGN KEY (person_id) REFERENCES person (person_id)
);

DELIMITER ;;
-- drop trigger afterlife_check;;
CREATE TRIGGER afterlife_check BEFORE INSERT ON afterlife
FOR EACH ROW
BEGIN
	DECLARE prev_times INT DEFAULT 0;
    DECLARE case_end DATE;
    DECLARE person_death DATE default(curdate());
    DECLARE curr_person INT;
    
    SELECT end_date, person_id INTO case_end, curr_person FROM cases
    WHERE case_id = NEW.case_id;
    
    SELECT cast(aes_decrypt(death, 'death')as date) INTO person_death FROM person
    WHERE person_id = NEW.person_id;
    
	IF NOT NEW.afterlife_start_date BETWEEN case_end AND person_death THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'An error occurred: incorrect start_date.';
	END IF;
    
    IF NEW.person_id <> curr_person AND (SELECT COUNT(criminal_id)
									  FROM criminal_reative
                                      WHERE criminal_id = curr_person AND relative_id = NEW.person_id) <> 1
		THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'An error occurred: person and criminal are not relatives.';
	END IF;    
END;;

CREATE TRIGGER afterlife_update BEFORE update ON afterlife
FOR EACH ROW
BEGIN
	DECLARE prev_times INT DEFAULT 0;
    DECLARE case_end DATE;
    DECLARE person_death DATE default(curdate());
    DECLARE curr_person INT;
    
    SELECT end_date, person_id INTO case_end, curr_person FROM cases
    WHERE case_id = NEW.case_id;
    
    SELECT cast(aes_decrypt(death, 'death')as date) INTO person_death FROM person
    WHERE person_id = NEW.person_id;
    
	IF NOT NEW.afterlife_start_date BETWEEN case_end AND person_death THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'An error occurred: incorrect start_date.';
	END IF;
    
    IF NEW.person_id <> curr_person AND (SELECT COUNT(criminal_id)
									  FROM criminal_reative
                                      WHERE criminal_id = curr_person AND relative_id = NEW.person_id) <> 1
		THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'An error occurred: person and criminal are not relatives.';
	END IF;     
END;;
DELIMITER ;

-- 3-rd 
CREATE TABLE spyorg(
	spyorg_id INT PRIMARY KEY AUTO_INCREMENT,
    spyorg_name VARCHAR(45) not null,
    country VARCHAR(45)
);

CREATE TABLE person_spyorg(
	episode_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT not null,
    spyorg_id INT,
    episode_date DATE not null,
    -- episode_action TEXT,
    standing ENUM('spotted', 'suspected') not null,
    CONSTRAINT fk_episode_person FOREIGN KEY (person_id) REFERENCES person (person_id),
    CONSTRAINT fk_episode_spyorg FOREIGN KEY (spyorg_id) REFERENCES spyorg (spyorg_id)
);

CREATE TABLE spy_ep_info(
	info_id INT PRIMARY KEY AUTO_INCREMENT,
    info_description BLOB not null,
    info_content BLOB,
    spy_ep_id INT not null,
    CONSTRAINT fk_info_episode FOREIGN KEY (spy_ep_id) REFERENCES person_spyorg (episode_id)
);

DELIMITER //
create trigger spy_ep_info_crypt before insert on spy_ep_info
for each row
begin
	set new.info_content = aes_encrypt(new.info_content, "content")
    ;
    set new.info_description = aes_encrypt(new.info_description, "info_description");
    /*
    if new.info_description  regexp "^.+$" then
		set new.info_description = aes_encrypt(new.info_description, "info_description");
	elseif not cast(aes_decrypt(new.info_description, 'info_description') as char) regexp "^\\w+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad info description (trigger)...";
	end if
   
    ; */
end //
DELIMITER ;

/*
DELIMITER //
create trigger spy_ep_info_update_crypt before update on spy_ep_info
for each row
begin
	set new.info_content = aes_encrypt(new.info_content, "content")
    ;
    set new.info_description = aes_encrypt(new.info_description, "info_description");
    /*
    if new.info_description  regexp "^.+$" then
		set new.info_description = aes_encrypt(new.info_description, "info_description");
	elseif not cast(aes_decrypt(new.info_description, 'info_description') as char) regexp "^\\w+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad info description (trigger)...";
	end if
   
    ; *
end //
DELIMITER ;
*/

DELIMITER //
create trigger spy_ep_info_update before update on spy_ep_info
for each row
begin
	signal sqlstate '45000'
	SET MESSAGE_TEXT = "No update on spy information is allowed (trigger)...";
end //
DELIMITER ;


CREATE TABLE compromat(
	compromat_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT,
    importance DOUBLE default null,
    compromat_description blob not null,
    compromat_content BLOB,
    CONSTRAINT fk_compromat_person FOREIGN KEY (person_id) REFERENCES person (person_id)
);

DELIMITER ;;
CREATE TRIGGER compromat_importance_eval BEFORE INSERT ON compromat
FOR EACH ROW
BEGIN
	if NEW.importance is null then
		SET NEW.importance = compromat_importance(cast(aes_decrypt(new.compromat_description, "compromat_description") as char)); 
	end if;
END;;
DELIMITER ;

DELIMITER //
create trigger compromat_crypt before insert on compromat
for each row
begin
	set new.compromat_content = aes_encrypt(new.compromat_content, "compromat")
    ;
    set new.compromat_description = aes_encrypt(new.compromat_description, "compromat_description");
    /*
    if new.compromat_description  regexp "^.+$" then
		
	elseif not cast(aes_decrypt(new.compromat_description, 'compromat_description') as char) regexp "^.+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad compromat description (trigger)...";
	end if
    ;*/
end //
DELIMITER ;

/*
DELIMITER //
create trigger compromat_update_crypt before update on compromat
for each row
begin
	set new.compromat_content = aes_encrypt(new.compromat_content, "compromat")
    ;
    set new.compromat_description = aes_encrypt(new.compromat_description, "compromat_description");
    /*
    if new.compromat_description  regexp "^.+$" then
		
	elseif not cast(aes_decrypt(new.compromat_description, 'compromat_description') as char) regexp "^.+$" then
		signal sqlstate '45000'
		SET MESSAGE_TEXT = "Bad compromat description (trigger)...";
	end if
    ;
end //
DELIMITER ;
*/

DELIMITER //
CREATE TRIGGER compromat_update before update on compromat
FOR EACH ROW
BEGIN
	signal sqlstate '45001'
    set message_text = 'No update on compromat is allowed'
    ;
END//
DELIMITER ;

CREATE TABLE criminal_relative(
	criminal_id INT not null,
    relative_id INT not null,
    relation2criminal ENUM('spouse', 'sibling', 'parent', 'child', 'distant') default 'distant',
    CONSTRAINT fk_relative_person FOREIGN KEY (relative_id) REFERENCES person (person_id),
    CONSTRAINT fk_criminal_person FOREIGN KEY (criminal_id) REFERENCES person (person_id),
    primary key(criminal_id, relative_id)
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

CREATE TRIGGER criminal_relative_update BEFORE update ON criminal_relative
FOR EACH ROW
BEGIN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'No update is allowed';
END;;
DELIMITER ;