import { dbank } from "../../declarations/dbank";

window.addEventListener("load", () => {
  const currentAmount = dbank.checkBalance();
  document.getElementById("value").innerText = currentAmount;
  console.log("whaat?", currentAmount)
});