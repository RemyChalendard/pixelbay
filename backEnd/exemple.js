console.log("Salut");
// Scope global
 
let a = "aaa"
// RbnB
const appartement = {
  id: "125321",
  nbPiece: 4,
  largeur: 20,
  longeur: 30,
  note: {
    reparation: "Lorem Ipsum",
    locataire: "Toto",
  },
  quittances: ["j01", "f02", "m03"],
  loyer: [1500, 1500, 1200, 1200],
  afficherInfo() {
    let a = "bbb"
    console.log(a);
   
    console.log(this.id)
  },
  moyenneLoyer() {
    // Méthode native avec fonction callback (anonyme)
    const moyenneLoyer = this.loyer.reduce(function (a, b) {
      console.log(a);
      console.log(b);
      return a + b;
    }, 0);
 
    console.log("Moyenne", moyenneLoyer / this.loyer.length);
  },
};
 
console.log(appartement);
console.log(appartement.id);
console.log(appartement["id"]);
console.log(appartement.note.reparation);
console.log(appartement.quittances[0]);
 
for (const element of appartement.quittances) {
  console.log(element);
}
 
for (const key in appartement) {
  console.log(key);
}
 
console.log("________________________________________");
 
// scope global
function moyenneLoyer() {
    console.log("Moyenne");
   
}
 
moyenneLoyer()
 
 
// methode de l'objet
appartement.moyenneLoyer()
 
// A ne pas faire
const Array = [];


// function fToC(valeurF) {
//   if (isNaN(valeurF)) {
//     return "Il faut un nombre";
//   } else {
//     const c = ((valeurF - 32) * 5) / 9;
//     return c;
//   }
// }
 
const fToC = (valeurF) => {
  if (isNaN(valeurF)) {
    return "Il faut un nombre";
  } else {
    const c = ((valeurF - 32) * 5) / 9;
    return c;
  }
};
 
// Fonction asynchrone
setTimeout( () => console.log(fToC(98.6)) , 5000 )
 
// console.log(fToC(98.6));
 
 
// const superficie = (l, h) => {
//   return l * h;
// };
 
const superficie = (l, h) =>  l * h;
 
const volume = (l, L) => {
  console.log(l);
  console.log(L);
 
  return l ** 2 * L;
};
 
console.log(2 ** 2);
console.log(3 ** 2);
console.log(4 ** 2);
 
console.log(volume(20, 30));