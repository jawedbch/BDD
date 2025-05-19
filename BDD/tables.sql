DROP TABLE IF EXISTS G11_stocke;
DROP TABLE IF EXISTS G11_capsule;
DROP TABLE IF EXISTS G11_magasin;

CREATE TABLE G11_capsule(
  cap_id SERIAL PRIMARY KEY,
  cap_nom VARCHAR(50) UNIQUE NOT NULL,
  cap_prix DECIMAL(4,2) NOT NULL CHECK (cap_prix >= 0),
  cap_intensite INT NOT NULL CHECK (cap_intensite >= 0)
);

CREATE TABLE G11_magasin(
  mag_id SERIAL PRIMARY KEY,
  mag_nom VARCHAR(50) UNIQUE NOT NULL,
  mag_adresse VARCHAR(100) UNIQUE NOT NULL,
  mag_quantite INT CHECK (mag_quantite > 0 )
);

CREATE TABLE G11_stocke (
  cap_id INT NOT NULL,
  mag_id INT NOT NULL,
  FOREIGN KEY (cap_id) REFERENCES G11_capsule(cap_id),
  FOREIGN KEY (mag_id) REFERENCES G11_magasin(mag_id),
  PRIMARY KEY (cap_id, mag_id)
  stock_quantite INT CHECK (stock_quantite > 0) NOT NULL
);


-- Ajout des capsules Nespresso
INSERT INTO G11_capsule(cap_nom,cap_prix,cap_intensite) VALUES  
('Ispirazione Sicilia',0.45,8), 
('Ispirazione Emilia',0.45,7), 
('Ispirazione Aosta',0.45,5), 
('Peru Organic',0.52,5), 
('Espresso Decaffeinato',0.48,7), 
('Festive Black Double Espresso',0.59,7), 
('Frosted Caramel Nuts',0.69,0), 
('Seasonal Delight Spices',0.69,0), 
('Gran Lungo Ethiopia Organic',0.62,4), 
('Colombia',0.69,5), 
('Mexico',0.69,7), 
('Espresso Peru Organic',0.52,6), 
('Gran Lungo Costa Rica',0.59,7), 
('Espresso Tamuka mu Zimbabwe',0.70,5), 
('Café de Cuba',2.10,8), 
('Kahawa ya Congo Organic',0.93,6), 
('Ristretto Ristretto Classico',0.44,9), 
('Ristretto Ristretto Intenso',0.44,12), 
('Espresso Orafio',0.44,6), 
('Espresso Toccanto',0.44,5), 
('Espresso Il Caffè',0.44,11), 
('Espresso Diavolitto',0.44,11),
('Ispirazione Napoli',0.46,13), 
('Ispirazione kazaar',0.43,12), 
('Ispirazione Ristretto',0.43,10),
('Ispirazione Apreggio',0.43,9), 
('Ispirazione Venezia',0.46,8), 
('Ispirazione Roma',0.4,8),
('Espresso Capriccio',0.43,5), 
('Espresso Volluto',0.43,4), 
('Espresso Cosi',0.43,4), 
('Café Joyeux',0.49,5),
('Paris Espresso',0.46,6), 
('Rio de Janeiro Espresso',0.46,9), 
('Istanbul Espresso',0.46,8), 
('Shanghai Lungo',0.46,5),
('Buenos Aires Lungo',0.46,4), 
('Stockolm Lungo',0.46,8), 
('Vienna Lungo',0.46,6),
('Tokyo Lungo',0.46,6),
('Ethiopia Organic',0.52,4),
('Indonesia Organic',0.52,8),
('India',0.49,11),
('Nicaragua',0.49,5),
('Ristretto Decaffeinato',0.46,10),
('Arpeggio Decaffeinato',0.46,9),
('Volluto Decaffeinato',0.46,4),
('Decaffeinato',0.48,7),
('Festive Black Espresso',0.49,7);

-- Ajout des magasins avec des adresses aléatoires
INSERT INTO G11_magasin (mag_nom, mag_adresse, mag_quantite) VALUES 
('Magasin 1', '68 rue Victor Hugo, 78700 Conflans', 8),
('Magasin 2', '22 cours Jean Jaurès, 92100 Boulogne', 8),
('Magasin 3', '13 rue Adolphe Wurtz, 92350 Robinson', 14),
('Magasin 4', '1 rue des Lilas, 75019 Paris', 10),
('Magasin 5', '8 avenue de l’Europe, 31000 Toulouse', 12),
('Magasin 6', '3 place de la République, 69002 Lyon', 9),
('Magasin 7', '10 boulevard Gambetta, 34000 Montpellier', 11),
('Magasin 8', '5 rue Nationale, 59000 Lille', 13),
('Magasin 9', '18 rue du Maréchal Foch, 67000 Strasbourg', 7),
('Magasin 10', '44 avenue Jean Médecin, 06000 Nice', 15),
('Magasin 11', '17 rue Sainte-Catherine, 33000 Bordeaux', 9),
('Magasin 12', '12 boulevard Voltaire, 75011 Paris', 6),
('Magasin 13', '25 rue de la Liberté, 21000 Dijon', 8),
('Magasin 14', '7 allée des Tilleuls, 76000 Rouen', 13),
('Magasin 15', '16 rue Victor Basch, 80000 Amiens', 11),
('Magasin 16', '2 rue Paul Bert, 72000 Le Mans', 12),
('Magasin 17', '33 rue des Fleurs, 86000 Poitiers', 10),
('Magasin 18', '6 rue du Général Leclerc, 37000 Tours', 14),
('Magasin 19', '11 avenue des Champs, 75008 Paris', 9),
('Magasin 20', '29 rue de la République, 84000 Avignon', 12),
('Magasin 21', '15 rue de Brest, 29200 Brest', 8),
('Magasin 22', '40 rue du Faubourg, 25000 Besançon', 10),
('Magasin 23', '21 boulevard de l’Atlantique, 17000 La Rochelle', 9);

-- Ajout des nouveaux stocks
-- Magasin 1
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(1, 4, 100), (5, 4, 50), (7, 4, 30), (12, 4, 20);

-- Magasin 2
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(2, 5, 80), (6, 5, 60), (13, 5, 40), (20, 5, 25), (21, 5, 10);

-- Magasin 3
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(3, 6, 90), (8, 6, 70), (15, 6, 60), (24, 6, 50), (28, 6, 30), (33, 6, 10);

-- Magasin 4
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(4, 7, 85), (9, 7, 40), (18, 7, 20), (23, 7, 15);

-- Magasin 5
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(10, 8, 100), (19, 8, 90), (25, 8, 80), (31, 8, 70), (36, 8, 60), (42, 8, 50), (48, 8, 40);

-- Magasin 6
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(2, 9, 80), (8, 9, 60), (14, 9, 50), (22, 9, 30);

-- Magasin 7
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(6, 10, 70), (17, 10, 60), (26, 10, 50), (32, 10, 40), (38, 10, 30);

-- Magasin 8
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(11, 11, 90), (27, 11, 80), (35, 11, 70), (43, 11, 60);

-- Magasin 9
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(16, 12, 60), (18, 12, 50), (34, 12, 40), (47, 12, 30);

-- Magasin 10
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(1, 13, 100), (5, 13, 90), (12, 13, 80), (22, 13, 70), (45, 13, 60);

-- Magasin 11
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(2, 14, 80), (13, 14, 70), (19, 14, 60), (28, 14, 50), (41, 14, 40);

-- Magasin 12
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(7, 15, 90), (10, 15, 80), (30, 15, 70), (46, 15, 60);

-- Magasin 13
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(4, 16, 90), (8, 16, 80), (14, 16, 70), (36, 16, 60);

-- Magasin 14
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(5, 17, 100), (9, 17, 90), (17, 17, 80), (24, 17, 70), (50, 17, 60);

-- Magasin 15
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(3, 18, 90), (15, 18, 80), (26, 18, 70), (40, 18, 60);

-- Magasin 16
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(6, 19, 70), (20, 19, 60), (33, 19, 50), (48, 19, 40);

-- Magasin 17
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(1, 20, 100), (11, 20, 90), (21, 20, 80), (29, 20, 70);

-- Magasin 18
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(9, 21, 90), (13, 21, 80), (18, 21, 70), (37, 21, 60);

-- Magasin 19
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(2, 22, 80), (6, 22, 70), (10, 22, 60), (35, 22, 50), (46, 22, 40);

-- Magasin 20
INSERT INTO G11_stocke (cap_id, mag_id, stock_quantite) VALUES 
(8, 23, 90), (12, 23, 80), (16, 23, 70), (44, 23, 60), (49, 23, 50);

