part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class NavigateToSearchScreenFromHomeScreenState extends HomeScreenState {}
final class AddCityToTheListState extends HomeScreenState {}
