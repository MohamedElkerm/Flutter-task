import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/helper/global_widgets/my_fill_button.dart';
import 'package:weather_app/helper/global_widgets/my_text_form_field.dart';
import 'package:weather_app/modules/home/logic/home_screen_cubit.dart';
import 'package:weather_app/resources/colors_manager.dart';
import 'package:weather_app/resources/fonts_style.dart';

import '../../../helper/global_widgets/my_app_bar_widget.dart';
import '../../../resources/strings/app_strings.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        appBarTitle: AppStrings.detailsScreenTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var homeCubit = BlocProvider.of<HomeScreenCubit>(context);
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                MyTextFormFieldViewOnly(
                  initValue: homeCubit
                      .currentCityWeatherModelForDetailsScreen!.cityName
                      .toString(),
                  label: AppStrings.cityNameTitleField,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 18,
                ),
                MyTextFormFieldViewOnly(
                  initValue:
                      "${homeCubit.currentCityWeatherModelForDetailsScreen!.temp.toString()}°",
                  label: AppStrings.cityTempTitleField,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 18,
                ),
                MyTextFormFieldViewOnly(
                  initValue: homeCubit
                      .currentCityWeatherModelForDetailsScreen!.weatherCondition
                      .toString(),
                  label: AppStrings.weatherConditionTitleField,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 18,
                ),
                MyTextFormFieldViewOnly(
                  initValue: homeCubit
                      .currentCityWeatherModelForDetailsScreen!.humidity
                      .toString(),
                  label: AppStrings.cityTempTitleField,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 18,
                ),
                MyTextFormFieldViewOnly(
                  initValue: homeCubit
                      .currentCityWeatherModelForDetailsScreen!.WindSpeed,
                  label: AppStrings.windSpeedTitleField,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 22,
                ),
                MyButton(
                  btnColor: AppColors.inf_suc_dan_warn_danger,
                  btnBorderColor: AppColors.inf_suc_dan_warn_danger,
                  textStyle: getBold(
                    fontColor: AppColors.myWhite,
                    fontSize: 20,
                  ),
                  btnName: AppStrings.delete,
                  function: () {
                    homeCubit.deleteCityFromTheListAndTheLocalDB(
                      id: homeCubit.currentCityWeatherModelForDetailsScreen!.id
                          .toString(),
                      context: context,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
