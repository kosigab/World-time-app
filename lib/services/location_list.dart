//import 'dart:core';
import 'package:flutter/material.dart';
import '../services/world_time_service.dart';

class LocationList
{

  LocationList();

  List<String> listCompiler(List<String> locationSubUri)
  {

    List<String> locationSub = [];
    for(int i = 0; i < locationSubUri.length; i++)
    {

      int stroke = locationSubUri[i].indexOf('/') + 1;
      locationSub.add(locationSubUri[i].substring(stroke, locationSubUri[i].length));
      print(locationSub[i]);

    }
    return locationSub;
  }

  List <WorldTime> wtGen(List<String> locationSubUri)
  {
    List <WorldTime> worldList = [];
    for(int i = 0; i < locationSubUri.length; i++)
      {
        WorldTime wt = WorldTime(locationUri: locationSubUri[i], location: listCompiler(locationSubUri)[i]);
        worldList.add(wt);
      }
    return worldList;
  }


}