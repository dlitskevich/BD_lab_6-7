use ALLIDB;
drop database ALLIDB;

SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE table person;
TRUNCATE table shot;
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

select * from cases;

select * from shot;









