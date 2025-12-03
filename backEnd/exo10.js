let inventaire = ["Manette PS5", "Xbox", "Switch", "Casque Gaming", "Souris"];

// Ajout de 2 nouveaux articles
inventaire.push("Clavier");
inventaire.push("Manette Switch");

// Suppression du premier article
inventaire.shift();

// Affichage de l'inventaire
console.log("Inventaire :");
inventaire.forEach((article, index) => {
    console.log(index + 1 + " - " + article);
});