import 'dart:convert';

class CityWeatherModel {
  String weatherCondition;

  String WindSpeed;

  String humidity;

  String temp;

  int id;

  String cityName;

  CityWeatherModel({
    required this.weatherCondition,
    required this.WindSpeed,
    required this.humidity,
    required this.temp,
    required this.id,
    required this.cityName,
  });

  factory CityWeatherModel.fromJson(Map<String, dynamic> json) {
    return CityWeatherModel(
      weatherCondition: json["weather"][0]['main'].toString(),
      WindSpeed: json["wind"]['speed'].toString(),
      humidity: json["main"]['humidity'].toString(),
      temp: json["main"]['temp'].toString(),
      id: int.parse(json["id"].toString()),
      cityName: json["name"].toString(),
    );
  }

  factory CityWeatherModel.fromJsonFromLocalDB(Map<String, dynamic> json) {
    return CityWeatherModel(
      weatherCondition: json["weather_condition"].toString(),
      WindSpeed: json["wind_speed"].toString(),
      humidity: json["humidity"].toString(),
      temp: json["temp"].toString(),
      id: int.parse(json["id"].toString()),
      cityName: json["city_name"].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "weather_condition": this.weatherCondition,
      "wind_speed": this.WindSpeed,
      "humidity": this.humidity,
      "temp": this.temp,
      "id": this.id,
      "city_name": this.cityName,
    };
  }

//

//
}
