window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if(!priceInput) return;
  const feeOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const feeValue = Math.floor(inputValue * 0.1);
    const profitValue = inputValue - feeValue;

    feeOutput.textContent = "¥" + feeValue;
    profitOutput.textContent = "¥" + profitValue;
  });
});