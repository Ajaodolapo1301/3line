import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:liner/model/weatherModel.dart';
import 'package:liner/model/weeklyModel.dart';
const baseUrl = "https://api.openweathermap.org/data/2.5/weather?";

const apiKey = "56eb107778cb724515e067ec7a240f19";
abstract class FetchWeatherApi{

  Future<Map<String, dynamic>> fetchWeatherdaily({lon, lat, });

  Future<Map<String, dynamic>> fetchWeatherOneCall({lon, lat, });

}



class WeatherApi implements FetchWeatherApi{
  @override
  Future<Map<String, dynamic>> fetchWeatherdaily({lon, lat, }) async{
    Map<String, dynamic> result = {};
    var url = "${baseUrl}lat=$lat&lon=$lon&appid=$apiKey&units=metric";

print(url);
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

      result["weather"] = weather;

      }
    }catch(error){
      print(error.toString());
    }

    return result;

  }

  @override
  Future<Map<String, dynamic>> fetchWeatherOneCall({lon, lat}) async{
    Map<String, dynamic> result = {};
    var url = "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=current,hourly,minutely,alerts&units=metric&appid=$apiKey";


    try{
      var response= await http.get(url);


      int statusCode = response.statusCode;

      print(jsonDecode(response.body));

      if(statusCode != 200){
        result['message'] = "error occurred";
        result['error'] = true;
      }else{
        result['error'] = false;
        List<WeeklyModel> weekly = [];
        (jsonDecode(response.body)["daily"] as List).forEach((week){
          weekly.add(WeeklyModel.fromJson(week));
        });

        result['weekly'] = weekly;

      }
    }catch(error){
      // print(error.toString());
    }
print(result);
    return result;
  }

}