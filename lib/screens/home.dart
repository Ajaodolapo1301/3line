import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:liner/daily.dart';
import 'package:liner/model/weatherModel.dart';
import 'package:liner/model/weeklyModel.dart';
import 'package:liner/provider/appState.dart';
import 'package:liner/provider/weatherState.dart';
import 'package:liner/screens/weekly.dart';
import 'package:liner/utils/myUtils.dart';
import 'package:liner/utils/navigation/navigator.dart';
import 'package:overlay_support/overlay_support.dart';
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

          title: Text(""),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
              value == 1 ?     pushTo(context, Weekly(weatherModel: weatherModel,)) : toast("Check back");
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text(
                    "Weekly",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text(
                    "Share",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  value: 2,
                )
              ],
            ),

            // IconButton(icon: Icon(Icons.d, color: Colors.white,), onPressed: (){
            //   pushTo(context, Weekly(weatherModel: weatherModel,));
            // })
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/${MyUtils.getCondition(weatherModel.weather[0].id)}.jpeg",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.black38),
                    ),
                    Daily(
                      textStyle: textStyle,
                      weatherModel: weatherModel,
                    )
                  ],
                ),
              ));
  }

  getLocation() async {
    setState(() {
      isLoading = true;
    });
    print("caleed");
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    appState.latitude = position.latitude;
    appState.longitude = position.longitude;

    fetch(lat: position.latitude, lon: position.longitude);
  }

  fetch({lat, lon}) async {
    var result = await weatherState.fetchWeatherdaily(lon: lon, lat: lat);
    setState(() {
      isLoading = false;
    });
    if (result["error"] == false) {
      weatherModel = result["weather"];
    } else {}
  }
}
