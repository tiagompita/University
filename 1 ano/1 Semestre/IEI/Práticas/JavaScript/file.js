/* teste */
var s = "3";
/* make S an integer */
s = parseInt(s);
console.log(s);
var x;
x = 3;
document.write(x + s);

for(var i=0;i<16;i++){
    document.write("uma-string" - 2);
    document.write("<br>");
}
document.write("Batman");

function soma(x,y){
    return x+y;
    }
var resultado = soma(3,4);
console.log(resultado);

function sub(x,y){
    return x-y;
    }
var resultado = sub(3,4);
console.log(resultado);

function mult(x,y){
    return x*y;
    }
var resultado = mult(3,4);
console.log(resultado);

function div(x,y){
    return x/y;
    }
var resultado = div(3,4);
console.log(resultado);

var a = "3";
var b = 3;
if (a == b) alert("Iguais");
else alert("Diferentes");

var a ="abc";
switch(a) {
case "abc": alert("string abc"); break;
case 3: alert("inteiro 3"); break;
default: alert("outro");
}

const cars = ["BMW", "Volvo", "Saab", "Ford", "Fiat", "Audi"];

let text1 = "";
for (let i = 0; i < cars.length; i++) {
  text1 += cars[i] + "<br>";
}
document.write(text1);

let text2 = "";
let i1 = 0;
while (i1 < 10) {
  text2 += "<br>The number is " + i1;
  i1++;
}
document.write(text2);

let text3 = ""
let i2 = 0;

do {
  text3 += "<br>The number is " + i2;
  i2++;
}
while (i2 < 10);  

document.write(text3);