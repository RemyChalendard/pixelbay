let prixJeux = 50;
let resultat;
let reduction;

function soldes () {
// La réduction est de 20%
prixJeux = 50;
reduction = (50 * 20) / 100;
resultat = (prixJeux - reduction);
(console.log("le prix d'un jeu lors des soldes d'été est de " + (resultat)));
}
soldes(resultat)


function soldesHivers () {
// La réducion est de 30%
prixJeux = 50;
reduction = (50 * 30) / 100;
resultat = (prixJeux - reduction);
(console.log("le prix d'un jeu lors des soldes d'hivers est de " + (resultat)));
}
soldesHivers(resultat)

function soldesPerso (){
    //Reduction Personalisé
    prixJeux = 50;
    reduction = (50 * 15) / 100;
    resultat = (prixJeux - reduction);
    (console.log("le prix d'un jeux lors d'une réduction personalisé est de " +(resultat)))
}
soldesPerso(resultat)