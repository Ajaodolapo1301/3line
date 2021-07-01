


class WeatherModel{
 double  lat;
 double  lon;
 String timezone;
 var temp;
 var feels_like;

 var wind;
 String name;
 var   humidity;
 List <Weather> weather;
WeatherModel({this.weather, this.lat, this.lon, this.timezone, this.temp, this.humidity, this.name, this.feels_like, this.wind});

 WeatherModel.fromJson(Map<String, dynamic> json){
  if (json['weather'] != null) {
   weather = new List<Weather>();
   json['weather'].forEach((v) {
    weather.add(new Weather.fromJson(v));
   });
  }
  name = json["name"];
  humidity = json["main"]["humidity"];
  temp = json["main"]["temp"];
 feels_like =  json["main"]["feels_like"];
 wind = json["wind"]["speed"];
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


