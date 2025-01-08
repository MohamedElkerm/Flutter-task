import 'package:flutter/material.dart';
import 'package:weather_app/modules/home/ui/home_screen.dart';
import 'package:weather_app/resources/routes_manager.dart';

import 'helper/global_vars.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: RoutesGenerator.getRoute,

      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}


