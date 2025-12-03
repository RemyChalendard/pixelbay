// Fonction JeuVidéo
function JeuVideo(titre, anneeSortie, genre, score) {
  this.titre = titre;
  this.anneeSortie = anneeSortie;
  this.genre = genre;
  this.score = score;

  // Informations du jeu
  this.affichage = function() {
    console.log(`Titre: ${this.titre}`);
    console.log(`Année de Sortie: ${this.anneeSortie}`);
    console.log(`Genre: ${this.genre}`);
    console.log(`Score: ${this.score}`);
  };

  // Calcule popularité
  this.getPopularite = function() {
    return (this.score * this.anneeSortie) / 100;
  };
}

// Ajout jeux vidéo
let jeu1 = new JeuVideo("The Legend of Zelda: Breath of the Wild", 2017, "Action-Aventure", 95);
let jeu2 = new JeuVideo("Super Mario Odyssey", 2017, "Plateforme", 97);

// Affichage popularité
let populariteJeu1 = jeu1.getPopularite();
let populariteJeu2 = jeu2.getPopularite();

console.log("Jeu 1 :");
jeu1.affichage();
console.log(`Popularité: ${populariteJeu1}`);

console.log("Jeu 2 :");
jeu2.affichage();
console.log(`Popularité: ${populariteJeu2}`);

// Comparaison
if (populariteJeu1 > populariteJeu2) {
  console.log("Le jeu le plus populaire est :");
  jeu1.affichage();
  console.log(`Popularité: ${populariteJeu1}`);
} else if (populariteJeu2 > populariteJeu1) {
  console.log("Le jeu le plus populaire est :");
  jeu2.affichage();
  console.log(`Popularité: ${populariteJeu2}`);
} else {
  console.log("Les deux jeux sont également populaires !");
}
