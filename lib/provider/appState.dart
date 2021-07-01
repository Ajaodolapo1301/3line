

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class AppState with ChangeNotifier{






  getLocation() async{

    print("caleed");
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
    // latitude = position.latitude;
    // longitude = position.longitude;

    notifyListeners();
  }
  AppState(){
      getLocation();
  }

}