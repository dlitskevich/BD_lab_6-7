use ALLIDB;
drop database ALLIDB;

SET FOREIGN_KEY_CHECKS = 0; 

truncate table criminal_relative;
TRUNCATE table person;
TRUNCATE table shot;
TRUNCATE table sentence;
TRUNCATE table politics;
TRUNCATE table cases;

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
select placeD_id,
	   placeD_name,
       cast(aes_decrypt(location,'location')as char),
       placeD_type from placeD;
       
select* from transfer;

select * from spyorg;
select * from person_spyorg;
select * from spy_ep_info;

/*
select article_id, sentence_text, count(sentence_text) as quant from cases natural join sentence
group by article_id, sentence_text
order by  sentence_text desc, quant desc
;
*/







