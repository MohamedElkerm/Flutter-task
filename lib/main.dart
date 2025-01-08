import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/weather_app_start_point.dart';

import 'helper/bloc_observer.dart';
import 'helper/remote/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  /// init the dio to work
  await DioHelper.dioInit();

  /// enable the blocObserver
  Bloc.observer = MyBlocObserver();

  /// force the user to use the app portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  runApp(
    const WeatherApp(),
  );
}
