const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  console.log(process.env.PAYJP_PUBLIC_KEY)
  const form = document.getElementById("charge-form");
  
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    const card = {
      number: formData.get("user_purchase[number]"),
      cvc: formData.get("user_purchase[cvc]"),
      exp_month: formData.get("user_purchase[exp_month]"),
      exp_year: `20${formData.get("user_purchase[exp_year]")}`,
    };

    console.log(formData)
    Payjp.createToken(card, (status, response) => {
  
      if (status === 200) {
    console.log(response)
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        alert("card-error")
      }
    });
  });
};

window.addEventListener("load", pay);