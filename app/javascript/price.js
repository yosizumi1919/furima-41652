const price = () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue*0.1)
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = inputValue -  Math.floor(inputValue*0.1)
})
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);