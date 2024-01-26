CREATE DATABASE quaiquantique ;
USE quaiquantique;

CREATE TABLE role 
(
    id_role INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_role VARCHAR(50) NOT NULL
);

CREATE TABLE user 
(
    id_user INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_user VARCHAR(50) NOT NULL,
    firstname_user VARCHAR(50) NOT NULL,
    dob_user DATE NOT NULL,
    email_user VARCHAR(50) NOT NULL,
    password_user VARCHAR(50) NOT NULL,
    id_role INT NOT NULL
);

CREATE TABLE message 
(
    id_message INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_message VARCHAR(50) NOT NULL,
    firstname_message VARCHAR(50) NOT NULL,
    email_message VARCHAR(50) NOT NULL,
    telephone_message VARCHAR(50) NOT NULL,
    sujet_message VARCHAR(50) NOT NULL,
    description_message VARCHAR(50) NOT NULL,
    id_user INT NOT NULL
);

CREATE TABLE reservation 
(
    id_reservation INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
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

CREATE TABLE allergenes 
(
    id_allergie INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_allergie VARCHAR(50) NOT NULL
);

CREATE TABLE reservation_allergene
(
    id_reservation INT NOT NULL,
    id_allergie INT NOT NULL
);

CREATE TABLE user_allergene
(
    id_user INT NOT NULL,
    id_allergie INT NOT NULL
);

CREATE TABLE avis 
(
    id_avis INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    description_avis TEXT NOT NULL,
    date_avis DATETIME NOT NULL,
    note_avis INT NOT NULL,
    status_avis VARCHAR(50) NOT NULL,
    id_user INT NOT NULL
);

CREATE TABLE horaires
(
    id_horaires INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    ouverture_horaires TIME NOT NULL,
    fermeture_horaires TIME NOT NULL,
    id_user INT NOT NULL
);

CREATE TABLE services
(
    id_services INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_services VARCHAR(50) NOT NULL,
    id_horaires INT NOT NULL
);

CREATE TABLE jours
(
    id_jours INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_jours VARCHAR(50) NOT NULL,
    status_jours VARCHAR(50) NOT NULL
);

CREATE TABLE jours_services
(
    id_jours INT NOT NULL,
    id_services INT NOT NULL
);

CREATE TABLE menu
(
    id_menu INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_formules VARCHAR(50) NOT NULL,
    description_formule TEXT NOT NULL,
    prix_menu INT NOT NULL,
    id_user INT NOT NULL
);

CREATE TABLE carte
(
    id_carte INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titre_carte VARCHAR(50) NOT NULL,
    id_user INT NOT NULL
);

CREATE TABLE categories
(
    id_categorie INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_categorie VARCHAR(50) NOT NULL,
    id_carte INT NOT NULL
);

CREATE TABLE mets
(
    id_mets INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_mets VARCHAR(50) NOT NULL,
    description_mets TEXT NULL,
    prix_mets INT NOT NULL,
    id_images INT NOT NULL,
    id_categorie INT NOT NULL
);

CREATE TABLE images
(
    id_images INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_images VARCHAR(50) NOT NULL,
    chemin_images VARCHAR(50) not null
);


CREATE TABLE vins
(
    id_vins INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_vins VARCHAR(50) NOT NULL,
    type_vins VARCHAR(50) NOT NULL,
    origin_vins VARCHAR(50) NOT NULL,
    description_vins TEXT NULL,
    millesime_vins DATE NULL,
    prix_vins DECIMAL NOT NULL,
    id_categorie INT NOT NULL
);

CREATE TABLE softs
(
    id_softs INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_soft VARCHAR(50) NOT NULL,
    description_soft TEXT NULL,
    type_soft VARCHAR(50) NULL,
    bouteille_soft BOOLEAN NULL,
    bio_soft BOOLEAN NULL,
    couleur_biere VARCHAR(50) NULL,
    prix_soft DECIMAL NULL,
    id_categorie INT NOT NULL
);

CREATE TABLE alcool
(
    id_alcool INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_alcool VARCHAR(50) NOT NULL,
    quantite_alcool DECIMAL NULL,
    age_alcool INT NULL,
    type_alcool VARCHAR(50) NOT NULL,
    couleur_biere VARCHAR(50) NULL,
    bouteille_biere BOOLEAN NULL,
    quantite_biere INT NULL,
    description_alcool TEXT NULL,
    bio_alcool BOOLEAN NOT NULL,
    prix_alcool DECIMAL NOT NULL,
    id_categorie INT NOT NULL
);



ALTER TABLE user ADD CONSTRAINT fk_id_role FOREIGN KEY (id_role) REFERENCES `role`(id_role);
ALTER TABLE message ADD CONSTRAINT fk_id_user_message FOREIGN KEY (id_user) REFERENCES `user`(id_user);
ALTER TABLE horaires ADD CONSTRAINT fk_id_user_horaire FOREIGN KEY (id_user) REFERENCES `user`(id_user);
ALTER TABLE avis ADD CONSTRAINT fk_id_user_avis FOREIGN KEY (id_user) REFERENCES `user`(id_user);
ALTER TABLE menu ADD CONSTRAINT fk_id_user_menu FOREIGN KEY (id_user) REFERENCES `user`(id_user);
ALTER TABLE carte ADD CONSTRAINT fk_id_user_carte FOREIGN KEY (id_user) REFERENCES `user`(id_user);
ALTER TABLE services ADD CONSTRAINT fk_id_horaires FOREIGN KEY (id_horaires) REFERENCES `horaires`(id_horaires);
ALTER TABLE categories ADD CONSTRAINT fk_id_carte FOREIGN KEY (id_carte) REFERENCES `carte`(id_carte);


ALTER TABLE mets ADD CONSTRAINT fk_id_images_mets FOREIGN KEY (id_images) REFERENCES `images`(id_images); 
ALTER TABLE mets ADD CONSTRAINT fk_id_categorie_mets FOREIGN KEY (id_categorie) REFERENCES `categories`(id_categorie);
ALTER TABLE vins ADD CONSTRAINT fk_id_categorie_vins FOREIGN KEY (id_categorie) REFERENCES `categories`(id_categorie);
ALTER TABLE softs ADD CONSTRAINT fk_id_categorie_softs FOREIGN KEY (id_categorie) REFERENCES `categories`(id_categorie);
ALTER TABLE alcool ADD CONSTRAINT fk_id_categorie_alcool FOREIGN KEY (id_categorie) REFERENCES `categories`(id_categorie);


ALTER TABLE jours_services ADD CONSTRAINT fk_id_jours_services FOREIGN KEY (id_jours) REFERENCES `jours`(id_jours);
ALTER TABLE jours_services ADD CONSTRAINT fk_id_services_jours FOREIGN KEY (id_services) REFERENCES `services`(id_services);

ALTER TABLE user_allergene ADD CONSTRAINT fk_id_user_allergene FOREIGN KEY (id_user) REFERENCES `user`(id_user);
ALTER TABLE user_allergene ADD CONSTRAINT fk_id_allergene_user FOREIGN KEY (id_allergie) REFERENCES `allergenes`(id_allergie);

ALTER TABLE user_reservation ADD CONSTRAINT fk_id_user_reservation FOREIGN KEY (id_user) REFERENCES `user`(id_user);
ALTER TABLE user_reservation ADD CONSTRAINT fk_id_reservation_user FOREIGN KEY (id_reservation) REFERENCES `reservation`(id_reservation);

ALTER TABLE reservation_allergene ADD CONSTRAINT fk_id_reservation_allergene FOREIGN KEY (id_reservation) REFERENCES `reservation`(id_reservation);
ALTER TABLE reservation_allergene ADD CONSTRAINT fk_id_allergene_reservation FOREIGN KEY (id_allergie) REFERENCES `allergenes`(id_allergie);



INSERT INTO `role` (`id_role`, `name_role`) VALUES
(1, 'Administrateur'),
(2, 'Employe');

INSERT INTO `user` (`name_user`, `firstname_user`, `dob_user`, `email_user`, `password_user`, `id_role`) VALUES
('Blamxis', 'Maxime', '1997-01-01', 'Maxime@example.com', 'MotDePasseMaxime', 1),
('Stryzy', 'Justice', '1990-01-02', 'Justine@example.com', 'MotDePasseJustine', 1),
('Baylo', 'Joris', '1997-10-02', 'Joris@example.com', 'MotDePasseJoris', 1); 
--Securite niveau APP

INSERT INTO `user` (`name_user`, `firstname_user`, `dob_user`, `email_user`, `password_user`, `id_role`) VALUES 
('Dupont', 'Marie', '1985-04-15', 'marie.dupont@email.com', 'mdpMarie85', 2),
('Leroy', 'Jean', '1990-07-22', 'jean.leroy@email.com', 'mdpJean90', 2),
('Martin', 'Sophie', '1988-01-30', 'sophie.martin@email.com', 'mdpSophie88', 2),
('Bernard', 'Lucas', '1992-11-12', 'lucas.bernard@email.com', 'mdpLucas92', 2),
('Petit', 'Emilie', '1994-05-06', 'emilie.petit@email.com', 'mdpEmilie94', 2),
('Moreau', 'Thomas', '1986-09-19', 'thomas.moreau@email.com', 'mdpThomas86', 2),
('Lefebvre', 'Clara', '1991-03-03', 'clara.lefebvre@email.com', 'mdpClara91', 2); 
--Securite niveau APP

INSERT INTO `allergenes` (`id_allergie`, `name_allergie`) VALUES
(1, 'aucun'),
(2, 'gluten'),
(3, 'lactose'),
(4, 'fruits à coques'),
(5, 'oeuf'),
(6, 'arachide'),
(7, 'crustacé'),
(8, 'autres');

INSERT INTO `user_allergene` (`id_user`, `id_allergie`) VALUES
(2, 3),
(2, 2);

INSERT INTO `avis` (`description_avis`, `date_avis`, `note_avis`, `status_avis`, `id_user`) VALUES 
('Excellente expérience, personnel sympathique.', '2024-01-16', 5, 'Publié', 1),
('Bonne nourriture, mais service lent.', '2023-01-15', 3, 'Publié', 2),
('Pas satisfait du service client.', '2022-01-14', 2, 'Non publié', 3);

INSERT INTO `horaires` (`ouverture_horaires`, `fermeture_horaires`, `id_user`) VALUES
('12:00:00', '15:00:00', 1), -- USER ?
('19:00:00', '22:00:00', 1),
('18:00:00', '23:00:00', 1),
('11:00:00', '14:00:00', 1);

INSERT INTO `services` (`name_services`, `id_horaires`) VALUES
('Midi_semaine', 1),
('Soir_semaine', 2),
('Midi_week', 4),
('Soir_week', 3);

INSERT INTO `jours` (`name_jours`, `status_jours`) VALUES
('lundi', 'ouvert'),
('mardi', 'ouvert'),
('mercredi', 'fermer'),
('jeudi', 'ouvert'),
('vendredi', 'ouvert'),
('samedi', 'ouvert'),
('dimanche', 'ouvert');

INSERT INTO `jours_services` (`id_jours`, `id_services`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 4),
(7, 3);


INSERT INTO `carte` (`titre_carte`, `id_user`) VALUES 
('Mets', 1),
('Vins', 1), 
('Boissons', 1);

INSERT INTO `categories` (`nom_categorie`, `id_carte`) VALUES 
('Entrées', 1),
('Plats', 1),
('Fromages', 1),
('Desserts', 1),
('Vins', 2),
('Softs', 3),
('Alcools', 3);


INSERT INTO `softs` (`name_soft`,`description_soft`,`type_soft`,`bouteille_soft`,`bio_soft`, `couleur_biere`, `prix_soft`,`id_categorie`) VALUES
-- COCKTAILS SANS ALCOOL
('Classique Albatros', 'Jus d\'Orange, Jus d\'Ananas, Sirop de Grenadine (20 cl)', 'Cocktail Sans Alcool', FALSE, FALSE, '', 12, 6),
('Pina Colada Sans Alcool', 'Sirop de Rhum, Pina Colada, Noix de Coco, Jus d\'Ananas (20 cl)', 'Cocktail Sans Alcool', FALSE, FALSE, '', 16, 6),
('Mojito Sans Alcool', 'Sucre, menthe fraîche, Citron vert, Sirop de Rhum, Perrier (20 cl)', 'Cocktail Sans Alcool', FALSE, FALSE, '', 14.5, 6),
-- BOISSONS FRAICHES
('Sodas de Chambéry', '', 'Soda', FALSE, FALSE, '', 9, 6),
('Thé Glacé', '', 'Thé', FALSE, FALSE, '', 12, 6),
('Limonade', '', 'Limonade', FALSE, FALSE, '', 12, 6),
('Citronnade', '', 'Citronnade', FALSE, FALSE, '', 12, 6),
('Jus de fruits pressés', 'Ananas, orange, pamplemousse rose, pêche de vigne, pomme, tomate', 'Jus de fruits', FALSE, FALSE, '', 12, 6),
-- BOISSONS CHAUDES
('Ristretto', '', 'Café', FALSE, FALSE, '', 6, 6),
('Expresso', '', 'Café', FALSE, FALSE, '', 6, 6),
('Café Allongé', '', 'Café', FALSE, FALSE, '', 6, 6),
('Café au Lait', '', 'Café', FALSE, FALSE, '', 8, 6),
('Café Crème', '', 'Café', FALSE, FALSE, '', 8, 6),
('Café Noisette', '', 'Café', FALSE, FALSE, '', 8, 6),
('Chocolat Chaud', '', 'Chocolat', FALSE, FALSE, '', 11, 6),
('Chicorée', '', 'Boisson Aromatisée', FALSE, FALSE, '', 8, 6),
('Verre de Lait Fermier', '', 'Lait', FALSE, FALSE, '', 5, 6),
('Thé', 'thé vert sencha, earl gray, english breakfast, Lapsang souchong', 'Thé', FALSE, FALSE, '', 10, 6),
('Infusions Bio', 'camomille, verveine, tilleul, serpolet, menthe poivrée, tussilage', 'Infusion', FALSE, TRUE, '', 12, 6);

INSERT INTO `alcool` (`nom_alcool`, `quantite_alcool`,`age_alcool`, `type_alcool`, `couleur_biere`, `bouteille_biere`, `quantite_biere`, `description_alcool`, `bio_alcool`, `prix_alcool`, `id_categorie`) VALUES 
-- APERITIFSFALSE
('Kir Breton', 12, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 9, 7),
('Kir Vin Blanc', 12, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 9, 7),
('Kir Pétillant', 12, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 11, 7),
('Kir Royal', 12, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 24, 7),
('Coupe de pétillant saumur Emilie Laurance', 12, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 11, 7),
('Coupe de champagne brut Duval-Leroy', 12, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 24, 7),
('Martini Rosso ou Bianco', 5, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 9, 7),
('Porto Rouge ou Blanc', 5, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 9, 7),
('Campari', 5, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 9, 7),
('Suze', 5, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 9, 7),
('Suze Cassis', 6, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 10, 7),
('Ricard', 2, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 7, 7),
('Pastis Breton à l\'ancienne aux plantes et épices', 2, NULL, 'Apéritif', NULL, FALSE, NULL, '', FALSE, 13, 7),
-- COCKTAILS
('Gin Tonic', 12, NULL, 'Cocktail', NULL, FALSE, NULL, 'Gin Breton, tonic, citron vert', FALSE, 15, 7),
('Americano "Maison"', 12, NULL, 'Cocktail', NULL, FALSE, NULL, 'Martini Rosso, Noilly Prat, Campari', FALSE, 16, 7),
('Cosmopolitain', 10, NULL, 'Cocktail', NULL, FALSE, NULL, 'Vodka, cointreau, jus de cranberry, jus de citron vert', FALSE, 15, 7),
('Mojito', 20, NULL, 'Cocktail', NULL, FALSE, NULL, 'Sucre, Menthe Fraîche, Citron Vert, Rhum, Perrier', FALSE, 17, 7),
('Pina Colada', 20, NULL, 'Cocktail', NULL, FALSE, NULL, 'Sirop Pina Colada, Noix de Coco, Rhum, Jus d\'Ananas', FALSE, 19, 7),
('Ti Punch', 8, NULL, 'Cocktail', NULL, FALSE, NULL, 'Sirop de Sucre de Canne, Citron Vert, Rhum', FALSE, 14, 7),
('Spritz', 15, NULL, 'Cocktail', NULL, FALSE, NULL, 'Apérol, vin blanc, Eau gazeuse', FALSE, 15, 7),
-- WHISKYS
('Lagavulin 16 ans', 4, 16, 'Whisky', NULL, FALSE, NULL, '16 ans d\'âge', FALSE, 33, 7),
('Macallan 15 ans', 4, 15, 'Whisky', NULL, FALSE, NULL, '15 ans d\'âge', FALSE, 55, 7),
('Dalmore 21 ans', 4, 21, 'Whisky', NULL, FALSE, NULL, '21 ans d\'âge', FALSE, 150, 7),
('Glenfiddich 26 ans', 2, 26, 'Whisky', NULL, FALSE, NULL, '26 ans d\'âge', FALSE, 200, 4),
('Highland Park 32 ans', 2, 32, 'Whisky', NULL, FALSE, NULL, '32 ans d\'âge', FALSE, 250, 7),
('Hankey Bannister 40 ans', 2, 40, 'Whisky', NULL, FALSE, NULL, '40 ans d\'âge', FALSE, 320, 7),
-- BIERES
('Morgane', 25, NULL, 'Bière Blonde Bio', 'Blonde', FALSE, 25, 'Bière blonde bio, Lancelot, pression', TRUE, 12, 7),
('Morgane', 50, NULL, 'Bière Blonde Bio', 'Blonde', FALSE, 50, 'Bière blonde bio, Lancelot, pression', TRUE, 21, 7),
('Blanche Hermine', 25, NULL, 'Bière Blanche', 'Blanche', FALSE, 25, 'Bière blanche au froment, Lancelot, pression', FALSE, 12, 7),
('Blanche Hermine', 50, NULL, 'Bière Blanche', 'Blanche', FALSE, 50, 'Bière blanche au froment, Lancelot, pression', FALSE, 21, 7),
('Telenn Du', 33, NULL, 'Bière au Blé Noir Bio', 'Brune', TRUE, 33, 'Bière au blé noir bio, Lancelot, bouteille', TRUE, 25, 7),
('Duchesse Anne', 33, NULL, 'Bière Blonde Triple', 'Blonde', TRUE, 33, 'Bière blonde triple, Lancelot, bouteille', FALSE, 25, 7),
-- DIGESTIFS
('Pierre Ferrand Sélection des anges', 4, NULL, 'Digestif', NULL, FALSE, NULL, '', FALSE, 90, 7),
('Remy Martin Extra Old', 4, NULL, 'Digestif', NULL, FALSE, NULL, '', FALSE, 93, 7),
('Hennessy Extra Old', 4, NULL, 'Digestif', NULL, FALSE, NULL, '', FALSE, 120, 7),
('Hennessy Paradis', 4, NULL, 'Digestif', NULL, FALSE, NULL, '', FALSE, 516, 7),
('Darroze', 4, 8, 'Digestif', NULL, FALSE, NULL, '8 ans d\'âge', FALSE, 30, 7),
('Bas Armagnac', 4, 50, 'Digestif', NULL, FALSE, NULL, '1972', FALSE, 195, 7),
('Neisson Le Vieux', 4, NULL, 'Digestif', NULL, FALSE, NULL, '', FALSE, 35, 7),
('Bellevue 1998', 4, NULL, 'Digestif', NULL, FALSE, NULL, '', FALSE, 130, 7);

INSERT INTO `vins`(`name_vins`, `type_vins`, `origin_vins`,`description_vins`,`millesime_vins`, `prix_vins`, `id_categorie`) VALUES
('Bones Mares', 'Vin Rouge', 'Savoie', '', '2018-06-12', 620, 5),
('Saint Emillon', 'Vin Rouge', 'Savoie', '', '2018-04-21', 460, 5),
('Masseto', 'Vin Rouge', 'Savoie', '', '2010-08-15', 1300, 5),
('Cayas', 'Vin Rouge', 'Suisse', '', '2009-01-25', 37, 5),
('Rosso Dei Ronchi', 'Vin Rouge', 'Suisse', '', '2009-03-12', 100, 5),
('Cornalin Antica', 'Vin Rouge', 'Suisse', '', '2010-12-05', 50, 5),
('AOP Roussette de Savoie', 'Vin Blanc', 'Savoie', '', '2024-01-20', 20, 5),
('AOP Chignin-Bergeron', 'Vin Blanc', 'Savoie', '', '2013-04-26', 15, 5),
('AOP Abymes', 'Vin Blanc', 'Savoie', '', '2019-04-12', 10, 5),
('Sancerre', 'Vin Blanc', 'Suisse', '', '2021-11-02', 35, 5),
('Chardonnay', 'Vin Blanc', 'Suisse', '', '2020-02-21', 35, 5),
('Château Yquem', 'Vin Blanc', 'Suisse', '', '2013-09-11', 375, 5),
('Château Neuf du Pape', 'Rosé', 'Savoie', '', '2018-07-15', 40, 5),
('"Terre Natale" Gamay', 'Rosé', 'Savoie', '', '2020-03-26', 33, 5),
('Château Puyguerand', 'Rosé', 'Savoie', '', '2019-06-02', 421, 5),
('Château pas du cerf "Audace"', 'Rosé', 'Suisse', '', '2021-01-15', 20, 5),
('Château pas du cerf "Diane"', 'Rosé', 'Suisse', '', '2021-10-25', 40, 5),
('Sofia', 'Rosé', 'Suisse', '', '2020-04-04', 80, 5),
('Henri Giraud', 'Champagne', '', '', '2015-11-04', 20, 5),
('Cristal Roederer', 'Champagne', '', '', '2014-10-13', 380, 5),
('Ruinart', 'Champagne', '', '', '2021-11-25', 50, 5);

INSERT INTO `mets` (`nom_mets`,`description_mets`,`prix_mets`,`id_images`,`id_categorie`) VALUES 
('Oeuf de Ferme Mollet', 'Tel un tableau gastronomique, ce plat harmonieux réunit l\'élégance des œufs mollets, la créativité des galettes de pommes de terre, la douceur de la crème d\'asperges et l\'éclat des légumes verts sautés, transformant chaque assiette en une véritable toile de saveurs et de couleurs.', 23, '', 1),
('Langoustines en carpaccio ', 'Ballet de saveurs marines et fraîcheur végétale s\'entremêlent dans ce carpaccio de langoustine, accompagné de tomates cerises séchées, de zestes de citron vert pétillants, de concombre croquant, de radis piquants et d\'une touche poétique de fleurs comestibles', 32, '', 1),
('Foie gras de canard', 'Une alliance subtile : foie gras, truffe et purée de pommes. Le foie gras décadent rencontre l\'élégance de la truffe et la douceur de la purée de pommes, créant une expérience gustative équilibrée et sophistiquée.', 48, '', 1),
('Salade de pousses d\'épinards', 'truffe/haricots verts parmesan/miso ', 24, '', 1),
('Tartare de boeuf suisse au couteau', 'Tartare de bœuf suisse au couteau, sublimé par un mélange de noix et pistaches croquantes, accompagné d\'un jaune d\'œuf crémeux et d\'une touche de roquette fraîche.', 41, '', 1),
('Gaspacho de concombre', 'Célébrant la fraîcheur estivale, le gaspacho fusionne le concombre croquant, l\'onctuosité de l\'avocat, la touche vive du citron et la touche aromatique de la menthe. Parachevé par des pétales de fleurs comestibles, accompagner de tranches de pain croustillant.', 41, '', 1),
('Rôsti', 'Spécialité suisse emblématique, le Rôsti est une galette de pommes de terre savoureuse et dorée à souhait.', 41, '', 2),
('La Longeole', 'Une saucisse composée de viande de porc et de fenouil, accompagnée de pommes de terres au vin blanc.', 42, '', 2),
('Omble Chevalier du Lac d\’Annecy sauce Grenobloise', 'Omble chevalier rôti au beurre mousseux, sauce au citron et persil accompagnée de Pomme de terre Bintje et  légumes anciens.', 65, '', 2),
('La tartiflette', 'Pommes de terre fondantes, de fromage Reblochon onctueux et de lardons pour la ponte salée irrésistible.', 60, '', 2),
('La tarte au reblochon de savoie', 'Avec ses arôme prononcés, la tarte au reblochon ressemble à la tartiflette, ces deux préparation sont délicieuses, locaux. Découvrez notre recette qui fera, à coup sûr chavirer le coeur.', 55, '', 2),
('La fondue savoyarde', 'La fondue au fromage est un plat régional, à base de fromage fondu et de pain sec. Cette préparation est dite moitié/moité à partir de plusieurs fromages comme de l\’Emmental de Savoie, du Comté de montagne, du Beaufort, d\’Abondance ainsi que du Gruyère de Savoie.', 60, '', 2),
('Plateaux au 3 fromages au choix', 'Reblochon - La vacherin Fribourgeois - Kaltbach - Appenzeller , Comté 24m - Saint Nectaire - Crottin de Chavignol - Roquefort', 65, '', 3),
('Plateaux au 4 fromages au choix', 'Reblochon - La vacherin Fribourgeois - Kaltbach - Appenzeller , Comté 24m - Saint Nectaire - Crottin de Chavignol - Roquefort', 70, '', 3),
('Tarte aux noix et au caramel', 'Une tarte croustillante aux noix est garnie d\'un caramel fondant et sucré. Les noix ajoutent une texture croquante et une saveur profonde, tandis que le caramel apporte une touche sucrée et gourmande à ce dessert.', 24, '', 4),
('Meringues aux double crème', 'Des meringues légères et croustillantes sont servies avec une généreuse portion de double crème, une crème épaisse et riche en matières grasses. Les meringues fondent dans la bouche tandis que la double crème apporte une douceur crémeuse et décadente arborée de deux délicieuses glaces à la noix et au chocolat.', 24, '', 4),
('Fondue au chocolat', 'Inspirée de la tradition de la fondue suisse, la fondue au chocolat propose des morceaux de fruits frais (comme des fraises, des bananes et des oranges) ainsi que des morceaux de gâteau, trempés dans du chocolat fondu. C\'est un plaisir convivial et décadent à partager.', 37, '', 4),
('Ébène Bella', 'Sa meringue noire, teintée de charbon actif, contraste avec un intérieur onctueux imprégné d\'arômes de vanille bourbon. Couronnée d\'une crème mascarpone infusée d\'une touche de café éthiopien, elle est drapée d\'une fine dentelle de cacao et ornée de framboises noires d\'une rare intensité, créant une composition artistique qui défie les conventions et éveille les sens.', 50, '', 4),
('Pavlova fraîcheur estivale', 'Sa meringue croustillante, façonnée avec précision, renferme un intérieur moelleux infusé d\'essences de vanille et de citron. Couronnée d\'une crème fouettée au parfum subtil de fleur d\'oranger, elle est drapée de pétales cristallisés d\'hibiscus et surplombée de baies fraîches gorgées de soleil, créant une toile gastronomique raffinée qui ravira les palais les plus exigeants.', 39, '', 4),
('Crème brûlée', 'Sa crème anglaise veloutée, parfumée à la vanille de Madagascar, caresse délicatement les papilles. Couverte d\'une fine croûte caramélisée, chaque cuillère plonge dans une symphonie de textures et de saveurs, révélant une douceur crémeuse et des notes de caramel doré. Un équilibre parfait entre tradition et modernité, cette crème brûlée repousse les limites gustatives avec une élégance raffinée.', 25, '', 4);

INSERT INTO `menu` (`nom_formules`, `description_formule`, `prix_menu`, `id_user`) VALUES
('Formule Midi', 'Plat + Dessert Entrée + Plat', 160, 1),
('Formule Soir', 'Entrée + Plat + Dessert', 180, 1),
('Formule "Comme les grands !"', 'Les enfants ont le choix du menue ou de la carte : entrée, plats, fromages, dessert. La moitié de la portion pour la moitié du pris (garniture modulable si elle ne convient pas). Sirop ou jus inclus pour chaque petit chef.', 90, 1),
('Formule du Chef', '"Faite confiance au chef, laissez-le guider vos assiettes par toute sa créativité et son savoir_faire avec les produits de saison."', 250, 1);







