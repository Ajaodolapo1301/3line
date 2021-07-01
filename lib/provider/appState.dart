

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class AppState with ChangeNotifier{
  // var longitude;
  // var latitude;



  double  _longitude = 0.0;
      get longitude => _longitude;
  set longitude( longitude1) {
    _longitude = longitude1;
    notifyListeners();
  }


  double  _latitude = 0.0;
  get latitude => _latitude;
  set latitude( latitude1) {
    _latitude = latitude1;
    notifyListeners();
  }

  // getLocation() async{
  //
  //   print("caleed");
  //   Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //     print(position);
  //   latitude = position.latitude;
  //   longitude = position.longitude;
  //   print(latitude);
  //   print(longitude);
  //   notifyListeners();
  // }




  // AppState(){
  //     getLocation();
  // }

}