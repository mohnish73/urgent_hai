import 'package:flutter/cupertino.dart';

class RideProvider extends ChangeNotifier {

  bool isRideBookShow=false;

  rideBookFun(){
    isRideBookShow=!isRideBookShow;
    notifyListeners();

  }

  int recommendedCardSelectedIndex=-1;

  recommendedCardSelectedIndexFun(int index){
    recommendedCardSelectedIndex=index;
    notifyListeners();

  }


}