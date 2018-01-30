var rows;
var array = [];
var negative = 0, zero = 0, positive = 0;
var answer = "";
var string = "";

function showAnswer(answer) {
    document.getElementById("answer").innerHTML = answer
}

function readArray() {
    array = prompt("Ingresa números separados por una coma", "-3,0,3");
    array = array.split(",")
    array.forEach(count);
}

function createTable(rows) {
    var table = document.getElementById("table");
    var i, square, cube;
    var row = table.insertRow(0); 
    var cell1 = row.insertCell(0);
    cell1.innerHTML = "Cubo";
    var cell2 = row.insertCell(0);
    cell2.innerHTML = "Cuadrado";
    var cell3 = row.insertCell(0);
    cell3.innerHTML = "Número";
    var num = prompt("Introduce un número");
    for(i = 1; i <= num; i++) {
        square = Math.pow(i,2);
        cube = Math.pow(i,3);
        row = table.insertRow();
        cell1 = row.insertCell();
        cell2 = row.insertCell();
        cell3 = row.insertCell();
        cell1.innerHTML = String(i);
        cell2.innerHTML = String(square);
        cell3.innerHTML = String(cube);
    }
}

function sumTwoNumbers(){
    var num1 = Math.floor(Math.random() * 100);
    var num2 = Math.floor(Math.random() * 100);
    var secs = Date.now();
    var answer = prompt("¿Cuánto es " + String(num1) + " + " + String(num2) + "?");
    if(answer == (num1 + num2)) {
        var secs1 = Date.now();
        string = "Correcto, tardaste " + ((secs1 - secs)/1000) + " segundos en responder";
    }
    else {
        string = "Lo siento, intenta nuevamente";
    }
    showAnswer(string);
}

function count(item) {
    if(item < 0){
        negative ++;
    }
    else if(item == 0){
        zero ++;
    }
    else{
        positive ++;
    }
    string = "Arreglo = " + array.toString() + "<br> Negativos = " + String(negative) + "<br> Positivos = " + String(positive) + "<br> Cero = " + String(zero);
    showAnswer(string);
}

function getAverage(array){
    var avg = 0;
    for(var i = 0; i < array.length; i++){
        avg += array[i]/array.length;
    }
    return avg;
}

function captureArray(){
    var inputString = prompt("Ingresa números separados por una coma", "-3,0,3");
    if(inputString == null)
        return [0];
    return inputString.match(/-?[0-9]*\.[0-9]+|-?[0-9]+/g);

}

function captureMatrix(){
    var mat = [];
    var n = prompt("Ingresa el número de arreglos que deseas promediar");
    n = n.match(/[0-9]*\.[0-9]+|[0-9]+/);
    if(n[0]==null)
        return [[0]];
    for(var i = 0; i < n[0]; i++)
        mat.push(captureArray());
    return mat;
}

function average() {
	var m = captureMatrix();
    var newArray  = [];
    for(var i = 0; i < m.length; i++){
        newArray.push(getAverage(m[i]));
    }
    document.getElementById("answer").innerText = "El promedio de cada renglon de la matriz esta separado mediante una coma (,): "+ newArray.toString().replace(',', ", ");
    /*
    var i, total = 0;
    for(i = 0; i < array.length; i++) {
        total = total + parseInt(array[i]);
    }
    var answerA = total/array.length;
    string = "El promedio es " + String(answerA);
    showAnswer(string);*/
}

function inverse() {
    var num = prompt("Introduce cualquier número que desees voltear");
    num = num.split("").reverse().join("");
    string = "El número volteado es " + num;
    showAnswer(string)
}

function nextChar(c) {
    return String.fromCharCode(c.charCodeAt(0) + 1);
}

function prevChar(c) {
    return String.fromCharCode(c.charCodeAt(0) - 1);
}

function encrypt(){
	var input = document.getElementById("encryptionInput").value;
  	var output = [];
  	input = input.toUpperCase();
  	for (x in input){
    	output += nextChar(input[x]);
  	}
  	document.getElementById("encryptionOutput").innerHTML = output;
}