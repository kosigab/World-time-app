import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home_page.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/loading_screen.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../services/world_time_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String nowString = "Loading...";
  WorldTime worldTime = WorldTime(locationUri: "Africa/Tripoli");
  Map loadedData = {};

  void setupTime( WorldTime wt) async
  {
    worldTime = wt;
    await worldTime.calcDateTime();
    setState(() {
      nowString = worldTime.time;
    });
    if (nowString!="We're currently unable to retrieve this time.")
    {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': worldTime.location,
        'time': worldTime.time,
        'dayOfWeek':worldTime.dayOfWeek,
        'timeOfDay':worldTime.timeOfDay,
      });
    }
  }

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();


  }
  @override
  build(BuildContext context) {
    loadedData = ModalRoute.of(context)!.settings.arguments as Map;
    setupTime(loadedData['worldTime']);
    String testText =  nowString;
    //testText = "Loading...";
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitDoubleBounce(
                color: Colors.blue[900],
                size: 80.0,),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(testText, style: TextStyle(
                  fontSize: 20,
                ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
