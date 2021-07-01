
import 'package:liner/model/weatherModel.dart';

class WeeklyModel {
  int dt;
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;
List<Weather> weather;

  WeeklyModel({this.weather, this.dt, this.day, this.night, this.morn, this.min, this.max, this.eve, });

  WeeklyModel.fromJson(Map<String, dynamic> json){
    dt = json["dt"];
   day = json["temp"]["day"];
 min = json["temp"]["min"];
 max = json["temp"]["max"];
night = json["temp"]["night"];
 eve = json["temp"]["eve"];
 morn = json["temp"]["morn"];
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
  }
}





