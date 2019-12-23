USE ALLIDB;

CREATE TABLE article
(
	article_id INT PRIMARY KEY AUTO_INCREMENT,
    article_number VARCHAR(45),
    article_name VARCHAR(45),
    article_text TEXT
);

CREATE TABLE sentence
(
	sentence_id INT PRIMARY KEY AUTO_INCREMENT,
    sentence_text TEXT
);

CREATE TABLE cases
(
	case_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT,
    article_id INT,
    start_date DATE,
    end_date DATE,
    authoruty VARCHAR(45),
    sentence_id INT,
    times INT,
    CONSTRAINT fk_cases_person FOREIGN KEY (person_id) REFERENCES person (person_id),
    CONSTRAINT fk_cases_article FOREIGN KEY (article_id) REFERENCES article (article_id),
    CONSTRAINT fk_cases_sentence FOREIGN KEY (sentence_id) REFERENCES sentence (sentence_id)
);

CREATE TABLE case_info
(
	info_id INT PRIMARY KEY AUTO_INCREMENT,
    info_description BLOB,
    case_id INT,
    info_content BLOB,
    CONSTRAINT fk_info_cases FOREIGN KEY (case_id) REFERENCES cases (case_id)
);

CREATE TABLE rehabilitation
(
	rehabilitation_id INT PRIMARY KEY AUTO_INCREMENT,
    rehabilitation_date DATE,
    rehabilitation_authority VARCHAR(45),
    case_id INT,
    CONSTRAINT fk_rehabilitation_cases FOREIGN KEY (case_id) REFERENCES cases (case_id)
);

CREATE TABLE shot
(
	shot_id INT PRIMARY KEY AUTO_INCREMENT,
    case_id INT,
    shot_date DATE,
    CONSTRAINT fk_shot_cases FOREIGN KEY (case_id) REFERENCES cases (case_id)
);

CREATE TABLE afterlife
(
	afterlife_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT,
    case_id INT,
    address VARCHAR(45),
    occupation VARCHAR(45),
    biography LONGTEXT,
    afterlife_start_date DATE,
    CONSTRAINT fk_afterlife_cases FOREIGN KEY (case_id) REFERENCES cases (case_id),
    CONSTRAINT fk_afterlife_person FOREIGN KEY (person_id) REFERENCES person (person_id)
);


