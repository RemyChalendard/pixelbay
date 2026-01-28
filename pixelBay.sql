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
('Julie Cassagne', 'julie.cassage@gmail.com', 'CLIENT', 'AZERTYUIOP'),
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
(1, 1),
(1, 2),
(2, 2),
(1, 5),
(3, 2),
(4, 4),
(1, 6),
(1, 4),
(2, 5);

/* Afficher le nombre de produit par catégorie */
SELECT categorie_id, COUNT(*) AS nombre_produits
FROM produit
GROUP BY categorie_id
ORDER BY nombre_produits DESC;


/* Écrire une requête pour trouver tous les produits en stock triés par prix croissant */
SELECT categorie_id, COUNT(*) AS nombre_produits
FROM produit
GROUP BY categorie_id
ORDER BY nombre_produits ASC;

/*Écrire une requête pour sélectionner tous les jeux RPG en stock*/
SELECT *
FROM produit
WHERE categorie_id = 1;

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

