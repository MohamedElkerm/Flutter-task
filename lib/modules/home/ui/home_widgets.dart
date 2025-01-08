import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/city_weather_model.dart';
import 'package:weather_app/modules/home/logic/home_screen_cubit.dart';

import '../../../helper/global_widgets/my_responsive_text.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/fonts_style.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({
    super.key,
    required this.countryName,
    required this.countryWeatherCondition,
    required this.countryTemp,
    this.haveSaveButton = false,
    this.buttonFunction = null,
  });

  final String countryName;
  final String countryWeatherCondition;
  final String countryTemp;
  final haveSaveButton;
  final buttonFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColorCyan,
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            MyResponsiveText(
              text: "$countryName,",
              style: getSemiBold(
                fontColor: AppColors.myWhite,
                fontSize: 24,
              ),
            ),
            MyResponsiveText(
              text: countryWeatherCondition.toString(),
              style: getRegular(
                fontColor: AppColors.myWhite,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            MyResponsiveText(
              text: "$countryTemp°",
              style: getSemiBold(
                fontColor: AppColors.myWhite,
                fontSize: 24,
              ),
            ),
            haveSaveButton
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      onPressed: () {
                        buttonFunction();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.myWhite,
                        ),
                      ),
                      child: MyResponsiveText(
                        text: "Save",
                        style: getBold(
                          fontColor: AppColors.primaryColorCyan,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class NoDataOnHomeScreenWidget extends StatelessWidget {
  const NoDataOnHomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyResponsiveText(
        text: "No data to display",
        style: getBold(
          fontColor: AppColors.primaryColorCyan,
          fontSize: 24,
        ),
        maxLines: 3,
      ),
    );
  }
}

class DisplayTheListOfCities extends StatelessWidget {
  const DisplayTheListOfCities({
    super.key,
    required this.citiesList,
  });

  final List<CityWeatherModel?> citiesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: citiesList.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<HomeScreenCubit>(context)
                      .navigateFromHomeScreenToDetailsScreen(
                    context: context,
                    cityWeatherModel: citiesList.elementAt(index),
                  );
                },
                child: WeatherCardWidget(
                  countryName: citiesList.elementAt(index)!.cityName.toString(),
                  countryWeatherCondition:
                      citiesList.elementAt(index)!.weatherCondition,
                  countryTemp: citiesList.elementAt(index)!.temp,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
