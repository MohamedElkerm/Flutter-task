
import 'package:flutter/material.dart';
import 'package:weather_app/modules/details/ui/details_screen.dart';
import 'package:weather_app/modules/home/ui/home_screen.dart';
import 'package:weather_app/modules/search/ui/search_screen.dart';

class Routes {
  static const String homeScreen = '/';
  static const String searchScreen = '/search';
  static const String detailsScreen = '/details';


}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.detailsScreen:
        return MaterialPageRoute(builder: (_) => const DetailsScreen());

      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
