use alliDB;

insert into alliDB.person
	(person_name,person_surname,address,birth,gender,biography,death)
values
	('Edith','Ivanov', 'Moscow Pobeda', '1932-10-27', 'male','zjSQLhyXpYGXujsHQWnHSMqujGPBhXuFDDKySshcxBSkyJmmGFTARXrOFaZmgXnmmQNIZywznMKyQBFBDueNVGSQhNaoqCchftwFOUxxXllXNjyCWILXSVHRjmRXsVchUWScSeFxjYmQCjoOf','1963-10-14'),
	('Deborah','Ivanova', 'Moscow Pobeda', '1933-11-25', 'female','DkAsinUSrgMBowbwiSuSjUKmULPKqrsJFagRfZiAHaTveoROIKQGIHbwYdcmQNinSGLOEUmuajmzTWHlCEFvGAYczzzvTtsghodFhHaqCLRShcIIZUIVREDAXKjYDBxqLluadApBoYSpeRorD','2006-10-14'), 
	('Brenda','Ivanova', 'Moscow Pobeda', '1952-10-16', 'female','ROVewFCcrBMlVxPVHqkKLqTUESKDHUeABMMmQBoZthtMhRUPfJhKCMwHpMIJMVYkrFPJGlLwtPMzviVKdBtBsoKgXWDqFcoLblVLFSxfllfrqkcOHwRmuBwNuWYwoXmcJzdcxpumlltuCmXqU',null), 
	('Ivan','Ivanov', 'Moscow Pobeda', '1955-10-19', 'male','MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY',null), 
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
	(1, 1, '1962-10-16', '1963-10-13', 'SMT', -1, 123),
    (2, 8, '1962-10-16', '1963-10-13', 'SMT', 7, 123) -- change
;

insert into case_info
	(info_description, case_id, info_content)
values
	('evidence1',1,'witness')
;


insert into shot
	(case_id, shot_date)
values
	(1, '1962-10-17')
;

insert into afterlife
	(person_id,case_id, address,  occupation, afterlife_start_date, biography)
values
	(2, 1, 'Novosibirsk', 'nurse', '1862-11-17', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY'),
    (3, 1, 'Novosibirsk', null, '1862-11-17', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY'),
    (4, 1, 'Novosibirsk', null, '1862-11-17', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY'),
    (5, 1, 'Novosibirsk', null, '1862-11-17', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY')
    
;