import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home_page.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/loading_screen.dart';
import 'package:world_time_app/services/location_list.dart';
import '../services/world_time_service.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  WorldTime wTime = WorldTime(locationUri: "");

  List<String>locationSubUri = ["Africa/Accra","Africa/Algiers","Africa/Bissau","Africa/Cairo","Africa/Casablanca","Africa/Ceuta","Africa/El_Aaiun","Africa/Johannesburg","Africa/Juba","Africa/Khartoum","Africa/Lagos","Africa/Maputo","Africa/Monrovia","Africa/Nairobi","Africa/Ndjamena","Africa/Sao_Tome","Africa/Tripoli","Africa/Tunis","Africa/Windhoek"];


  List<WorldTime> wtimeList = [];


  @override
  void initState() {
    // TODO: implement initState
    print("Initial state");
    super.initState();
    LocationList locList = LocationList();
    wtimeList = locList.wtGen(locationSubUri);


  }

  @override
  Widget build(BuildContext context) {
    print("Build state");
    return  Scaffold(
      appBar: AppBar(
        title: Text("Choose location"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 20,
        shadowColor: Colors.black,

      ),
      body: SafeArea(
        child: Container(
            child: ListView.builder(
                itemCount: locationSubUri.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 5,
                      color: Colors.grey[300],
                      child: ListTile(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, '/load', arguments: {
                            'worldTime': wtimeList[index]});
                        },
                        title: Text(wtimeList[index].location.toString(), style: TextStyle(
                          fontSize: 22,

                        ),),

                      ),
                    ),
                  );
                })
        ),
      ),

    );
  }
}
