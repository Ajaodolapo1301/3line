

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:liner/screens/home.dart';


class SplashPage extends StatefulWidget {
  final  driver;
  SplashPage({this.driver});
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {





  @override
  void initState() {

    super.initState();

    Timer(Duration(seconds: 5,) , ()=>   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage())));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.black
            ),
          ),

          Center(
            child: Container(
                height: 200,
                width: 200,
                child: Image.asset('images/appicon.png')),
          ),

        ],
      ),
    );
  }
}


