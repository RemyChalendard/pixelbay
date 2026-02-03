/*Utilisateur*/
CREATE TABLE utilisateur(
user_id INT AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
password VARCHAR(50) NOT NULL,
role VARCHAR(50) NOT NULL,
PRIMARY KEY(user_id),
UNIQUE(email)
);

INSERT INTO utilisateur (nom, email, role, password) VALUES
('Chalendard Remy', 'chalendard.remy@gmail.com', 'ADMIN', '123456'),
('Nicolas Mallet', 'nicolat.mallet@gmail.com', 'ADMIN', 'ABCDEFG'),
('Melissa Tournerie', 'melissa.tournerie@gmail.com', 'CLIENT', '987654321'),
('Julie Cassagne', 'julie.cassagne@gmail.com', 'CLIENT', 'AZERTYUIOP'),
('Mehdi Heizzi', 'mehdi.herizzi@gmail.com', 'CLIENT', 'nbvcxw');


/*Commande*/
CREATE TABLE commande(
order_id INT AUTO_INCREMENT,
order_date DATE NOT NULL,
order_status VARCHAR(50) NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY(order_id),
FOREIGN KEY(user_id) REFERENCES utilisateur(user_id)
);

INSERT INTO `commande` (`order_id`, `order_date`, `order_status`, `user_id`) VALUES
(1, '2026-01-27', 'En cours', 1),
(2, '2026-01-27', 'Livrée', 2),
(3, '2026-01-27', 'En cours', 5),
(4, '2026-01-26', 'Expédié', 3),
(5, '2026-01-25', 'Expédié', 4);

INSERT INTO `commande` ( `order_status`, `user_id`) VALUES
(  'En cours', 1);
INSERT INTO `orderproduct` (`order_id`, `produit_id`) VALUES
(LAST_INSERT_ID(), 2);


/*Produits*/
CREATE TABLE produit(
produit_id INT AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
price DECIMAL NOT NULL,
in_stock TEXT NOT NULL,
PRIMARY KEY(produit_id)
);

/*Catégorie*/
CREATE TABLE categorie(
categorie_id INT AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
PRIMARY KEY(categorie_id)
);

INSERT INTO categorie (name) VALUES
('RPG'),
('Aventure'),
('FPS'),
('Sport');

/*Insertion produit*/
INSERT INTO produit (nom, prix, stock, categorie_id) VALUES
('The Witcher 3', 39.99, TRUE, 1),          
('Elden Ring', 59.99, TRUE, 1),             
('Assassin''s Creed Valhalla', 49.99, TRUE, 2),
('Zelda Breath of the Wild', 59.99, TRUE, 2),   
('Call of Duty: Modern Warfare', 59.99, TRUE, 3), 
('Battlefield 2042', 39.99, FALSE, 3),      
('FIFA 22', 29.99, FALSE, 4),                
('NBA 2K23', 49.99, TRUE, 4);    

/*Contient*/
CREATE TABLE contient(
order_id INT AUTO_INCREMENT,
produit_id INT AUTO_INCREMENT,
PRIMARY KEY(order_id, produit_id),
FOREIGN KEY(order_id) REFERENCES commande(order_id),
FOREIGN KEY(produit_id) REFERENCES produit(produit_id)
);

/*Appartient*/
CREATE TABLE appartient(
produit_id INT AUTO_INCREMENT,
categorie_id INT AUTO_INCREMENT,
PRIMARY KEY(produit_id, categorie_id),
FOREIGN KEY(produit_id) REFERENCES produit(produit_id),
FOREIGN KEY(categorie_id) REFERENCES categorie(categorie_id)
);

/*OrderProduits*/
CREATE TABLE orderproduit(
FOREIGN KEY (order_id) REFERENCES (produit_id)
)

INSERT INTO `orderproduct` (`order_id`, `produit_id`) VALUES
(3, 2),
(4, 4),
(1, 6),
(1, 4),
(2, 5);

/* Afficher le nombre de produit par catégorie */
SELECT nom, COUNT(*) AS total
FROM produit
GROUP BY nom, categorie_id;

/* Écrire une requête pour trouver tous les produits en stock triés par prix croissant */
SELECT * FROM produit
WHERE stock = TRUE ORDER BY prix ASC;


/*Écrire une requête pour sélectionner tous les jeux RPG en stock*/
SELECT *
FROM produit
WHERE categorie_id = 1 AND stock = TRUE;

/*Mettre a jour un prix*/
UPDATE produit
SET prix = 29.99
WHERE produit_id = 1;

/*Mettre a jour le status de la livraison*/
UPDATE commande
SET order_status = 'livrée'
WHERE order_id = 1;

/* Mettre un produit en rupture de stock */
UPDATE produit
SET stock = 0
WHERE produit_id = 2;

/* Calculer la moyenne des prix par categorie */
SELECT categorie_id, AVG(prix) AS prix_moyen
FROM produit
GROUP BY categorie_id;

/* Écrire une requête pour trouver le produit le plus cher et le moins cher */
SELECT MIN(prix) AS prix_min,
MAX(prix) AS prix_max FROM produit;

/* Écrire une requête pour compter le nombre de commandes par utilisateur */
SELECT user_id, COUNT(order_id) AS nombre_commandes
FROM commande
GROUP BY user_id;

/* Écrire une requête qui affiche pour chaque commande :
Le nom et email de l'utilisateur
La date et le statut de la commande
Les produits commandés avec leur prix */

SELECT 
c.order_date, c.order_status, u.nom, u.email, p.nom, prix
FROM commande c 
INNER JOIN utilisateur u ON c.user_id = u.user_id
INNER JOIN orderproduct op ON op.order_id = c.order_id
INNER JOIN produit p ON op.produit_id = p.produit_id;


SELECT 
    c.name AS categorie
    SUM(p.prix) AS chiffre_affaires
FROM categorie, commande, produit c
JOIN order o  ON p.categorie_id = c.id
JOIN order o ON o.order_id = order.id
GROUP BY c.name
ORDER BY chiffre_affaires DESC;

SELECT c.name AS categorie,
SUM (p.prix) AS chiffre_affaires
FROM categorie c
JOIN produit p ON c.categorie_id = p.categorie_id
JOIN orderproduct op ON p.produit_id = op.produit_id
GROUP BY categorie
ORDER BY chiffre_affaires DESC;

ALTER TABLE orderproduct
DROP FOREIGN KEY orderproduct_ibfk_1;

ALTER TABLE orderproduct
ADD CONSTRAINT orderproduct_ibfk_1
FOREIGN KEY (order_id) REFERENCES commande(order_id)
ON DELETE CASCADE;

DELETE FROM utilisateur WHERE user_id = 5;


















