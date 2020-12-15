window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom);
    const addTaxValue = inputValue * 0.1
    console.log(addTaxValue)
    
    const profitOutput = document.getElementById("profit");
    profitOutput.innerHTML = (Math.floor(inputValue - addTaxValue));
    console.log(profitOutput)
  })
});