import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home_page.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/loading_screen.dart';

main()
{

  runApp(MaterialApp(
    //home: const LoadingScreen(),
    initialRoute: '/location',
    routes: {
      '/load': (context) => const LoadingScreen(),
      '/home': (context) => const HomePage(),
      '/location': (context) => const ChooseLocation(),
    },
  )
  );
}
