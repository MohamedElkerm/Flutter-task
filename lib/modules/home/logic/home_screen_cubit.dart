import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/resources/routes_manager.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());



  void navigateFromHomeScreenToSearchScreen({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      Routes.searchScreen,
    );
    emit(NavigateToSearchScreenFromHomeScreenState());
  }
}
