import Debug "mo:base/Debug"
//new canister
actor DBank {
  var currentBalance = 200;
  currentBalance := 150;

  let id = 2300023;

  //Debug.print(debug_show(currentBalance))

  public func topUp(amount: Nat) {
    currentBalance += amount;
    Debug.print(debug_show(currentBalance))
  };
//Nat means natural number(> 0 && not negative)
  public func withdraw(amount: Nat) {
    let tempValue: Int = currentBalance - amount;
    if(tempValue >=0) {
      currentBalance -= amount;
      Debug.print(debug_show(currentBalance))
    } else {
       Debug.print("error: Not enough balance!")
    }
  };
//query functions
 public query func checkBalance(): async Nat {
  return currentBalance
 };

}