import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/modules/home/logic/home_screen_cubit.dart';
import 'package:weather_app/modules/home/ui/home_screen.dart';
import 'package:weather_app/resources/routes_manager.dart';
import 'package:weather_app/resources/themes/light_theme.dart';

import 'helper/global_vars.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..initTheHomeScreenAndGetTheCityCachedData(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        builder: FToastBuilder(),
        onGenerateRoute: RoutesGenerator.getRoute,
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}


