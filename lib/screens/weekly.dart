



import 'package:flutter/material.dart';
import 'package:liner/daily.dart';

class Weekly extends StatefulWidget {

  @override
  _WeeklyState createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {

  TextStyle textStyle;


  @override
  void initState() {
    textStyle =   TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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

        body: CustomScrollView(
          slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: false,
          // title: Text("Weekly"),
          flexibleSpace: Stack(
            children: [
              FlexibleSpaceBar(
                background:  Image.asset("assets/images/night.jpeg",
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),

              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black38
                ),
              ),
            ],
          ),
        )

          ],
        )
    );
  }





}
