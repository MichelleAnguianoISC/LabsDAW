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
    city_total = Number(red_qty.value) * price;
    total_price = city_total + psg_total + chivas_total + bayern_total;
    update_total_price();
}

var psg_qty = document.getElementById('psg_qty');
psg_qty.onchange = function () {
    let price = 1899;
    psg_total = Number(psg_qty.value) * price;
    total_price = city_total + psg_total + chivas_total + bayern_total;
    update_total_price();
}

var chivas_qty = document.getElementById('chivas_qty');
chivas_qty.onchange = function () {
    let price = 1899;
    chivas_total = Number(chivas_qty.value) * price;
    total_price = city_total + psg_total + chivas_total + bayern_total;
    update_total_price();
}