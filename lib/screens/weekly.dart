import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liner/daily.dart';
import 'package:liner/model/weatherModel.dart';
import 'package:liner/model/weeklyModel.dart';
import 'package:liner/provider/appState.dart';
import 'package:liner/provider/weatherState.dart';
import 'package:liner/utils/myUtils.dart';
import 'package:liner/widget/weeklySummary.dart';
import 'package:provider/provider.dart';

class Weekly extends StatefulWidget {
  WeatherModel weatherModel;
  Weekly({this.weatherModel});
  @override
  _WeeklyState createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> with AfterLayoutMixin<Weekly> {
  bool isLoading = false;
  TextStyle textStyle;
  WeatherState weatherState;
  AppState appState;
  List<WeeklyModel> weeklyModel;
  @override
  void initState() {
    textStyle = TextStyle(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of(context);
    weatherState = Provider.of(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: false,
              // title: Text("Weekly"),
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/images/night.jpeg",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black38),
                  ),
                  WeeklyWidget(
                    textStyle: textStyle,
                    weatherModel: widget.weatherModel,
                  )
                ],
              ),
            ),
            isLoading
                ? _beforeDataLoaded()
                : weeklyModel.isEmpty
                    ? _beforeDataEmpty()
                    : SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          if (index > 0) {
                            return WeeklySummary(
                              weeklyModel: weeklyModel[index],
                            );
                          }
                          return Container();
                        }, childCount: weeklyModel.length),
                      ),
          ],
        ));
  }

  Widget _beforeDataLoaded() {
    return new SliverFillRemaining(
      child: new Container(
        child: new Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  Widget _beforeDataEmpty() {
    return new SliverFillRemaining(
      child: new Container(
        child: new Center(
          child: Text("No Requests"),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    fetch(lon: appState.longitude, lat: appState.latitude);
  }

  fetch({lat, lon}) async {
    setState(() {
      isLoading = true;
    });
    var result = await weatherState.fetchWeatherOneCall(lon: lon, lat: lat);
    setState(() {
      isLoading = false;
    });
    if (result["error"] == false) {
      weeklyModel = result["weekly"];
    } else {}
  }
}
