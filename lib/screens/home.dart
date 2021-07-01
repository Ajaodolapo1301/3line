

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:liner/daily.dart';
import 'package:liner/provider/weatherState.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



WeatherState weatherState;

  TextStyle textStyle;






  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    weatherState = Provider.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          leading: IconButton(icon: Icon(Icons.search, color: Colors.white,),),
        title: Text(""),
        actions: [
          IconButton(icon: Icon(Icons.waves_rounded, color: Colors.white,), onPressed: null)
        ],
      ),

      body: Container(
        child: Stack(
          children: [
            Image.asset("assets/images/night.jpeg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,

            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black38
              ),
            ),
            Daily(textStyle: textStyle,)
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  getLocation() async{

    print("caleed");
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // latitude = position.latitude;
    // longitude = position.longitude;

    fetch(lat: position.latitude, lon: position.longitude);
  }


  fetch({lat, lon})async{
    var result = await weatherState.fetchWeatherdaily(lon: lon, lat: lat);
    print(result);
  }


}