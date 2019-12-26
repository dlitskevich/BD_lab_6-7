use alliDB;

insert into alliDB.person
	(person_name,person_surname,address,birth,gender,biography,death)
values
	('Edith','Ivanov', 'Moscow Pobeda', '1932-10-27', 'male','zjSQLhyXpYGXujsHQWnHSMqujGPBhXuFDDKySshcxBSkyJmmGFTARXrOFaZmgXnmmQNIZywznMKyQBFBDueNVGSQhNaoqCchftwFOUxxXllXNjyCWILXSVHRjmRXsVchUWScSeFxjYmQCjoOf',null),
	('Deborah','Ivanova', 'Moscow Pobeda', '1933-11-25', 'female','DkAsinUSrgMBowbwiSuSjUKmULPKqrsJFagRfZiAHaTveoROIKQGIHbwYdcmQNinSGLOEUmuajmzTWHlCEFvGAYczzzvTtsghodFhHaqCLRShcIIZUIVREDAXKjYDBxqLluadApBoYSpeRorD','2006-10-14'), 
	('Brenda','Ivanova', 'Moscow Pobeda', '1952-10-16', 'female','ROVewFCcrBMlVxPVHqkKLqTUESKDHUeABMMmQBoZthtMhRUPfJhKCMwHpMIJMVYkrFPJGlLwtPMzviVKdBtBsoKgXWDqFcoLblVLFSxfllfrqkcOHwRmuBwNuWYwoXmcJzdcxpumlltuCmXqU',null), 
	('Ivan','Ivanov', 'Moscow Pobeda', '1955-10-19', 'male','MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY',null), 
	('Craig','Ivanov', 'Moscow Pobeda', '1957-12-28', 'male','arCAitZtcEJVigIDRemMYyRcxZvBSpOHXqoDAynBpTcWhlIulUmTcjPeAMtvxwWbbSvXKnctalXDmrJEwiZEGoWhedHpbePQxqHmWfAtDItHqozdWcRJooCcSOfbeRATPQxmyQbFDsrYqYkTX',null),
    
    ('Alice','Petrova', 'Moscow Soviet', '1939-07-19', 'female','ynbuRYSuJVKnwLSOrQrvjRqIljQHMwUyggcXJyVkbKTnuNZszjHtuHnRkkWMtWyhThuJnvynNCuWnhPtJTFBWbPFXrFhSjjZBTHDvCmYcUXeVuOvwgNuPAmROIXnEtWpDsqEKEszicASCavtr','2006-02-22'), 
	('James','Petrov', 'Moscow October', '1938-04-18', 'male','iNVKktJvdcFaKkOSjvFtziVGOWFbYrtAcdGDvgJCkbwvtGQgiXDzexyCaWFytzJYfSoNUfnLzAYjqnsPigvCpHOjZaEpKCEwsbIyKKWfHlNVRAzrdaWeDUOSdDoZwixJPKaKgCtEmMJIAjAJR','2006-07-10'), 
	('Michael','Petrov', 'Moscow October', '1938-09-20', 'male','vYVkyUyvMTxvOXnGwscURBhFlflpvnuTUsVySHdctSoxdIJYwkxGQhvqqdfXPLZJHfMPuGVXRoHpmwWtjuYaTOcMqZloncUUYjEvhkmrwNBgMjqjRpERRlDsuYrgrmvcBolUhnqPQJnSSeZOK','2006-06-21'), 
	('Amanda','Petrova', 'Moscow Soviet', '1935-09-24', 'male','XTMcQQlLkgZtwWOHcCNcXihFjuiMPZSeeSaqRLwnTVyBXwjzxBOXAZWcUVpDHjTLaXZmfNUdshXyslnYhqxhoQSbXLkGRgQigChbmkBzPAwyCZAsXenmrNgvGLrtqAJDzepGjFLFtPEfqxdJs','2006-02-21'), 
	('Elizabeth','Petrova', 'Moscow October', '1936-09-27', 'male','dqHqofbqffNCnXdUtuRJEocOndYfSGZXwQlHvZNODVMSDaxcOQHDPABNXEByglrlHTrDLCnjipeoRaMVlLHbbUEgibGOeSckOHuBBotGrzVMSNpiMZytquHlCZYvWfqGXhygcqUDOPhUtxdNZ','2006-02-26') 
	
;
insert into alliDB.person
	(person_name,person_surname,address,birth,gender,biography,death)
values
	('Estelle','Smith', 'Moscow Pobeda', '1937-12-20', 'female','AtZdVNXAjhRcPimRXGkPLsWwyjzOVPJsCLjjvRVqErmfrHVtPJIdJgsRhUJBGjvfkgvuQRuVaisaJFEJEsdTqQpZnpGnbdXyVaeEJjABBzrEmwdpUWNzngxIFLYKjLXKMsfwOVjrEeLnkKeLt','2006-11-28'), 
	('Joe','Stephenson', 'Moscow October', '1936-10-17', 'male','yBANHTpzoJISGJFcmJtKqHdbSBmgoqVybAbTIYdxrlxawWYIXCZDqTaOGafFwMBjvkJdnzcXHxWuEFDPcUcpLxTqMIBFaPoYvmbHQopjDpQpZQNmxnDBVMpUwlZqhXsaGeLQHogDNZSjXZTMP','2006-12-27'), 
	('Ida','Czajkowski', 'Moscow October', '1930-10-27', 'female','TPzGpDQRqbMEpWyVwFgiLWvXFdrCKQLdkxikXtedZtlOAqZiHssVkIrtOJeUCyFBxaTZNkkOBWKKvCuNWstgblFGVQgeIabkIRnAxTXgIdcEgbEYGnaFIHGGsAOzxTWyqxsykSsLbaMhspMSU','2006-12-12'), 
	('Marty','Wolfe', 'Moscow October', '1930-12-25', 'male','LeagiySKJCzZoqzmGDlfdKNqkVoyrHQfLNrmAhaPIfKiedhmqIBXRoAMDfgCrykaCYiHWMyzNFunFitcFtSFHoLsKkhYcBVffiMbFtzHNDhXmpSWAnrTpjZNDxElNRDomFBpkoCDJyIGXxECK','2006-12-16'), 
	('Patricia','Robinson', 'Moscow Soviet', '1939-10-27', 'female','MJtkVUgAOBNvagOYrXxSDWrpOfykqHeeoRBlpEHpjhnEpSSwVuKQsDDAxKLcARtwMEeGzEzmcMXTSWpiKhBAMJPGUbGWBvrIkMJLnpSHeDaAWEGLELhjYgUXBFdSbEjuhlVkRKngJinCgVlee','2006-12-19')
	
;

insert into criminal_relative
	(criminal_id,relative_id,relation2criminal)
values
	(1,2, 'spouse'),
    (1,3, 'child'),
    (1,4, 'child'),
    (1,5, 'child'),
    
    (6,7, 'spouse'),
    (6,8, 'distant'),
    (6,9, 'distant'),
    (6,10, 'distant'),
    
    (7,6, 'spouse'),
    (7,8, 'distant'),
    (7,9, 'distant'),
    (7,10, 'distant')
;

insert into cases
	(person_id, article_id, start_date, end_date, authority, sentence_id, times)
values
	(1, 1, '1962-10-16', '1963-10-13', 'SMT', -1, 123),
    (2, 8, '1962-10-16', '1963-10-13', 'SMT', 6, 123),
    (6, 1, '1962-10-16', '1963-10-13', 'SMT', -1, 123),
    (7, 8, '1962-10-16', '1963-10-13', 'SMT', -1, 123),
    (8, 1, '1962-10-16', '1963-10-13', 'SMT', 3, 123),
    (9, 1, '1962-10-16', '1963-10-13', 'SMT', 5, 123),
    (10, 8, '1962-10-16', '1963-10-13', 'SMT', 5, 123)
;

insert into cases
	(person_id, article_id, start_date, end_date, authority, sentence_id, times)
values
	(11, 1, '1962-10-16', '1963-10-13', 'SMT', -1, 123),
    (0, 1, '1962-10-16', '1963-10-13', 'SMT', 3, 123),
    (8, 1, '1962-10-16', '1963-10-13', 'SMT', 3, 123),
    (9, 1, '1962-10-16', '1963-10-13', 'SMT', -1, 123),
    (10, 1, '1962-10-16', '1963-10-13', 'SMT', -1, 123)
;

insert into case_info
	(info_description, case_id, info_content)
values
	('evidence1',1,'witness'),
    ('evidence2',6,'witness information'),
    ('evidence3',7,'witness information')
;


insert into shot
	(case_id, shot_date)
values
	(1, '1963-10-17'),
    (3, '1963-10-17'),
    (4, '1963-10-17')
;
insert into shot
	(case_id, shot_date)
values
	(13, '1962-10-17')
;

call prisoner_arrival(1, 5, '1963-10-17');
call prisoner_arrival(2, 6, '1963-10-18');
call prisoner_arrival(3, 7, '1963-10-18');

call prisoner_transfer(1,4, 5, '1967-10-17');

call prisoner_release(4, 5, '1978-10-17');
call prisoner_release(2, 6, '1983-10-18');
call prisoner_release(3, 7, '1983-10-18');


insert into afterlife
	(person_id,case_id, address,  occupation, afterlife_start_date, biography)
values
    (2, 1, 'Novosibirsk', 'nurse', '1963-10-18', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY'),
    (3, 1, 'Novosibirsk', null, '1963-10-18', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY'),
    (4, 1, 'Novosibirsk', null, '1963-10-18', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY'),
    (5, 1, 'Novosibirsk', null, '1963-10-18', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY'),
    (8, 5, 'Tomsk', 'nurse', '1983-10-18', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY'),
    (9, 6, 'Tomsk', null, '1983-10-18', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY'),
    (10, 7, 'Tomsk', null, '1983-10-18', 'MsaWRBjPnCFNVkRmYLmexnhjsvrDhrVQHqBeRDKbFAEjfMXSsxUeacXJyNLInTsLXjcWwZqzTGGaZgUhcXeWMuDFnqWMOKBzilzECZPsTgyEFiWoEUkeZyAEmwMpfQvsIkKIljhpwdNsNYQvY')
    
;

