CREATE TABLE spyorg
(
	spyorg_id INT PRIMARY KEY AUTO_INCREMENT,
    spyorg_name VARCHAR(45),
    country VARCHAR(45)
);

CREATE TABLE person_spyorg
(
	episode_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT,
    spyorg_id INT,
    episode_date DATE,
    episode_action TEXT,
    standing ENUM('spotted', 'suspected'),
    CONSTRAINT fk_episode_person FOREIGN KEY (person_id) REFERENCES person (person_id),
    CONSTRAINT fk_episode_spyorg FOREIGN KEY (spyorg_id) REFERENCES spyorg (spyorg_id)
);

CREATE TABLE spy_ep_info
(
	info_id INT PRIMARY KEY AUTO_INCREMENT,
    info_description BLOB,
    info_content BLOB,
    spy_ep_id INT,
    CONSTRAINT fk_info_episode FOREIGN KEY (spy_ep_id) REFERENCES person_spyorg (episode_id)
);

CREATE TABLE compromat
(
	compromat_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT,
    importance DOUBLE,
    compromat_content BLOB,
    CONSTRAINT fk_compromat_person FOREIGN KEY (person_id) REFERENCES person (person_id)
);

CREATE TABLE criminal_relative
(
	criminal_id INT,
    relative_id INT,
    relation2criminal ENUM('spouse', 'sibling', 'parent', 'child', 'distant'),
    CONSTRAINT fk_relative_person FOREIGN KEY (relative_id) REFERENCES person (person_id),
    CONSTRAINT fk_criminal_person FOREIGN KEY (criminal_id) REFERENCES person (person_id)
);