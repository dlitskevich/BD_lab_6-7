USE ALLIDB;

DELIMITER //
CREATE FUNCTION compromat_importance(describ text)
RETURNS DOUBLE
BEGIN
    RETURN rand()*100;
END//

DELIMITER ;;

DELIMITER //
CREATE FUNCTION was_repressed(person int)
RETURNS bool
BEGIN
	declare repressed bool default 0;
    
    select count(*) into repressed from cases
    natural join rehabilitation
    where person_id=person
    ;
    RETURN repressed; 
END//

-- drop function whos_case//
DELIMITER //
CREATE FUNCTION whos_case(cur_case int)
RETURNS int
BEGIN
	declare whos int default null;
    
    select person_id into whos from cases
    where case_id=cur_case
    ;
    RETURN whos; 
END//

-- select whos_case(4)//


DELIMITER ;;

CREATE FUNCTION rehabilitated_cases()
RETURNS DOUBLE
BEGIN
	DECLARE percent DOUBLE DEFAULT 0;
	DECLARE cases_num INT;
    DECLARE rehabilitated_num INT;
    
    SELECT COUNT(*) INTO cases_num FROM cases;
    SELECT COUNT(*) INTO rehabilitated_num FROM rehabilitation;
    
    SET percent = (rehabilitated_num / cases_num) * 100;
    
    RETURN percent;
END;;


CREATE FUNCTION rehabilitated_people()
RETURNS DOUBLE
BEGIN
	DECLARE percent DOUBLE DEFAULT 0;
	DECLARE person_num INT;
    DECLARE rehabilitated_num INT;
    
    SELECT COUNT(DISTINCT person_id) INTO person_num FROM cases;
    
    SELECT COUNT(DISTINCT cases.person_id) INTO rehabilitated_num
    FROM cases
    INNER JOIN rehabilitation ON rehabilitation.case_id = cases.case_id;
    
    SET percent = (rehabilitated_num / person_num) * 100;
    
    RETURN percent;
END;;




CREATE FUNCTION shot_percent()
RETURNS DOUBLE
BEGIN
	DECLARE percent DOUBLE DEFAULT 0;
	DECLARE person_num INT;
    DECLARE shot_num INT;
    
    SELECT COUNT(*) INTO shot_num FROM shot;
    SELECT COUNT(DISTINCT person_id) INTO person_num FROM cases;
    
    SET percent = (shot_num / person_num) * 100;
    
    RETURN percent;
END;;

DELIMITER ;
