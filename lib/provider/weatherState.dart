

import 'package:flutter/cupertino.dart';
import 'package:liner/api/fetchWeatherApi.dart';

abstract class FetchWeatherViewModel {

  Future<Map<String, dynamic>> fetchWeatherdaily({lon, lat,});
  Future<Map<String, dynamic>> fetchWeatherOneCall({lon, lat,});
}



class WeatherState extends ChangeNotifier implements FetchWeatherViewModel{
  @override
  Future<Map<String, dynamic>> fetchWeatherdaily({lon, lat, }) async{
    Map<String, dynamic> result = Map();

    try{
      result = await WeatherApi().fetchWeatherdaily(lat: lat, lon: lon);
      if(result["error"] == null) {
        result['error'] = true;
        result['message'] = 'An Error occured, please  check your internet connection and try again';
      }else{
        if(result['error'] == false){


        }

      }
    }catch(e){
      print(e.toString());
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> fetchWeatherOneCall({lon, lat}) async{
    Map<String, dynamic> result = Map();

    try{
      result = await WeatherApi().fetchWeatherOneCall(lat: lat, lon: lon);
      if(result["error"] == null) {
        result['error'] = true;
        result['message'] = 'An Error occured, please  check your internet connection and try again';
      }else{
        if(result['error'] == false){


        }

      }
    }catch(e){
      print(e.toString());
    }
    return result;
  }

}