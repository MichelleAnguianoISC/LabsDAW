var total_price = 0;
var red_total = 0;
var green_total = 0;
var pink_total = 0;

function update_total_price() {
    let div = document.getElementById('total_price');
    div.innerHTML = " $" + total_price;
}

var red_qty = document.getElementById('red_qty');
red_qty.onchange = function () {
    let price = 1899;
    red_total = Number(red_qty.value) * price;
    total_price = red_total + green_total + pink_total + bayern_total;
    update_total_price();
}

var green_qty = document.getElementById('psg_qty');
psg_qty.onchange = function () {
    let price = 1899;
    green_total = Number(psg_qty.value) * price;
    total_price = red_total + green_total + pink_total + bayern_total;
    update_total_price();
}

var pink_qty = document.getElementById('pink_qty');
pink_qty.onchange = function () {
    let price = 1899;
    pink_total = Number(pink_qty.value) * price;
    total_price = red_total + green_total + pink_total + bayern_total;
    update_total_price();
}