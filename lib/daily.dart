
import 'package:flutter/material.dart';
import 'package:liner/model/weatherModel.dart';
import 'package:liner/utils/myUtils.dart';
import 'package:liner/utils/sizeConfig/sizeConfig.dart';
import 'package:liner/widget/iconAndtext.dart';

class Daily extends StatelessWidget {
    TextStyle textStyle;
    WeatherModel weatherModel;
Daily({this.textStyle, this.weatherModel});
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 14.7 * SizeConfig.heightMultiplier ,),
          Expanded(
            flex:2,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(weatherModel.name, style: TextStyle(color: Colors.white, fontSize: 3.0 * SizeConfig.textMultiplier, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text(MyUtils.formatDate(DateTime.now()), style: TextStyle(color: Colors.white, fontSize: 1.8 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),),
                    SizedBox(height: 15,),
                    Text(weatherModel.weather[0].description, style: TextStyle(color: Colors.white, fontSize:  1.8 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),)
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${weatherModel.temp}\u2103", style: TextStyle(color: Colors.white, fontSize: 10.4 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),),
                    SizedBox(height: 10,),
                    // Text(, style: TextStyle(color: Colors.white, fontSize:  1.8 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),),

                  ],
                ),


              ],
            ),
          ),
          // SizedBox(height: 50,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.white,),
                  SizedBox(height: 6.1 * SizeConfig.heightMultiplier,),
                  Container(padding: EdgeInsets.only(right: 15, ),
                    child: Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            IconAndText(image: "assets/images/temp.png", title: "Feels like", subtitle: "${weatherModel.feels_like}\u2103", textStyle: textStyle ),

                            IconAndText(image: "assets/images/wet.png", title: "Humidity", subtitle: "${weatherModel.humidity}%", textStyle: textStyle)
                          ],
                        ),
                        SizedBox(height: 2.4 * SizeConfig.heightMultiplier,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            IconAndText(image: "assets/images/windy.png", title: "Wind", subtitle: "${weatherModel.wind}km/h", textStyle: textStyle),

                            IconAndText(image: "assets/images/sunny.png", title: "UV index", subtitle: "22\u2103", textStyle: textStyle)
                          ],
                        ),
                        // SizedBox(height: 20,),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


class WeeklyWidget extends StatelessWidget {
  TextStyle textStyle;
  WeatherModel weatherModel;

  WeeklyWidget({this.textStyle, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 120, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            flex:2,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(weatherModel.name, style: TextStyle(color: Colors.white, fontSize: 2.0 * SizeConfig.textMultiplier, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text(MyUtils.formatDate(DateTime.now()), style: TextStyle(color: Colors.white, fontSize: 1.4 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),),
                    SizedBox(height: 15,),
                    Text(weatherModel.weather[0].description, style: TextStyle(color: Colors.white, fontSize:  1.4 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),)
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${weatherModel.temp}\u2103", style: TextStyle(color: Colors.white, fontSize: 7.4 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),),
                    // SizedBox(height: 10,),
                    // Text(, style: TextStyle(color: Colors.white, fontSize:  1.8 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),),

                  ],
                ),


              ],
            ),
          ),



        ],
      ),
    );
  }
}
