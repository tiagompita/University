var op = "+"; // variável global que representa a operação a realizar (adição por defeito)

function operation() {
    var e = document.getElementById( "operation" );
    op = e.options[e.selectedIndex].value;
    console.log( "Operation: "+op ); // mostra a operação na consola
    var opt = document.getElementById( "op-view" );
    opt.innerHTML = op; // atualiza a operação na página
}

function calculate() {
    var x = document.getElementById( "op1" );
    var y = document.getElementById( "op2" );
    console.log( parseFloat(x.value) ); // mostra o primeiro operador na consola
    console.log( parseFloat(y.value) ); // mostra o segundo operador na consola

    var z = document.getElementById( "res" );
    switch (op) {
        case "+":
            z.value = parseFloat(x.value) + parseFloat(y.value);
            break;
        case "-":
            z.value = parseFloat(x.value) - parseFloat(y.value);
            break;
        case "*":
            z.value = parseFloat(x.value) * parseFloat(y.value);
            break;
        case "/":
            z.value = parseFloat(x.value) / parseFloat(y.value);
            break;
        default:
            z.value = "ERROR";
    }
    console.log( z.value ); // mostra o resultado da soma na consola
}

function move(){
    var e = document.getElementById( "btn" );
    e.style.position = "absolute";
    e.style.top = (Math.random() * window.innerHeight)+"px";
    e.style.left = (Math.random() * window.innerWidth)+"px";
}

function clock(){
    var e = document.getElementById( "clock" );
    
    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();

    e.innerHTML = hours+":"+minutes+":"+seconds;
    setTimeout( clock, 1000 );
}