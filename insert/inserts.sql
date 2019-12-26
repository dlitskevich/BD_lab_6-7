USE ALLIDB;

INSERT INTO party
(party_name)
VALUES
('non-party'),
('Communist Party of the Soviet Union'),
('Democratic Union'),
('Liberal Democratic Party of the Soviet Union');

INSERT INTO spyorg
(spyorg_name, country)
VALUES
('Guardia Silenciosa Panameñista', 'Panama'),
('MI5', 'Great Britain'),
('Secret Service Bureau', 'Great Britain'),
('United States OSS', 'United States');

INSERT INTO sentence
(sentence_id,sentence_text)
VALUES
(1,'5 years of imprisonment'),
(2,'10 years of imprisonment'),
(3,'15 years of imprisonment'),
(4,'20 years of imprisonment'),
(5,'life imprisonment'),
(6,'Exiling');

INSERT INTO article
(article_number, article_name, article_text)
VALUES
('58-1', 'Counterrevolutionary', 'is understood as any action directed toward the overthrow, subversion, or weakening of the power of worker-peasant councils or of their chosen (according to the Constitution of the USSR and constitutions of union republics) worker-peasant government of the USSR, union and autonomous republics, or toward the subversion or weakening of the external security of the USSR and the fundamental economic, political, and national gains of the proletarian revolution. In consideration of the international solidarity of interests of all workers, acts are likewise considered "counterrevolutionary" when they are directed at any other workers government, even if not part of the USSR.'),
('58-1a', 'Treason to the motherland', 'acts done by citizens of the USSR in damage to the military power of the USSR, its national sovereignty, or the inviolability of its territory, such as: espionage, betrayal of military or state secrets, crossing to the side of the enemy, flight (by surface or air) abroad, shall be punishable by the supreme measure of criminal punishment-- shooting with confiscation of all property, or with mitigating circumstances-- deprivation of liberty for a term of 10 years with confiscation of all property [20 July 1934 (SU No 30, Art. 173)]'),
('58-1b', 'The same crimes, perpetrated by military personnel', 'punishable by the supreme measure of criminal punishment shooting with confiscation of all property [20 July 1934 (SU No 30, Art. 173)]'),
('58-1c', 'Flight across the border by a military member', 'In case of flight (by surface or air) across the border by a military member, the adult members of his family, if they in any way aided the preparation or carrying-out of treason, or only knew about it and failed to report it to authorities, shall be punishable by deprivation of liberty for a term of 5 to 10 years, with confiscation of all property. Remaining adult members of the family of the traitor, living together with him or as his dependents at the moment of the perpetration of the crime, shall be deprived of voting rights and exiled to remote districts of Siberia for 5 years. [20 July 1934 (SU No 30, art 173)]'),
('58-1d', 'Failure by a military member to denounce preparations', 'Failure by a military member to denounce preparations or the carrying-out of treason shall be punishable by deprivation of liberty for 10 years. Such failure to denounce by other citizens (not military) shall be punished according to article 58-12. [20 July 1934 (SU No 30, art. 173)]'),
('58-2', 'Armed uprising or incursion with counterrevolutionary purposes', 'Armed uprising or incursion with counterrevolutionary purposes on Soviet territory by armed bands, seizure of power in the center or areas with the same purposes, or, in particular, with the purpose of forcibly severing from the USSR and an individual union republic, any part of its territory, or of breaking agreements between the USSR and foreign states, shall be punishable by the supreme measure of social defense-- shooting, or proclamation as an enemy of the workers, with confiscation or property and with deprivation of citizenship of the union republic, and likewise of citizenship of the Soviet Union and perpetual expulsion beyond the borders of the USSR, with the allowance under extenuating circumstances of reduction to deprivation of liberty for a term of no less than three years, with confiscation of all or part of one\'s property [6 Jun 1927 (SU No 49, art 330)].'),
('58-3', 'Dealings for counterrevolutionary purposes', 'Dealings for counterrevolutionary purposes with a foreign state or its individual representatives, and likewise aiding by whatever means a foreign state, engaged in war with the USSR, or conducting against the USSR a struggle by means of intervention or blockade, shall be punishable by measures of social defense, indicated in article 58-2 of this code. [6 July 1927 (SU No 49, art 333)]'),
('58-4', 'The offering of whatever kind of aid', 'The offering of whatever kind of aid to that part of the international bourgeoisie, which, not recognizing the equal rights of a Communist system replacing a Capitalist system, exerts itself for its overthrow, and likewise to public groups and organizations, being under the influence of or directly organized by that bourgeoisie, in the carrying out of hostile activities toward the USSR, shall be punishable by deprivation of liberty for a term not less than three years with confiscation of all or part of one\'s property, with an increase, in especially aggravating circumstances, up to the supreme measure of social defense-- shooting or declaration to be an enemy of the workers, with deprivation of citizenship of one\'s union republic, and, likewise, citizenship of the USSR and expulsion beyond the borders of the USSR forever, with confiscation of property. [6 June 1927 (SU NO 49, art. 330)].'),
('58-5', 'Adherence to a foreign state or any public groups in it', 'by means of relations with its representatives, use of false documents or other means, toward a declaration of war, armed intervention in the affairs of the USSR or other unfriendly actions, eg: blockade, seizure of state property of the USSR or of union republics, the breaking of diplomatic relations, the breaking of treaties concluded with the USSR, etc., shall be punishable by measures of social defense, indicated in article 58-2 of this code. [6 June 1927 (SU No 49, art. 330)]'),
('58-6', 'Espionage', 'the transmittal, seizure, or collection, with the purpose of transmittal, of information, being a specially kept state secret due to its content, to foreign governments, counterrevolutionary organizations, and private individuals, shall be punishable by deprivation of liberty for a term not less than three years, with confiscation of all or part of one\'s property, or in those cases where the espionage brought or could bring especially severe consequences for the interests of the USSR-- the supreme measure of social defense-- shooting or proclamation as an enemy of the workers with deprivation of citizenship of one\'s union republic and, likewise, of citizenship of the USSR and expulsion beyond the borders of the USSR forever with confiscation of property.');

INSERT INTO placeD
(placeD_name, location, placeD_type)
VALUES
('SSCIRN-1', 'Tomsk', 'camp'),
('SSCIKN-1', 'Koirankangas', 'camp'),
('SSPISN-1', 'Siberia', 'prison'),
('SSPISN-2', 'Siberia', 'prison'),
('SSPILN-1', 'Lokchimlag', 'prison');

DELIMITER ;;
CREATE PROCEDURE insert_into_politics()
BEGIN
	DECLARE i INT DEFAULT 1;
	insert_loop: LOOP
		INSERT INTO politics
		(person_id, party_id)
		VALUES
		(i, FLOOR(RAND()*4+1)); -- (1+FLOOR(RAND()*5), FLOOR(RAND()*4+1));
        SET i = i + 1;
        IF i > 65 THEN
			LEAVE insert_loop;
		END IF;
	END LOOP insert_loop;
END;;

CREATE PROCEDURE insert_into_rehabilitation()
BEGIN
	DECLARE i INT DEFAULT 1;
	insert_loop: LOOP
		INSERT INTO rehabilitation
		(rehabilitation_date, rehabilitation_authority, case_id)
		VALUES
		('1980-01-01' - INTERVAL FLOOR(RAND() * 365) DAY, 'Good Guys', i);
        IF i > 20 THEN
			LEAVE insert_loop;
		END IF;
        SET i = i + 1;
	END LOOP insert_loop;
END;;

CREATE PROCEDURE insert_into_person_spyorg()
BEGIN
	DECLARE i INT DEFAULT 0;
	insert_loop_spotted: LOOP
		INSERT INTO person_spyorg
		(person_id, spyorg_id, episode_date, standing)
		VALUES
		(FLOOR(RAND()*10)+55, FLOOR(RAND()*4+1), '1960-01-01' - INTERVAL FLOOR(RAND() * 365) DAY, 'spotted');
        IF i > 10 THEN
			LEAVE insert_loop_spotted;
		END IF;
        SET i = i + 1;
	END LOOP insert_loop_spotted;
    
    insert_loop_suspected: LOOP
		INSERT INTO person_spyorg
		(person_id, spyorg_id, episode_date, standing)
		VALUES
		(FLOOR(RAND()*10)+55, FLOOR(RAND()*4+1), '1960-01-01' - INTERVAL FLOOR(RAND() * 365) DAY, 'suspected');
        IF i > 20 THEN
			LEAVE insert_loop_suspected;
		END IF;
        SET i = i + 1;
	END LOOP insert_loop_suspected;
END;;

/*CREATE PROCEDURE insert_into_case_info()
BEGIN
	DECLARE i INT DEFAULT 0;
	insert_loop: LOOP
		INSERT INTO case_info
		(info_description, case_id, info_content)
		VALUES
		(CONV(FLOOR(RAND() * 99999999999999), 30, 36), FLOOR(RAND()*40+1), CONV(FLOOR(RAND() * 99999999999999), 15, 36));
        IF i > 20 THEN
			LEAVE insert_loop;
		END IF;
        SET i = i + 1;
	END LOOP insert_loop;
END;;*/

CREATE PROCEDURE insert_into_spy_ep_info()
BEGIN
	DECLARE i INT DEFAULT 0;
	insert_loop: LOOP
		INSERT INTO spy_ep_info
		(info_description, spy_ep_id, info_content)
		VALUES
		(CONV(FLOOR(RAND() * 99999999999999), 30, 36), FLOOR(RAND()*23+1), CONV(FLOOR(RAND() * 99999999999999), 15, 36));
        IF i > 20 THEN
			LEAVE insert_loop;
		END IF;
        SET i = i + 1;
	END LOOP insert_loop;
END;;

DELIMITER ;

CALL insert_into_politics();
CALL insert_into_rehabilitation();
CALL insert_into_person_spyorg();
CALL insert_into_spy_ep_info();