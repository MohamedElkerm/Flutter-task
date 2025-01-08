part of 'search_screen_cubit.dart';

@immutable
sealed class SearchScreenState {}

final class SearchScreenInitial extends SearchScreenState {}

final class GetWeatherCityByNameSuccessSate extends SearchScreenState {}
final class GetWeatherCityByNameLoadingSate extends SearchScreenState {}
final class GetWeatherCityByNameErrorSate extends SearchScreenState {}
