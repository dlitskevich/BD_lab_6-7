use allidb;

drop procedure relative_info;
DELIMITER //
create procedure relative_info(in criminal int)
BEGIN
    select person_id,
		   cast(aes_decrypt(person_name,'name')as char),
           cast(aes_decrypt(person_surname,'surname')as char),
           relation2criminal,
           cast(aes_decrypt(address,'address')as char),
           cast(aes_decrypt(birth,'birth')as char),
           cast(aes_decrypt(death,'death')as char),
           repressed,
           cast(aes_decrypt(biography,'biography')as char),
           occupation_after,
           address_after,
           biography_after
	from 
		(select relative_id, relation2criminal , occupation as occupation_after, case_id,
				was_repressed(person_id) as repressed,
				address as address_after, 
                biography as biography_after from criminal_relative
		left join afterlife
			on relative_id=person_id
		where criminal_id=criminal and  criminal = whos_case(case_id)
        ) as temp
	left join person
		on person_id=relative_id
    ;
END//
DELIMITER ;

call relative_info(1);

select person_id,
		   cast(aes_decrypt(person_name,'name')as char),
           cast(aes_decrypt(person_surname,'surname')as char),
           relation2criminal,
           cast(aes_decrypt(address,'address')as char),
           cast(aes_decrypt(birth,'birth')as char),
           cast(aes_decrypt(death,'death')as char),
           repressed,
           cast(aes_decrypt(biography,'biography')as char),
           occupation_after,
           address_after,
           biography_after
	from 
		(select relative_id, relation2criminal , occupation as occupation_after, case_id,
				was_repressed(person_id) as repressed,
				address as address_after, 
                biography as biography_after from criminal_relative
		left join afterlife
			on relative_id=person_id
		where criminal_id=1
        ) as temp
	left join person
		on person_id=relative_id
    
    ;