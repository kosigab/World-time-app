import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home_page.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/loading_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map loadedData = {};

  @override
  Widget build(BuildContext context) {
    loadedData = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      //backgroundColor: Colors.indigo[100],
        body: SafeArea(
          child: Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/${loadedData['timeOfDay']}.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(.45), BlendMode.darken),
              ),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Good ${loadedData['timeOfDay']} ${loadedData['location']}",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                  " ${loadedData['dayOfWeek']}, ${loadedData['time'].toString().substring(0,10)}",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue[200],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.blue[200],
                        margin: EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Text(

                            "${loadedData['time'].toString().substring(11,12)}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.blue[200],
                        margin: EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Text(

                            "${loadedData['time'].toString().substring(12,13)}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    Text(":",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.blue[200],
                        margin: EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Text(

                            "${loadedData['time'].toString().substring(14,15)}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.blue[200],
                        margin: EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Text(

                            "${loadedData['time'].toString().substring(15,16)}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: TextButton.icon(
                    onPressed: ()
                    {

                      Navigator.pushReplacementNamed(context,  '/location');
                    },
                    icon: Icon(Icons.add_location_alt),
                    label: Text("Change location", style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),),

                  ),
                ),

              ],
            ),
          ),
        ),

    );
  }
}
