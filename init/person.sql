create database ALLIDB;
use ALLIDB;

create table person(
	person_id int primary key auto_increment,
    person_name blob,
    person_surname blob,
    address blob,
    birth blob,
    gender enum('male','female','undefined'),
    biography blob,
    death blob,
    repressed bool -- political
);

create table party(
	party_id int primary key auto_increment,
    party_name varchar(45)
);

create table politics(
	politics_id int primary key auto_increment,
    person_id int not null,
	party_id int,
    constraint fk_politics_person foreign key (person_id) references person(person_id),
    constraint fk_politics_party foreign key (party_id) references party(party_id)
);

create table placeD(
	placeD_id int primary key auto_increment,
    placeD_name varchar(45),
	location blob,
    placeD_type enum('camp','prison')
);

create table transfer(
	transfer_id int primary key auto_increment,
    transfer_action ENUM('arrival', 'transfer', 'release'),
	transfer_date date,
    placeD_prev int,
    placeD_current int not null,
    times int, -- time sentenced (not transfer)
	constraint fk_transfer_person foreign key (person_id) references person(person_id),
    constraint fk_transfer_placeD_prev foreign key (placeD_prev) references placeD(placeD_prev),
    constraint fk_transfer_placeD_current foreign key (placeD_current) references placeD(placeD_current)
);