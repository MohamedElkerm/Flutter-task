import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/helper/global_widgets/my_text_form_field.dart';
import 'package:weather_app/modules/home/ui/home_widgets.dart';
import 'package:weather_app/modules/search/logic/search_screen_cubit.dart';

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
                    hintText: "hintText",
                    label: "search",
                    textEditingController:
                        searchCubit.searchTextEditingController,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const WeatherCardWidget(
                    countryName: "Cairo",
                    countryWeatherCondition: "rainy",
                    countryTemp: "10",
                    haveSaveButton: true,
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
