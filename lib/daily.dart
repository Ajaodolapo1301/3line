
import 'package:flutter/material.dart';
import 'package:liner/utils/sizeConfig/sizeConfig.dart';
import 'package:liner/widget/iconAndtext.dart';

class Daily extends StatelessWidget {
    TextStyle textStyle;
Daily({this.textStyle});
  @override
  Widget build(BuildContext context) {
    return   Container(
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
                    Text("New Delhi", style: TextStyle(color: Colors.white, fontSize: 3.0 * SizeConfig.textMultiplier, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text("Friday june 20", style: TextStyle(color: Colors.white, fontSize: 1.8 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),),
                    SizedBox(height: 15,),
                    Text("Night time", style: TextStyle(color: Colors.white, fontSize:  1.8 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),)
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("24\u2103", style: TextStyle(color: Colors.white, fontSize: 10.4 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),),
                    SizedBox(height: 10,),
                    Text("Friday june 20", style: TextStyle(color: Colors.white, fontSize:  1.8 * SizeConfig.textMultiplier, fontWeight: FontWeight.w400),),

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
                  SizedBox(height: 50,),
                  Container(padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            IconAndText(image: "assets/images/temp.png", title: "Feels like", subtitle: "22\u2103", textStyle: textStyle ),

                            IconAndText(image: "assets/images/wet.png", title: "Humidity", subtitle: "22\u2103", textStyle: textStyle)
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            IconAndText(image: "assets/images/windy.png", title: "Wind", subtitle: "22\u2103", textStyle: textStyle),

                            IconAndText(image: "assets/images/sunny.png", title: "UV index", subtitle: "22\u2103", textStyle: textStyle)
                          ],
                        ),
                        SizedBox(height: 20,),
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