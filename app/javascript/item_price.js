window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

    const addTaxValue = inputValue * 0.1
    
    const profitOutput = document.getElementById("profit");
    profitOutput.innerHTML = (Math.floor(inputValue - addTaxValue));
  })
});