let collection = [
    {
        titre: "Space Adventure",
        anneeSortie: 1984,
        genre: "Arcade",
        scores: [85, 87, 90, 78, 88]
    },

     {
    titre: "Pokemon",
    anneeSortie: 1992,
    genre : "RPG",
    scores: [88, 85, 91, 81, 88],
  },

  {
    titre: "Zelda",
    anneeSortie: 1998,
    genre:"Aventure",
    scores: [92, 91, 91, 89, 88],
  },

  {
    titre: "FIFA World Cup",
    anneeSortie: 1998,
    genre:"Sport",
    scores: [89, 88, 91, 92, 88],
  },
];


// Affichage de la collection
function affichage (collection) {
  for (const element of collection) {
    console.log(
      `Titre: ${element.titre},`,
      `Année de sortie: ${element.anneeSortie},`,
      `Scores: ${element.scores}`,
      `Genre: ${element.genre}`,
    );
    console.log();
  }
}

affichage(collection);

// Filtre par année et genre
console.log(

    collection.filter( function (elementTab) {return  (elementTab.genre == 'RPG') } ),
    collection.filter ( function (elementTab) {return (elementTab.anneeSortie == '1998')})
)


