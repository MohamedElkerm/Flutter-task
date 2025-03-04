import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/helper/local/sqlite_helper.dart';
import 'package:weather_app/models/city_weather_model.dart';
import 'package:weather_app/resources/colors_manager.dart';
import 'package:weather_app/resources/routes_manager.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  List<CityWeatherModel?> citiesList = [];

  late CityWeatherModel? currentCityWeatherModelForDetailsScreen;

  bool getTheCachedData = false;

  initTheHomeScreenAndGetTheCityCachedData() async {
    citiesList.clear();
    getTheCachedData = true;
    emit(GetTheCachedDataLoadingState());
    citiesList = await LocalDatabaseHelper.getAllCitiesWeather().then(
          (onValue) {
        getTheCachedData = false;
        emit(GetTheCachedDataSuccessState());

        return onValue;
      },
    ).catchError((onError) {
      getTheCachedData = false;
      emit(GetTheCachedDataErrorState());
      return onError;
    });
  }

  saveCityToTheList(CityWeatherModel? cityWeatherModel) {
    if(isNewItem(citiesList, cityWeatherModel!.id.toString())){
      citiesList.add(cityWeatherModel);
      LocalDatabaseHelper.insertCityWeather(
        city_name: cityWeatherModel!.cityName.toString(),
        temp: cityWeatherModel!.temp.toString(),
        weather_condition: cityWeatherModel!.weatherCondition.toString(),
        humidity: cityWeatherModel!.humidity.toString(),
        wind_speed: cityWeatherModel!.WindSpeed.toString(),
        id: cityWeatherModel!.id.toString(),
      );
      Fluttertoast.showToast(
        msg: "add city successfully",
        backgroundColor: AppColors.inf_suc_dan_warn_sucess,
      );
      emit(AddCityToTheListState());
    }else{
      Fluttertoast.showToast(
        msg: "this city is already added!",
        backgroundColor: AppColors.inf_suc_dan_warn_warning,
      );
    }

  }

  void deleteCityFromTheListAndTheLocalDB(
      {required String id, required BuildContext context}) {
    emit(DeleteCityFromDBLoadingState());

    citiesList.removeWhere((e) => e?.id == id);

    emit(DeleteCityFromDBSuccessState());

    LocalDatabaseHelper.deleteCityById(id).then((onValue) {
      Fluttertoast.showToast(
        msg: "Deleted Succefully !",
        backgroundColor: AppColors.inf_suc_dan_warn_sucess,
      );

      initTheHomeScreenAndGetTheCityCachedData();
      Navigator.of(context).pop();
      emit(DeleteCityFromDBSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(DeleteCityFromDBErrorState());
    });
  }

  void navigateFromHomeScreenToSearchScreen({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      Routes.searchScreen,
    );
    emit(NavigateToSearchScreenFromHomeScreenState());
  }

  navigateFromHomeScreenToDetailsScreen({
    required BuildContext context,
    required CityWeatherModel? cityWeatherModel,
  }) {
    currentCityWeatherModelForDetailsScreen = cityWeatherModel;
    Navigator.of(context).pushNamed(
      Routes.detailsScreen,
    );
    emit(NavigateToDetailsScreenFromHomeScreenState());
  }

  bool isNewItem(List<CityWeatherModel?> list, String id) {
    return !list.any((item) => item!.id.toString() == id);
  }

}
