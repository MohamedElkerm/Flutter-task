import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/city_weather_model.dart';

import '../../../helper/remote/dio_helper.dart';
import '../../../helper/remote/endpoints.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  SearchScreenCubit() : super(SearchScreenInitial());

  TextEditingController searchTextEditingController = TextEditingController();

  CityWeatherModel? cityWeatherModel;

  void getWeatherCityByCityName() {
    emit(GetWeatherCityByNameLoadingSate());

    DioHelper.getData(path: AppEndpoints.getCityWeatherByCityName, params: {
      'q': searchTextEditingController.text.trim(),
      'appid': dotenv.env['APPID'],
      'units': 'metric',
    }).then((value) {
      cityWeatherModel = CityWeatherModel.fromJson(
        value.data,
      );
      emit(GetWeatherCityByNameSuccessSate());
    }).catchError((err) {
      print(err.toString());
      emit(GetWeatherCityByNameErrorSate());
    });
  }
}
