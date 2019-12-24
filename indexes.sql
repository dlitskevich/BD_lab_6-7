USE ALLIDB;

CREATE INDEX afterlife_address_index ON afterlife(address);
CREATE FULLTEXT INDEX article_text_index ON article(article_text);