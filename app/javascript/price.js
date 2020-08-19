
function itemPrice() {
  const priceInput = document.getElementById("item-price")
  const salesCommission = document.getElementById("add-tax-price")
  const salesProfit = document.getElementById('profit')
    priceInput.addEventListener('input', (e) => {
      const price = document.getElementById("item-price").value
       salesCommission.innerHTML = price / 10
       salesProfit.innerHTML = price - salesCommission.innerHTML
       
       e.preventDefault();
  })
}
setInterval(itemPrice, 1000);
