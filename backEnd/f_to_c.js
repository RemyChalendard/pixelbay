import readlineSync from 'readline-sync';
const temperature = readlineSync.question('Quel temperature ? ');


function fToC(f ,symbol) {
    if (typeof f !== "number") {
        console.log("Entrer un nombre");
    } else {
        console.log( `${(f - 32) * 5 / 9} ${symbol}`);
    }
}

// Tests
fToC(98, 6);
fToC(200);
fToC(300);
// Utilisateur
fToC(temperature, '°');



