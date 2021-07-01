
import 'package:flutter/material.dart';

Widget IconAndText({image, title, subtitle, TextStyle textStyle}){
  return   Row(
    children: [
      Image.asset(image, color: Colors.white, height: 30,width: 30,),
      SizedBox(width: 15,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: textStyle, ),
          Text(subtitle, style: textStyle,),

        ],
      )
    ],
  );
}