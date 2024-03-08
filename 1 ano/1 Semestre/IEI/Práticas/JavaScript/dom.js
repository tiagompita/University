var x = document.getElementById( "op1" );
var y = document.getElementById( "op2" );
console.log( parseFloat(x.value) );
console.log( parseFloat(y.value) );
document.getElementById("res").value = parseFloat(x.value) + parseFloat(y.value);

var x = document.getElementById("nao-existe");
if(x == null) alert("Elemento não encontrado");
else alert(x.value);

var a="5";
var b=3;
console.log(a+b)

function main(a,b) {
    console.log(a+" "-b);
}