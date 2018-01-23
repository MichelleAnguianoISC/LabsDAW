function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
    document.body.style.backgroundColor = "white";
}

function multiply(num1,num2) {
  var result = num1 * num2;
  return result;
}

function example1() {
	var cont = 0;
	var text = ""
  	var numE1 = prompt('Teclea un número');
  	localStorage.setItem('numE1', numE1);
  	do {
  		text += "Número: " + numE1 + " Cuadrado:" (numE1*Math.pow(2)) + " Cubo" + (numE1*Math.pow(3));
  		var result = numE1 + (numE1*numE1) + (numE1*numE1*numE1)
  		return result;
	} 
	while (cont < numE1)
	document.write();
}