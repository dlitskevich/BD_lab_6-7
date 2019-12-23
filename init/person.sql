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
DELIMITER ;

insert into person
	(person_name,person_surname,address,birth,gender,biography,death,repressed)
values
	('John',"Smith",'32 avenue', '1994-03-12','male','bio', null, null)
;

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
    constraint fk_transfer_placeD_prev foreign key (placeD_prev) references placeD(placeD_prev),
    constraint fk_transfer_placeD_current foreign key (placeD_current) references placeD(placeD_current)
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
create trigger placeD_update before update on placeD
for each row
begin
	signal sqlstate '45000'
	SET MESSAGE_TEXT = "No update is allowed (trigger)...";
end //
DELIMITER ;