


class WeatherModel{
 double  lat;
 double  lon;
 String timezone;
 List <Weather> weather;
WeatherModel({this.weather, this.lat, this.lon, this.timezone});

 WeatherModel.fromJson(Map<String, dynamic> json){
  if (json['weather'] != null) {
   weather = new List<Weather>();
   json['weather'].forEach((v) {
    weather.add(new Weather.fromJson(v));
   });
  }

 }
}




class Weather {
 int id;
 String main;
 String description;
Weather({this.description, this.id, this.main});

 Weather.fromJson(Map<String, dynamic> json){
 id = json["id"];
 main = json["main"];
 description = json["description"];
 }
}


