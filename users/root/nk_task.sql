use ALLIDB;
drop database ALLIDB;

select person_id, cast(aes_decrypt(person_name, 'name') as char) from person;

update person
	set person_name = "john"
where person_id = 1
;

insert into compromat
()