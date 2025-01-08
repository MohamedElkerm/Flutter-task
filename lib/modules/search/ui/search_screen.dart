import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/helper/global_widgets/my_fill_button.dart';
import 'package:weather_app/helper/global_widgets/my_text_form_field.dart';
import 'package:weather_app/helper/remote/dio_helper.dart';
import 'package:weather_app/helper/remote/endpoints.dart';
import 'package:weather_app/modules/home/logic/home_screen_cubit.dart';
import 'package:weather_app/modules/home/ui/home_widgets.dart';
import 'package:weather_app/modules/search/logic/search_screen_cubit.dart';
import 'package:weather_app/resources/colors_manager.dart';
import 'package:weather_app/resources/fonts_style.dart';

import '../../../helper/global_widgets/my_app_bar_widget.dart';
import '../../../resources/strings/app_strings.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchScreenCubit(),
      child: BlocConsumer<SearchScreenCubit, SearchScreenState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var searchCubit = BlocProvider.of<SearchScreenCubit>(context);
          return Scaffold(
            appBar: myAppBar(
              appBarTitle: AppStrings.searchScreenTitle,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  MyTextFormField(
                    hintText: AppStrings.hintTextForSearchField,
                    label: AppStrings.titleForSearchField,
                    textEditingController:
                        searchCubit.searchTextEditingController,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  searchCubit.searchButtonIsLoading
                      ? const MyButtonLoading()
                      : MyButton(
                          textStyle: getSemiBold(
                            fontColor: AppColors.myWhite,
                            fontSize: 16,
                          ),
                          btnName: AppStrings.search,
                          function: () {
                            searchCubit.getWeatherCityByCityName();
                          },
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  searchCubit.cityWeatherModel == null ||
                          searchCubit.searchButtonIsLoading
                      ? SizedBox()
                      : BlocConsumer<HomeScreenCubit, HomeScreenState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            var homeCubit =
                                BlocProvider.of<HomeScreenCubit>(context);
                            return WeatherCardWidget(
                              countryName:
                                  searchCubit.cityWeatherModel!.name.toString(),
                              countryWeatherCondition:
                                  searchCubit.cityWeatherModel!.weather[0].main,
                              countryTemp: searchCubit
                                  .cityWeatherModel!.main.temp
                                  .toString(),
                              haveSaveButton: true,
                              buttonFunction: () {
                                homeCubit.saveCityToTheList(
                                  searchCubit.cityWeatherModel,
                                );
                              },
                            );
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
