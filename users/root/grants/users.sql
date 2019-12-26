USE ALLIDB;

CREATE USER cases_manager IDENTIFIED BY 'cm_password';
GRANT SELECT, UPDATE, INSERT ON ALLIDB.cases TO cases_manager;
GRANT SELECT, UPDATE, INSERT ON ALLIDB.sentence TO cases_manager;
GRANT SELECT, UPDATE, INSERT ON ALLIDB.case_info TO cases_manager;
GRANT SELECT ON ALLIDB.article TO cases_creator;
GRANT SELECT ON ALLIDB.person TO cases_manager;
GRANT EXECUTE ON ALLIDB.view_cases TO cases_manager;
GRANT EXECUTE ON ALLIDB.create_case TO cases_manager;
GRANT EXECUTE ON ALLIDB.case_details TO cases_manager;
GRANT EXECUTE ON ALLIDB.view_person_by_id TO cases_manager;
GRANT EXECUTE ON ALLIDB.view_person_by_name TO cases_manager;


CREATE USER shooter IDENTIFIED BY 's_password';
GRANT SELECT, INSERT, UPDATE ON ALLIDB.shot TO shooter;
GRANT SELECT ON ALLIDB.cases TO shooter;
GRANT EXECUTE ON ALLIDB.shoot_person TO shooter;
GRANT EXECUTE ON ALLIDB.case_details TO shooter;
GRANT EXECUTE ON ALLIDB.view_cases TO shooter;


CREATE USER reabilitator IDENTIFIED BY 'r_password';
GRANT SELECT, INSERT, UPDATE ON ALLIDB.rehabilitation TO reabilitator;
GRANT SELECT ON ALLIDB.cases TO reabilitator;
GRANT EXECUTE ON ALLIDB.case_details TO reabilitator;
GRANT EXECUTE ON ALLIDB.view_cases TO reabilitator;


CREATE USER warden IDENTIFIED BY 'w_password';
GRANT SELECT, INSERT, UPDATE ON ALLIDB.transfer TO warden;
GRANT SELECT ON ALLIDB.placeD TO warden;
GRANT SELECT ON ALLIDB.cases TO warden;
GRANT EXECUTE ON ALLIDB.case_details TO warden;
GRANT EXECUTE ON ALLIDB.view_cases TO warden;
GRANT EXECUTE ON ALLIDB.prisoner_arrival TO warden;
GRANT EXECUTE ON ALLIDB.prisoner_release TO warden;
GRANT EXECUTE ON ALLIDB.prisoner_transfer TO warden;
GRANT EXECUTE ON ALLIDB.transfer_history TO warden;


CREATE USER spy_manager IDENTIFIED BY 'sm_password';
GRANT SELECT, INSERT, UPDATE ON ALLIDB.person_spyorg TO spy_manager;
GRANT SELECT, INSERT, UPDATE ON ALLIDB.spy_ep_info TO spy_manager;
GRANT SELECT ON ALLIDB.spyorg TO spy_manager;
GRANT SELECT ON ALLIDB.person TO spy_manager;
GRANT EXECUTE ON ALLIDB.view_person_by_id TO spy_manager;
GRANT EXECUTE ON ALLIDB.view_person_by_name TO spy_manager;
GRANT EXECUTE ON ALLIDB.spy_actions TO spy_manager;


CREATE USER person_manager IDENTIFIED BY 'pm_password';
GRANT SELECT, INSERT, UPDATE ON ALLIDB.person TO person_manager;
GRANT SELECT, INSERT, UPDATE ON ALLIDB.politics TO person_manager;
GRANT SELECT, INSERT, UPDATE ON ALLIDB.criminal_relative TO person_manager;
GRANT SELECT, INSERT, UPDATE ON ALLIDB.afterlife TO person_manager;
GRANT SELECT, INSERT, UPDATE ON ALLIDB.compromat TO person_manager;
GRANT SELECT ON cases TO person_manager;
GRANT SELECT ON party TO person_manager;
GRANT EXECUTE ON ALLIDB.add_compromat TO person_manager;
GRANT EXECUTE ON ALLIDB.case_details TO person_manager;
GRANT EXECUTE ON ALLIDB.view_afterlife TO person_manager;
GRANT EXECUTE ON ALLIDB.view_cases TO person_manager;
GRANT EXECUTE ON ALLIDB.view_compromat TO person_manager;
GRANT EXECUTE ON ALLIDB.view_person_by_id TO person_manager;
GRANT EXECUTE ON ALLIDB.view_person_by_name TO person_manager;
GRANT EXECUTE ON ALLIDB.view_relatives TO person_manager;

CREATE USER relative IDENTIFIED BY 'rel_password';
GRANT EXECUTE ON ALLIDB.view_person_by_name TO relative;