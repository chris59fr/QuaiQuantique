CREATE DATABASE quaiquantique


CREATE TABLE role 
(
    id_role INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_role VARCHAR(50) NOT NULL
);

CREATE TABLE utilisateur 
(
    id_user INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_user VARCHAR(50) NOT NULL,
    firstname_user VARCHAR(50) NOT NULL,
    dob_user DATE NOT NULL,
    email_user VARCHAR(50) NOT NULL,
    password_user VARCHAR(50) NOT NULL,
    id_role INT NOT NULL
);

CREATE TABLE message 
(
    id_message INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_message VARCHAR(50) NOT NULL,
    firstname_message VARCHAR(50) NOT NULL,
    email_message VARCHAR(50) NOT NULL,
    telephone_message VARCHAR(50) NOT NULL,
    sujet_message VARCHAR(50) NOT NULL,
    description_message VARCHAR(50) NOT NULL
);

CREATE TABLE reservation 
(
    id_reservation INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_reservation DATE NOT NULL,
    heure_reservation TIME NOT NULL,
    name_reservation VARCHAR(50) NOT NULL,
    couvert_reservation INT NOT NULL,
    description_reservation TEXT NOT NULL
);

CREATE TABLE user_reservation 
(
    id_user INT NOT NULL,
    id_reservation INT NOT NULL
);


