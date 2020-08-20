function info() {

  const price = document.getElementById("item-price");

  price.addEventListener("input", (e) => {
    const tax = Math.floor(price.value * 0.1)
    const displayTax = document.getElementById("add-tax-price");
    displayTax.innerHTML = tax;

    const profit = price.value - tax;
    const displayProfit = document.getElementById("profit");
    displayProfit.innerHTML = profit;
  });
};
window.addEventListener("load", info);

