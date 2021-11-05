import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{
  String primaryApi = 'https://worldtimeapi.org/api/timezone/';
  String? locationUri = "Africa/Lagos";
  String secondaryApi = "https://worldtimeapi.org/api/timezone/Africa/Lagos";
  String time = "_:_:_";
  String timeOfDay = "Morning";
  int dayOfWeekNum = 0;
  String dayOfWeek = "Sunday";
  String? location;

  WorldTime({required this.locationUri, this.location})
  {
    secondaryApi = primaryApi + locationUri.toString();
  }

  Future <void> calcDateTime() async{

    try
    {
      //get lagos time from worldtimeapi
      Response response = await get(Uri.parse(secondaryApi));
      //convert json string to map/object literals
      Map data = jsonDecode(response.body);
      //extract datetime anf offset objects from map: offset converts gmt to local time
      String dateTime = data['datetime'];
      String offset = data['utc_offset'];
      //print results to check
      print ("Date time in $locationUri is $dateTime and offset is $offset");
      //create a Datetime instance in order to convert datetime string
      DateTime now = DateTime.parse(dateTime);
      //Convert offset string to int: because offset usually looks like +01:00 or -11:00, we use substring to extract only characters 1 to 3
      int offsetInt = int.parse(offset.substring(1,3));
      //add offset to now
      now = now.add(Duration(hours: offsetInt));

      Map daysOfTheWeek = {'7':"Sunday",'1':"Monday",'2':"Tuesday",'3':"Wednessday",'4':"Thursday",'5':"Friday",'6':"Saturday"};

      dayOfWeekNum = now.day;
      dayOfWeek = daysOfTheWeek[dayOfWeekNum.toString()];
      time = now.toString();
      print(dayOfWeek);
      print(time);
      setTimeOfDay();

    }
    catch (exeption)
    {
      print("Caught error:------------------Error Message----------------------:\n $exeption \n :-----------------------------End of Error Message---------------:");
      time = "We're currently unable to retrieve this time.";
    }


  }
void setTimeOfDay()
{
  int timeInday = int.parse(time.substring(11,13)) ;
  print(timeInday);

  if((timeInday >= 4) && (timeInday < 6))
  {
    timeOfDay = "Early morning";
  }
  if((timeInday >= 6) && (timeInday < 12))
  {
    timeOfDay = "Morning";
  }
  if((timeInday >= 12) && (timeInday < 16))
  {
    timeOfDay = "Afternoon";
  }
  if((timeInday >= 16) && (timeInday < 19))
  {
    timeOfDay = "Evening";
  }
  if((timeInday >= 19) && (timeInday > 0))
  {
    timeOfDay = "Night";
  }
  if((timeInday >= 0) && (timeInday < 4))
  {
    timeOfDay = "Mid-night";
  }
  print(timeOfDay);
}

}