import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:liner/model/weatherModel.dart';
const baseUrl = "https://api.openweathermap.org/data/2.5/weather?";

const apiKey = "56eb107778cb724515e067ec7a240f19";
abstract class FetchWeatherApi{

  Future<Map<String, dynamic>> fetchWeatherdaily({lon, lat, });

}



class WeatherApi implements FetchWeatherApi{
  @override
  Future<Map<String, dynamic>> fetchWeatherdaily({lon, lat, }) async{
    Map<String, dynamic> result = {};
    var url = "${baseUrl}lat=$lat&lon=$lon&appid=$apiKey";


    try{
      var response= await http.get(url);


      int statusCode = response.statusCode;
      print(jsonDecode(response.body));
      if(statusCode != 200){
        result['message'] = "error occurred";
        result['error'] = true;
      }else{

          result['error'] = false;
      var weather =  WeatherModel.fromJson(jsonDecode(response.body));

      print(weather);

      }
    }catch(error){
      print(error.toString());
    }
    print("tokenpay $result");
    return result;

  }

}