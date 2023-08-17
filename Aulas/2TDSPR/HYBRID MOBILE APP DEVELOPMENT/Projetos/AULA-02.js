
var num = 1
let text = 'texto'
let stringNum = '25'
const boolean = true

console.log(num)
console.log(boolean)

var num = 5

{let text = 'outro texto'
console.log(text)
}


let arrow = (nome, idade) =>{
    console.log("esta a minha arrow function");
}

function printMyName(nome) {
    console.log(nome)
}

function printOhterName(nome, idade) {
    console.log(`meu nome é'${nome}, e eu tenho ${idade} anos`);
}

functioncalcWithReturn(a, b){
    return a + b
}

console.log(calcWithRetunr(calcWithReturn(5, 10), 15));
console.log(calcWithRetunr(calcWithReturn(5, 10), 'Pedro'));

do{
    console.log('teste')
} while (num > 0)

for (i =5; i > 0; i--){
    console.log(i)
}

var list = [1, 2, 3, 4, 5]

for(i in list){
    console.log(list[i])
}



printMyName('Caio')
printMyName('Joao')
printMyName('Bene')

printOtherName('Caio', 34)
printOtherName(34,'Caio')
printOtherName(5, 10)
arrow('Caio', 34)