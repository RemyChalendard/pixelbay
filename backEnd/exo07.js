let codeSecret = "Alpha"; // Testez avec différentes valeurs
let a = "a"
let b = "b"

console.log("Le code secret est " +[codeSecret ]+ " "  +[a] + " et " + [b])
console.log(`Le code secret est ${codeSecret} ${a} "et" ${b}`)


switch (codeSecret) {

    case "Alpha":
        console.log("Lancer la promo de la semaine")
        break;

    case "Bravo":
        console.log("Réorganiser les jeux rétro")
        break;

    case "Charlie":
        console.log("Préparer la zone de démonstration pour les nouveaux arrivages")
        break;

    case "Delta":
        console.log("Vérifier l'inventaire des accesoires")
        break;
}

