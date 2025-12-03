function creerJeu(titre, date, genre) {
  return { titre: titre, date: date, genre: genre };
}

// Liste des jeux
let titreRetro = console.log("Tableau Jeux Rétro");

let jeux1 = {
  titre: "The Legend of Zelda",
  date: 1998,
  genre: "RPG",
};

let jeux2 = {
  titre: "Pokemon",
  date: 1998,
  genre: "RPG",
};

let jeux3 = {
  titre: "Mario Kart",
  date: 1996,
  genre: "Course",
};

let titreModerne = console.log("Tableau Jeux Moderne");

let jeux4 = {
  titre: "Animal Crossing",
  date: 2021,
  genre: "Aventure",
};

let jeux5 = {
  titre: "EA FC",
  date: 2025,
  genre: "Sport",
};

let jeux6 = {
  titre: "Gran Turismo",
  date: 2022,
  genre: "Course",
};

// Creations tableaux
let jeuxRetro = [jeux1, jeux2, jeux3];
let jeuxModerne = [jeux4, jeux5, jeux6, creerJeu("FIFA", 2025, "Sport")];

creerJeu();

// Affichage des tableau
affichage(jeuxRetro);
affichage(jeuxModerne);

// Affichage contenue des tableaux
function affichage(jeux) {
  for (const element of jeux) {
    console.log(
      `Titre: ${element.titre}, Date: ${element.date}, Genre: ${element.genre}`,
    );
  }
}

function resultat(jeux) {
  // Utiliser boucle for pour le calcul
  let sommes = 0;
  for (const element of jeux) {
    sommes += element.date;

  }
  return sommes / jeux.length
}

resultat(jeuxRetro);
console.log(resultat(jeuxRetro))
console.log(resultat(jeuxModerne))





