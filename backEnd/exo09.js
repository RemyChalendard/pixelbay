function fizzBuzz() {
  for (let i = 1; i <= 151; i++) {
    if (i % 15 === 0) {          // multiple de 3 ET 5
      console.log("FizzBuzz");
    } else if (i % 3 === 0) {   // multiple de 3
      console.log("Fizz");
    } else if (i % 5 === 0) {   // multiple de 5
      console.log("Buzz");
    } else {                    
      console.log(i);
    }
  }
}

fizzBuzz();

// On met trois fois le signe égal car c'est une égalité strict, 
// avec un zero derriere car ont veut pas de reste