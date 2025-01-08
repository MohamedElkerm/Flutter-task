import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/city_weather_model.dart';
import 'package:weather_app/resources/colors_manager.dart';

import '../../../helper/remote/dio_helper.dart';
import '../../../helper/remote/endpoints.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  SearchScreenCubit() : super(SearchScreenInitial());

  TextEditingController searchTextEditingController = TextEditingController();

  CityWeatherModel? cityWeatherModel;
  bool searchButtonIsLoading = false;

  void getWeatherCityByCityName() {
    emit(GetWeatherCityByNameLoadingSate());
    cityWeatherModel = null;

    if (searchTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "The city name is required",
        backgroundColor: AppColors.inf_suc_dan_warn_danger,
      );
      emit(GetWeatherCityByNameErrorSate());

    } else {
      searchButtonIsLoading = true;

      DioHelper.getData(path: AppEndpoints.getCityWeatherByCityName, params: {
        'q': searchTextEditingController.text.trim(),
        'appid': dotenv.env['APPID'],
        'units': 'metric',
      }).then((value) {
        cityWeatherModel = CityWeatherModel.fromJson(
          value.data,
        );
        searchButtonIsLoading = false;
        emit(GetWeatherCityByNameSuccessSate());
      }).catchError((err) {
        Fluttertoast.showToast(
          msg: "not found the city name",
          backgroundColor: AppColors.inf_suc_dan_warn_danger,
        );
        searchButtonIsLoading = false;
        emit(GetWeatherCityByNameErrorSate());
      });
    }
  }
}
