import readlineSync from "readline-sync";

function isBissextile() {
  const anneeUtilisateur = readlineSync.question("Entrez une année : ");

  if  ((anneeUtilisateur % 400 === 0) || (anneeUtilisateur % 4 === 0 && anneeUtilisateur % 100 !== 0)) {
    console.log("Cette année est bissextile");
  } else {
    console.log("Cette année n'est pas bissextile");
  }
}

isBissextile();
