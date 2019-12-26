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
	('Elizabeth','Petrova', 'Moscow October', '1936-09-27', 'male','dqHqofbqffNCnXdUtuRJEocOndYfSGZXwQlHvZNODVMSDaxcOQHDPABNXEByglrlHTrDLCnjipeoRaMVlLHbbUEgibGOeSckOHuBBotGrzVMSNpiMZytquHlCZYvWfqGXhygcqUDOPhUtxdNZ','2006-02-26'),
	
    ('Estelle','Smith', 'Moscow Pobeda', '1937-12-20', 'female','AtZdVNXAjhRcPimRXGkPLsWwyjzOVPJsCLjjvRVqErmfrHVtPJIdJgsRhUJBGjvfkgvuQRuVaisaJFEJEsdTqQpZnpGnbdXyVaeEJjABBzrEmwdpUWNzngxIFLYKjLXKMsfwOVjrEeLnkKeLt','2006-11-28'), 
	('Joe','Stephenson', 'Moscow October', '1936-10-17', 'male','yBANHTpzoJISGJFcmJtKqHdbSBmgoqVybAbTIYdxrlxawWYIXCZDqTaOGafFwMBjvkJdnzcXHxWuEFDPcUcpLxTqMIBFaPoYvmbHQopjDpQpZQNmxnDBVMpUwlZqhXsaGeLQHogDNZSjXZTMP','2006-12-27'), 
	('Ida','Czajkowski', 'Moscow October', '1930-10-27', 'female','TPzGpDQRqbMEpWyVwFgiLWvXFdrCKQLdkxikXtedZtlOAqZiHssVkIrtOJeUCyFBxaTZNkkOBWKKvCuNWstgblFGVQgeIabkIRnAxTXgIdcEgbEYGnaFIHGGsAOzxTWyqxsykSsLbaMhspMSU','2006-12-12'), 
	('Marty','Wolfe', 'Moscow October', '1930-12-25', 'male','LeagiySKJCzZoqzmGDlfdKNqkVoyrHQfLNrmAhaPIfKiedhmqIBXRoAMDfgCrykaCYiHWMyzNFunFitcFtSFHoLsKkhYcBVffiMbFtzHNDhXmpSWAnrTpjZNDxElNRDomFBpkoCDJyIGXxECK','2006-12-16'), 
	('Patricia','Robinson', 'Moscow Soviet', '1939-10-27', 'female','MJtkVUgAOBNvagOYrXxSDWrpOfykqHeeoRBlpEHpjhnEpSSwVuKQsDDAxKLcARtwMEeGzEzmcMXTSWpiKhBAMJPGUbGWBvrIkMJLnpSHeDaAWEGLELhjYgUXBFdSbEjuhlVkRKngJinCgVlee','2006-12-19'),
	
	('Mary','Tutor', 'Moscow Soviet', '1935-07-10', 'male','lsBEvZyZcagSrRqLZZGjPCiKfVUJZNFVxioJqVBYjQLcVElkWgHqFqGhaTrklEtruFDyWvozHssQqQFGfUCAsFdbcKsNdhdCCqAbjSeROTsWzeQAbnvZqDeJnYGWAfTcYFwHuJEYijLpctami','2004-02-23'), 
	('Rosie','Krouse', 'Moscow Pobeda', '1939-03-26', 'male','vKQsMsLjAnXeiOwDZwstcpXSimFIjkRvBQULrTzFCLfyFrfhhCeaUCmXBIyUrryQSAJZJiOgnxwmyoCzajawJOufnguXpfigFbcElDbngXGwBBwwjasGiaxJnRmMxuKUmrBqLpMlfQTWzqHaQ','2001-05-21'), 
	('Barbara','Crochet', 'Moscow Pobeda', '1939-03-27', 'male','KAwotabzDFbXYaVcnirYVZUraDSPSTeBOxGAfCEEumjmndmcdoQfmXkzAlPHDBRqTwrktNOprZgtPBkeWfxtjUfLPAcWZAVXzjKmLaqjOUeFWlGmSQuvNdvQmXUHqPjTSblRxrmkoCoPZFyZW','2001-01-14'), 
	('Sybil','Jordan', 'Moscow Soviet', '1932-08-20', 'male','tMBRNSjIxOvvenQmnVThotkqokkocZDKvAsOFmVPRHbcXCdwevnysxyGgOHHoCfBkpgTtMLXqrzUxtcgXglIPYMRmyLpcnkySVjLGqRwihgdLuUDhoSYrUBgLIYtotOYqKGBCJcaLkHWcWlPI','2002-05-13'), 
	('Elmer','Cornish', 'Moscow October', '1930-07-12', 'male','hkWUIkIgtZVenGrTQwGamxDHyjGYRgdKYyvbvzIGvMdQfvtoGwOmFLeEVSJPkihEiFfbMnvpgnePHqBFYsOccnxNhSkyiDDuGcSCOboFtrDNQWsNphwKkGkCBHfEFnEGLuLMeBXljtzzvryrB','2007-08-25'), 
	('Rose','Smith', 'Moscow October', '1934-08-20', 'male','dmJBWrpTtHMuOmYQptofjqeuSFfmdGcsdAxrtAplNXzKwvLZGcGLdIDkoDqrehRmuzhgjrBhQiVoflBRpAtHBeXyOrPJnXanAkdGasDBucsdRPHVhhdpfbuKSWOnusHhRhVHtyTuGIaZRKJXu','2001-01-27'), 
	('Aaron','Cropp', 'Moscow Pobeda', '1934-06-19', 'male','yJJrtFVaxBjUfPQBuUaJibCXnwFxOoSZyBikEQHiHmnPKYYAbihKuFiaCrxNYKGNkUgRyVlVSAHjDldUZkcELcqJrHvaijUhZGIMnWTMMyRhpwLXzlnhTjRhqYIMSuufFyOSizxEFAVgnxyeT','2002-08-18'), 
	('Chris','Cheek', 'Moscow Soviet', '1930-07-21', 'male','ewrSdsrbVPquKERmEgqJQiXxSZfqTjMBGWDPhNqdIWmTarFFJBGGCsgeMEBFiQbemODGxQwNjQnEvLziSDcVIMxuXBNeTUJrSObsJZyzhlpUEcAOFqyTcpRkfMgxSOXGaVWRnftygcAwOketW','2001-06-24'), 
	('Sheldon','Cooper', 'Moscow Soviet', '1930-05-15', 'male','UcANDyUciqVKuGQSbWEjiTUPtDXugwbGJsDRlwEPCHNBxFneTjHoPgqgtIdXyDwcFmwUvBmwdfTSwdAYuJseaKoLLSCtWXcuaOcOiiZVumjFCasVltYWLjQUcwuVatKNgyDfAPyMFewgpNevZ','2007-04-22'), 
	('Frances','Jones', 'Moscow Pobeda', '1930-02-16', 'male','yTpYPzFVnMYdrzgNUuEbxIGhMBmRxwxJOrczaMbKdXMmAOEXmEOkyPYdsFViVTKlAlhSwnVZouKKFzqDscKPwotfghyCvdYkVDPaSZroYiTAwMKuSCGzauQBqydhPApteWPYEaAffabumBkMV','2004-04-20'), 
	('Estela','Steen', 'Moscow Soviet', '1938-02-28', 'male','JOwNeoHuTHEthtzAAXspMvWuAGdPOCMJjYuImcrOVdyPfXlEBjhWdauUJvjuWiJIvOJBqZayeSLfuCdYUpniFWWaSZiFpvItabNUkSpKtOmyAZgJWHaRKdVZkeWFHeWeCtgWhBRZYQcZMIKOM','2002-03-16'), 
	('Wendy','Karel', 'Moscow Pobeda', '1939-03-16', 'male','CNYXrHuXFYQEGzYJeAvypPNgSlSZRHtqAkzgoCVPkalJTNwQGwqZiVsnHkexevhQEbbWBRceWjGiHtClupUvrJUhoouUwbnYqBAEVWTehuqiTtFVBhNxGtnlcNNURIJYhkMMPeMlMOuMRkKgn','2009-03-18'), 
	('John','Row', 'Moscow Soviet', '1930-07-25', 'male','knJuApLyciYsaXGgnZzPeHSHPJefnTZRJUhrwKtGUxlMgNHtFRmHhrWryBAjPYcJBksyMwPVmcdGgblYfBoAaVxsPZolScbePInwpePFDYFdOHVCRqVwMFQAWLebLiUUxGdTjlcjovyOECQBO','2006-01-25'), 
	('Ramon','Larose', 'Moscow October', '1936-05-16', 'male','fHubijvXJOTtOdlxjIrCZzxtUNVjNDJSSTOpZGIyVRNeFxkRuOwZUycDzUHmAzygUCGCpzPYcuffRfjfcBdHjEVaXplAaEinIesLbsQkpzzgfmhqmdbLLxkazKdSsakdeGawBOLWfRojJUfxT','2001-01-27'), 
	('James','Hull', 'Moscow Soviet', '1931-09-27', 'male','NivxFOqcakNgVwlzOLJkuaSKymoQdpewoKtdeUuVFBluEeFciRWAeXzyzcrhEgwIpgYjmUnzGtzxtmMEWwKCPeZZHHanBsrfLpMbSehsxzTTksOAnfYkTMLjmFVggMdqPeryinwUMQkttNBIF','2001-03-25'), 
	('Brandon','Zimmerman', 'Moscow Pobeda', '1932-03-12', 'male','XzdSNzGVryXjWfitYYpEpGnHiYnORHtcLiIvPMpDAUTSrMgepUiIVgRrwOQAMBOyLWiVTIZnnoOJxkcYFZfqtqryrBGUFvktOmHbvafQhNAJLyWIpmVsQVshYLHUpShvQKCIECmyGymlhYLOZ','2001-08-23'), 
	('Karl','Mattingly', 'Moscow Pobeda', '1937-06-21', 'male','XjsdyZZnSqhsdMWRQBlzWLDOoppXMKxdGWATSgAEUDHJwiilTjixwOnOLIcxaUciAyXrIBWgeFCUvLqtqIlewrlPtooefEbuSzWqnqbJDRVROnkeUpmebOLCMJPVWcLOyFyLyjGVKvSZGbeCo','2003-02-16'), 
	('Shari','Fish', 'Moscow Soviet', '1935-02-21', 'male','MbinBONXRMygsbJylpNSTDioIJnTivcrzokKycreOjpFfdIQNKXgTwYULjbNNPHfbjkEzGJOGneYUHGDxAMLpHQXzgKNyTluLuyrkqllXbhWvmpoPJmqMHiMQelYXhJUPDYlfnUweXRQmkIgz','2002-07-25'), 
	('John','Amparan', 'Moscow Pobeda', '1936-01-18', 'male','LfusLCsAMFLdrVMRcasuIcmqthSznqVfRUnxltKolVGOGlZOCmSSWQZwYGldkoRxEFlBTAwyAObqVTUZkTJEqixXRuJEFvDLeLKUUwhRhEyqOwMMmKxOwrUNHxvxmqKPfOtMbhmnEckXNEqVp','2005-04-14'), 
	('William','Mcmillan', 'Moscow Soviet', '1935-02-19', 'male','CTPQxrFEZDLxRrQJppHPusSbWEDkbHdCzKRRTKCMXqHBDaTyBYCeLvDXHoZujNsAlsGzLpQdiheHMwArnOQslxbgrtGOwxOqzRhZuyVgSTXAUJHsSZrdrQeJGDOxzsDXCZtRgPyJohPGZLrgz','2009-07-20'), 
	('Guadalupe','Groeneweg', 'Moscow October', '1931-08-10', 'male','JYBBOobaUEGDkfNSTyVZgiBZjFvsYhBQMzeSkEAWekUKOvzdtaHFZzBBzfjmuYdiXgSfIcvTHENAwobNFpICdgjyPjsfNfwisMiTdVUJsuYNNfGAmZfcRTbByQWWLZgTQfCtENHyqyodwKqon','2004-06-20'), 
	('Daniel','Jenkins', 'Moscow Pobeda', '1934-07-24', 'male','lqcbfNqgaXkZEpgEPdKRzdglGWravkZyyrKvuGbrLKMPiTvxsGeKaOlZwJeRJTddqefcrDCSvFimAkDJoMcRgGmQnrYCJIKgcBqezyEOywSaMGhNJuarbQcOAocNkUnUEFVynKQHgUzTlmvOo','2009-04-20'), 
	('Scott','Levine', 'Moscow Soviet', '1930-04-17', 'male','RXFFOuUPGYgXawLmIBGiaOoQDKFOeZHRyVTIwkIEyKkjRmFGgjBYqLYFDSsUjNIOWgkQFRYearJWycWeVchRmRnJKqNJLufoKThvnKwaaofDJbxvWCGmPzDUnRpfsbNUBIjrUKVSwLnkkRQMH','2003-05-13'), 
	('David','Griffith', 'Moscow Pobeda', '1934-04-14', 'male','CeKLEZgMPlBVdoCAEQcfNhaUWZDysKDfkYBuHCfHyeyxjLuQxZLPbNtACbDYwLrWpWEPNdeXSFodmIkUPynBgpOVlpHtOqssAlHCKBsLLGDSaATMFGxQQyiAlZqhkZKOQZlszLAmBqtdOoHWe','2009-09-11'), 
	('Tracey','Roten', 'Moscow October', '1934-09-11', 'male','KfcWZQjYFeHDcWcxKKemvVpANwpkgqHKCEtvLJyQjCOWDwkwIHpTRRBLCWhfJtXqkcQIYvQsxulFDdtYTpyZvRMAOFOXYpCYOBUZdWJSzKZODHBHxNMVbrpsDNfomPYcxDbcOymLLaksDQdWc','2001-06-26'), 
	('June','Moore', 'Moscow Pobeda', '1930-09-28', 'male','hHJxKJCWLuKCtOoppwNMhFxFXGpOBedgPwinqrvPpAZizbOcrISSOpFAmMXtorihEXMGZHleqgROybugmfRSvoBKzXRVJXYzGakbLrUSmtLvVjIZGmaRcGVmSxwEjojHsnIFgWoyYVlYubgDi','2008-01-20'), 
	('Daniel','Riggie', 'Moscow October', '1939-08-11', 'male','jrIcRdHnIuQzWQcnAfUWJQXvSUVdujJAhhsDKKGwnoRoMtPVBzTJVJuiwsOLprDaGMHvkpcZvwAirjezrsenTLAKPlkYcRjXlsMexEogDjUbCjkmXoMAGvhaHNEsFReodICELwrofTCcRBDwY','2008-08-10'), 
	('Robert','Alexander', 'Moscow Pobeda', '1932-09-19', 'male','lythUldoTsKZcbTQKhxzgvMVIWIiLAkNmVHzunlpzrrZpLtNjqPtZByJPPKUnYmZeqLWljdGoFnDkaIWlpcdRHYjahxqtkprpGXgapTvMwOfeVGIaHJLmjyrYyILbqkcjUwsGPQAzRpEYsXEf','2006-06-16'), 
	('Todd','Perry', 'Moscow Soviet', '1935-03-17', 'male','kEcwKapIWaCavioDayXshEpSMODpJHVJMUHOEzYePsTHiGJvcdGTFAnHhHJkMgDAacvYUWWnaowBPWidPlpnDPYXiKYvmjZKZoJCKdXFydlKJtblDpwwXkcgMbHsduecjKKvzxBhdZybmIwZN','2003-09-11'), 
	('Keely','Stamper', 'Moscow October', '1933-03-14', 'male','xzVGhsOJcDbzHHFJgROLrmyzLadAXbMlSKSgTuAqukWybVfVcNLohiVvEBGZAEnDfaOJwvHNnnYElXvbpQmHquzjWJLNHRdGsjjnFGNuWjqpPEvZnrSDORNShPPOQyeFTMcMFqDQCPBDSFtEz','2005-05-14'), 
	('Jennifer','Schleicher', 'Moscow Pobeda', '1930-04-27', 'male','DCcZhwceQzVygPOlTyjWnAZksZzcmXMJGnEBtRSJfpAHTYAaqhLuYCieejHkpsBIZiQbUoWkHXhjynzBOLtPADCONEQkMALzoKVeqJxgabUHEUHoAtGHBWTEPLJfNlsxqjQynmPjCGdMMUbkl','2002-04-14'), 
	('Joshua','Gillian', 'Moscow Soviet', '1936-09-24', 'male','SeqhGiEecNlPqpdUGmdfjBynCwbtURYfBMInrxZTzAFnoTxNSmdpqSwFMjchSbvMUYjnIjSbALUOKInaLuoWrqhDPqNYKqjVDuTnBfJImkqlFPvrFJpnycMPHIkodZJmzSAICokinladXPkWG','2004-02-22'), 
	('Barbara','Brandenburg', 'Moscow Pobeda', '1933-02-25', 'male','UvXfdZbEafJVPZUrhWwJGwmzuZkKuRuITZLRNcKccqdLuwGjkWVncAQdxxOwWkJXdHqVcLOpPJzbtQDddAcCwefNYbgYlAHLZpsxvchJwOOfiegcHNAAAyPAMigeZNlAAUGHcSUIbytdauWGf','2009-02-26'), 
	('Laura','Gugler', 'Moscow Soviet', '1936-09-27', 'male','MrNRqLYSkpVQAWDytkCFFfKNOuFODXUFdaadBxlPYPvQwZzDIUzoRDYcWgoGUUUTbUWNUxPAcMTEvqpdbGINxEAVBpdjxuhjDgzJOpbFnkNcmoeTGJdImRUccnDpvSbQseMReZZzEghVsZsfC','2003-06-17'), 
	('Cynthia','Carson', 'Moscow Pobeda', '1930-03-17', 'male','chlxtEsFzTgQCklhbfOHLrlpwCDLWRZnPdTIQcgOCIySUPczAXMulJjCzVCaZiwfvEasBSPNcErkWPZLeSrVHMVqPeCQsqiTWWYWRrpJYzXSaKQrWTDVlNokElcRqzChpsdeJoZYDcURIbVJO','2006-04-28'), 
	('Craig','Balducci', 'Moscow Pobeda', '1936-01-22', 'male','XdZDgLsQocapVPDChSxDwjkpRZPetRKwQHHkVtdMVSipqPZFKJdHrJeKryqaHxBPBYpJualWMjzBleuixNNOPcKfQkPrBZHSFmMEhthJeLHGNrrCgYVUaqhZjgbgmiMHUzgMnuecFqCduVeKA','2008-07-13'), 
	('Mary','Whitesides', 'Moscow Pobeda', '1934-02-17', 'male','mmNQexffeUGtyncZLtFBopigxkpQvZHrJOSWZfKgAophqfUmnEVaFgnTfvfEDyUKEUQEDNqZmlWCVecHfgOxFOtdoqvBGTFlIebScRgDopgjDuDVAUGvlsYAlsYquOwHkHWnFddvmfGWzavkH','2004-09-17'), 
	('Kellie','Cassell', 'Moscow Soviet', '1931-01-28', 'male','ZVPfaAAYTqYYOUafLoeMveBioExaKaVUfYposzefqZHjFxoLkaWCteIaWniSmNZsMPktFsgNMODZeZPXNSPxWkXxTyOewpZupUfMtWGBavsEsZZhirYNwCCiGqkUQxSKZXgeoDxIdeDfAgosr','2001-02-27'), 
	('Kristine','Sorell', 'Moscow October', '1939-02-22', 'male','BmxuwKoPtRsfsZCqhEJjBKkKuBKrUbTOmjllLEcZmwSPOsMMSGsSzKALJzltDUzamEdMzunouQsZZcyvrYMcyFrLtADoBkabSyppUnEnMPxuywLIcaoAlKXgVftWGoLbZXxhYtJFSKABIoJgx','2006-03-19'), 
	('Juanita','Johnson', 'Moscow October', '1937-05-22', 'male','mfXdSPZWOFHPVDNdpLnSpXywQcfAnAiQDSHAvqldJnwZBBTEFNCJRFPInuGPCrHPbzgqjZYVQpZrWAmaBVyevsEWzhcaOsGyMWmdMvGgnMvrmyVTGXSzDPPthJDZFkemlHABIwntSfgmMSIrY','2002-05-10'), 
	('Ronda','Heath', 'Moscow Soviet', '1934-08-16', 'male','VBiwmmpdLdoidZAQCRUtwagzudgwoMhlvGdSRliHEQAVgzKkuZkfaOFnzqdvNArSzAGIZyglwYwqNMQoGYCKhdSTyclXoldIygWQcDVAnBHvmromnWyvrjzxIUpuSXjKFBPWiutvoFJnUTMwX','2009-07-14'), 
	('Keri','Vasquez', 'Moscow Soviet', '1937-09-26', 'male','PWyjOTQmxUTBSfHJTyvYPAIQKpNfuHqWQeEPJMRmkHmOmntGrCOkqDlEvhkAYOgvkqTFatZXuxSdXSsDLSjaGCTSTzgYWAUuUgeoKCYhdwZlHDeDKDntANmGcOZEyMSHgEXtkdnxfWuWQymtq','2007-02-15'), 
	('Latoya','Palacios', 'Moscow Soviet', '1933-03-12', 'male','JTvwqiMwjYvMLodaZQyKxJMSuZlNDzBhngnQAQdPSIaGXdZbgWgHyzyuHpedJBuEMwyDVadHuqEVrmjAxasGvfpEmvbbEShJCayvldGhWFayTnpEwsQSSIRVAiajaBjZJKSYAOyNaCiJqhemy','2003-06-18'), 
	('James','Weaver', 'Moscow October', '1934-02-28', 'male','vgVjnLyZfeIhrqPYwbwGdRnWtwPOGJeTuLrWQrUETsHJPwDFGawzJpfSHECfjbvEZGSOVVubwrXbDrxORdOGhtiUckBNozHYkmCMWuIqYDmJvzMzrBlizFpqNvPXXUWMJTijBKWWUCLhBaZmY','2005-02-16'), 
	('Megan','Garcia', 'Moscow Pobeda', '1939-03-26', 'male','MNQnWeCAhlNDjBsHDsAXmMYJnboBNyKlHxhWwGAttfOOzxRdfPcffjXvaspNqoHeIovarQZEltAIRGkAQAOIxdKRzKVBMZNcHLaxDLcXtqsgpgaFEmEDZpTxtuPmBkPeqjfolmwjuwOirLsBZ','2002-07-11'), 
	('Herbert','Starr', 'Moscow October', '1936-03-12', 'male','CnFyZDUOMskmfMxBUTRnbYMXvVYgKgHDFHSZiWhouEaIGuNoawnwlGvLAkMGEhjnQAWjDcdWmoYFBmkEAxQuDeZAqIDUOyBRhuhhyjDKMTePgOijJeGrHbIvkOhgRfwVBGMjkIMWGdJnIOnRY','2001-02-21'), 
	('Suzette','Rodriguez', 'Moscow October', '1933-02-27', 'male','yymrcpzXYPWjnqaFqjEFXLmaGbFFjvplVlqkwjZUxXGHDqfEoJsljLUftxDRpGkuEJaEmxUcFCIypVIURZFKDOzYsFFAAbWoGMCOvsblxBgXGQFpWczfGrorSzYFRXahNWBeSCnrrKLrXCCFv','2005-07-27'), 
	('Neal','Gingerich', 'Moscow Soviet', '1930-08-21', 'male','mszAbogfnJchrnCWlAohcPPkdwDLLedvpMNWEsBYHItaoSDJgTizRACSQYhTZiYSYIhaOCZXBEWeUOpTPnEljhcAuWHyPlPMKRgnHKywPaDKFMhwdrXmVXKnOTLpcczJCzIgVIffYkawYAXrP','2007-09-25'), 
	('John','Garland', 'Moscow Pobeda', '1933-03-20', 'male','ynefYDJIGcMLpMddphAJusyvKOInIvawXyYNbugmjDSieZNjseEREEyhuXigSznxnfhQRLwPKqnshIInTOgRRvFwzaBVAmSdMhZjnZciJKknwSdynzUSWnxjMVkwNrkpmaNMjzhFfbHTBPHfi','2001-08-17'), 
	('Franklin','Lesnick', 'Moscow Soviet', '1930-07-22', 'male','AnvVkBFEhHbSCfMVCIurXrnSNWjxmhHVprYzlQipgNMcmGZCMaHCyaQqyenunzPDtqoctgMMEEuwtWHFmrUqgjonGIWYrbAtzuakVaEFVEeUtCconPEvHJzKIXRNbSRFHhecKBUzcirqqzLIM','2008-09-17')
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

