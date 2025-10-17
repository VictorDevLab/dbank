import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
//new canister
actor DBank {
  stable var currentValue: Float = 200;
  // currentValue:= 300;
  stable var startTime = Time.now();
  //startTime:= Time.now();
  let id = 2300023;


  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue))
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if(tempValue >=0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue))
    } else {
       Debug.print("error: Not enough balance!")
    }
  };

 public query func checkBalance(): async Float {
  return currentValue
 };

  
  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNs = currentTime - startTime;
    let timeElapsedS = timeElapsedNs / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime
  }

}