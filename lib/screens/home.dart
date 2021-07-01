

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:liner/daily.dart';
import 'package:liner/model/weatherModel.dart';
import 'package:liner/model/weeklyModel.dart';
import 'package:liner/provider/appState.dart';
import 'package:liner/provider/weatherState.dart';
import 'package:liner/screens/weekly.dart';
import 'package:liner/utils/navigation/navigator.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



WeatherState weatherState;

  TextStyle textStyle;

bool isLoading = false;

WeatherModel weatherModel;
AppState appState;

  @override
  void initState() {
    textStyle = TextStyle(color: Colors.white, fontSize: 16);
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of(context);
    weatherState = Provider.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          leading: IconButton(icon: Icon(Icons.search, color: Colors.white,),),
        title: Text(""),
        actions: [
          IconButton(icon: Icon(Icons.waves_rounded, color: Colors.white,), onPressed: (){
          pushTo(context, Weekly(weatherModel: weatherModel,));
          })
        ],
      ),

      body: isLoading ? Center(child: CircularProgressIndicator(),) :
      Container(
        child: Stack(
          children: [
            Image.asset("assets/images/${getCondition(weatherModel?.weather[0].id)}.jpeg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,

            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black38
              ),
            ),
            Daily(textStyle: textStyle, weatherModel: weatherModel,)
          ],
        ),
      )
    );
  }
  getLocation() async{
    setState(() {
      isLoading = true;
    });
    print("caleed");
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        appState.latitude = position.latitude;
        appState.longitude = position.longitude;

    fetch(lat: position.latitude, lon: position.longitude);
  }


  fetch({lat, lon})async{

    var result = await weatherState.fetchWeatherdaily(lon: lon, lat: lat);
      setState(() {
        isLoading = false;
      });
      if(result["error"] == false){
      weatherModel = result["weather"];
      }else{

      }


  }





  getCondition(int condition){
    if(condition < 300){
  return "cloudy";
    }else if (condition < 400){
  return "wet";
    }else if (condition < 600){
    return "rainy";
    }
    else if (condition < 800){
    return "rainy";
    }
    else if (condition < 804){
    return "cloudy";
    }
  }








}