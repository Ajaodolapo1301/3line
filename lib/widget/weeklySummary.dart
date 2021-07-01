
import 'package:flutter/material.dart';
import 'package:liner/model/weeklyModel.dart';
import 'package:liner/utils/myUtils.dart';

class WeeklySummary extends StatefulWidget {
  WeeklyModel weeklyModel;
  WeeklySummary({this.weeklyModel});

  @override
  _WeeklySummaryState createState() => _WeeklySummaryState();
}

class _WeeklySummaryState extends State<WeeklySummary> {
TextStyle textStyle;
  @override
  void initState() {
  textStyle = TextStyle(fontSize: 12);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/${getConditionSvg(widget.weeklyModel.weather[0].id)}.png"),
          // SizedBox(width: 20,),
          Text(MyUtils.formatDatefromTimeStamp(widget.weeklyModel.dt)),
          Text("${widget.weeklyModel.max}\u2103/${widget.weeklyModel.min}\u2103", style: textStyle),
          Text(widget.weeklyModel.weather[0].description)
        ],
      ),
    );
  }




getConditionSvg(int condition){
  if(condition < 300){
    return "cloudySvg";
  }else if (condition < 400){
    return "rainSvg";
  }else if (condition < 600){
    return "rainSvg";
  }
  else if (condition < 800){
    return "thunderstorm";
  }
  else if (condition < 804){
    return "cloudy";
  }
}
}