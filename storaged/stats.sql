use allidb;

drop procedure article_sentence;
DELIMITER //
create procedure article_sentence()
BEGIN
    select article_id, article_name, sentence_text, percentage, temp2.quant  from 
	(select article_id, sentence_id, count(sentence_id) as quant, count(sentence_id) / temp.at_all as percentage
		from cases natural join (
			select article_id, count(sentence_id) as at_all from cases
			group by article_id
			) as temp
		group by article_id, sentence_id
		order by article_id, sentence_id asc
        ) as temp2
	natural join article 
    natural join sentence
;
END//
DELIMITER ;

call article_sentence();

/*
select article_id, article_name, sentence_text, percentage, temp2.quant  from 
	(select article_id, sentence_id, count(sentence_id) as quant, count(sentence_id) / temp.at_all as percentage
		from cases natural join (
			select article_id, count(sentence_id) as at_all from cases
			group by article_id
			) as temp
		group by article_id, sentence_id
		order by article_id, sentence_id asc
        ) as temp2
	natural join article 
    natural join sentence
;
*/

drop procedure sentence_article;
DELIMITER //
create procedure sentence_article()
BEGIN
    select sentence_id,sentence_text, article_name,  percentage, temp2.quant  from 
	(select article_id, sentence_id, count(article_id) as quant, count(article_id) / temp.at_all as percentage
		from cases natural join (
			select sentence_id, count(article_id) as at_all from cases
			group by sentence_id
			) as temp
		group by sentence_id, article_id
        ) as temp2
	natural join sentence 
    natural join article
    order by sentence_id, article_id asc
;
END//
DELIMITER ;

call sentence_article();

drop procedure article_politics;
DELIMITER //
create procedure article_politics()
BEGIN
    select article_id, article_name, party_name, percentage, temp2.quant  from 
	(select article_id, party_id, count(party_id) as quant, count(party_id) / temp.at_all as percentage
		from cases natural join (
			select article_id, count(party_id) as at_all from cases natural join person natural join politics
			group by article_id
			) as temp
		natural join person natural join politics
		group by article_id, party_id
		order by article_id, party_id asc
        ) as temp2
	natural join article 
    natural join party
;
END//
DELIMITER ;

call article_politics();

drop procedure politics_article;
DELIMITER //
create procedure politics_article()
BEGIN
    select party_id, party_name,article_name,  percentage, temp2.quant  from 
	(select party_id, article_id, count(article_id) as quant, count(article_id) / temp.at_all as percentage
		from cases natural join (
			select party_id, count(article_id) as at_all from cases natural join person natural join politics
			group by party_id
			) as temp
		natural join person natural join politics
		group by party_id, article_id  
		order by party_id, article_id  asc
        ) as temp2
	natural join article 
    natural join party
;
END//
DELIMITER ;

call politics_article();


drop procedure sentence_politics;
DELIMITER //
create procedure sentence_politics()
BEGIN
    select sentence_id, sentence_text, party_name, percentage, temp2.quant  from 
	(select sentence_id, party_id, count(party_id) as quant, count(party_id) / temp.at_all as percentage
		from cases natural join (
			select sentence_id, count(party_id) as at_all from cases natural join person natural join politics
			group by sentence_id
			) as temp
		natural join person natural join politics
		group by sentence_id, party_id
		order by sentence_id, party_id asc
        ) as temp2
	natural join sentence 
    natural join party
;
END//
DELIMITER ;

call sentence_politics();

drop procedure politics_sentence;
DELIMITER //
create procedure politics_sentence()
BEGIN
    select party_id, party_name,sentence_text,  percentage, temp2.quant  from 
	(select party_id, sentence_id, count(sentence_id) as quant, count(sentence_id) / temp.at_all as percentage
		from cases natural join (
			select party_id, count(sentence_id) as at_all from cases natural join person natural join politics
			group by party_id
			) as temp
		natural join person natural join politics
		group by party_id, sentence_id  
		order by party_id, sentence_id  asc
        ) as temp2
	natural join sentence 
    natural join party
;
END//
DELIMITER ;

call politics_sentence();
