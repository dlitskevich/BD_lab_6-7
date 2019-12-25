use alliDB;

insert into alliDB.person
	(person_name,person_surname,address,birth,gender,biography,death)
values
	('Edith','Ivanov', 'Moscow Pobeda', '1932-10-27', 'male','zjSQLhyXpYGXujsHQWnHSMqujGPBhXuFDDKySshcxBSkyJmmGFTARXrOFaZmgXnmmQNIZywznMKyQBFBDueNVGSQhNaoqCchftwFOUxxXllXNjyCWILXSVHRjmRXsVchUWScSeFxjYmQCjoOf','1963-10-14'),
	('Deborah','Ivanova', 'Moscow Pobeda', '1933-11-25', 'female','DkAsinUSrgMBowbwiSuSjUKmULPKqrsJFagRfZiAHaTveoROIKQGIHbwYdcmQNinSGLOEUmuajmzTWHlCEFvGAYczzzvTtsghodFhHaqCLRShcIIZUIVREDAXKjYDBxqLluadApBoYSpeRorD','2006-10-14'), 
	('Brenda','Ivanova', 'Moscow Pobeda', '1952-10-16', 'female','ROVewFCcrBMlVxPVHqkKLqTUESKDHUeABMMmQBoZthtMhRUPfJhKCMwHpMIJMVYkrFPJGlLwtPMzviVKdBtBsoKgXWDqFcoLblVLFSxfllfrqkcOHwRmuBwNuWYwoXmcJzdcxpumlltuCmXqU',null), 
	('Yvonne','Ivanov', 'Moscow Pobeda', '1955-10-19', 'male','MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY',null), 
	('Craig','Ivanov', 'Moscow Pobeda', '1957-12-28', 'male','arCAitZtcEJVigIDRemMYyRcxZvBSpOHXqoDAynBpTcWhlIulUmTcjPeAMtvxwWbbSvXKnctalXDmrJEwiZEGoWhedHpbePQxqHmWfAtDItHqozdWcRJooCcSOfbeRATPQxmyQbFDsrYqYkTX',null) 
	
;

insert into criminal_relative
	(criminal_id,relative_id,relation2criminal)
values
	(1,2, 'spouse'),
    (1,3, 'child'),
    (1,4, 'child'),
    (1,5, 'child')
;

insert into cases
	(person_id, article_id, start_date, end_date, authority, sentence_id, times)
values
	(1, 1, '1962-10-16', '1963-10-13', 'SMT', -1, 123)
;

/* update test
update cases
	set start_date = '1962-10-16'
where case_id = 1;
*/

insert into shot
	(case_id, shot_date)
values
	(1, '1862-10-17')
;