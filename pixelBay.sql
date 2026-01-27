CREATE TABLE utilisateur(
   user_id VARCHAR(50) AUTO_INCREMENT,
   name VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   password VARCHAR(50) NOT NULL,
   role VARCHAR(50) NOT NULL,
   PRIMARY KEY(user_id),
   UNIQUE(email)
);

CREATE TABLE commande(
   order_id VARCHAR(50) AUTO_INCREMENT,
   order_date DATE NOT NULL,
   order_status VARCHAR(50) NOT NULL,
   user_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(order_id),
   FOREIGN KEY(user_id) REFERENCES utilisateur(user_id)
);

CREATE TABLE produit(
   produit_id VARCHAR(50) AUTO_INCREMENT,
   name VARCHAR(50) NOT NULL,
   price CURRENCY NOT NULL,
   in_stock TEXT NOT NULL,
   PRIMARY KEY(produit_id)
);

CREATE TABLE categorie(
   categorie_id VARCHAR(50) AUTO_INCREMENT,
   name VARCHAR(50) NOT NULL,
   PRIMARY KEY(categorie_id)
);

CREATE TABLE contient(
   order_id VARCHAR(50),
   produit_id VARCHAR(50),
   PRIMARY KEY(order_id, produit_id),
   FOREIGN KEY(order_id) REFERENCES commande(order_id),
   FOREIGN KEY(produit_id) REFERENCES produit(produit_id)
);

CREATE TABLE appartient(
   produit_id VARCHAR(50),
   categorie_id VARCHAR(50),
   PRIMARY KEY(produit_id, categorie_id),
   FOREIGN KEY(produit_id) REFERENCES produit(produit_id),
   FOREIGN KEY(categorie_id) REFERENCES categorie(categorie_id)
);

/* Note */