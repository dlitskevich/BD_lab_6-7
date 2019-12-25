use ALLIDB;
drop database ALLIDB;

SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE table person;
TRUNCATE table shot;
TRUNCATE table politics;
SET FOREIGN_KEY_CHECKS = 1;


select * from person;

select person_id, 
	   cast(aes_decrypt(person_name, 'name') as char),
       cast(aes_decrypt(person_surname, 'surname') as char),
       cast(aes_decrypt(address, 'address') as char),
       cast(aes_decrypt(birth, 'birth') as char),
       cast(aes_decrypt(death, 'death') as char),
       gender,
       cast(aes_decrypt(biography, 'biography') as char) from person;

select * from criminal_relative;
select * from afterlife;

select * from party;
select * from politics;

select * from compromat;

select * from cases;
select * from case_info;
select * from sentence;
select * from article;
select * from rehabilitation;

select * from shot;
select * from placeD;
select* from transfer;

select * from spyorg;
select * from person_spyorg;
select * from spy_ep_info;








