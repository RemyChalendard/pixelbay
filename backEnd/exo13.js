let collection = [
  {
    titre: "Space Adventure",
    anneeSortie: 1984,
    scores: [85, 87, 90, 78, 88],
  },

  {
    titre: "Pokemon",
    anneeSortie: 1992,
    scores: [88, 85, 91, 81, 88],
  },

  {
    titre: "Zelda",
    anneeSortie: 1998,
    scores: [92, 91, 91, 89, 88],
  },

  {
    titre: "FIFA World Cup",
    anneeSortie: 1998,
    scores: [89, 88, 91, 92, 88],
  },
];

// Affichage de la collection
function affichage(collection) {
  for (const element of collection) {
    console.log(
      `Titre: ${element.titre},`,
      `Année de sortie: ${element.anneeSortie},`,
      `Scores: ${element.scores}`,
    );
  }
}

affichage(collection);

// Calcule de la moyenne
function moyenne(scores) {
  let somme = 0;
  for (const score of scores) {
    somme += score;
  }
  return somme / scores.length;
}

// Afficher la moyenne
for (const element of collection) {
  const moyenneScore = moyenne(element.scores);
  console.log(
    `La moyenne des scores pour "${element.titre}" est : ${moyenneScore.toFixed(2)}`,
  );
}
