import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/helper/global_widgets/my_responsive_text.dart';
import 'package:weather_app/helper/global_widgets/my_app_bar_widget.dart';
import 'package:weather_app/modules/home/logic/home_screen_cubit.dart';
import 'package:weather_app/modules/home/ui/home_widgets.dart';
import 'package:weather_app/resources/colors_manager.dart';
import 'package:weather_app/resources/fonts_style.dart';
import 'package:weather_app/resources/icons_manager.dart';
import 'package:weather_app/resources/media_query_values.dart';
import 'package:weather_app/resources/routes_manager.dart';
import 'package:weather_app/resources/strings/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeScreenCubit>(context);
        return Scaffold(
          appBar: myAppBar(
            appBarTitle: AppStrings.homeScreenTitle,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: homeCubit.getTheCachedData
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColorCyan,
                    ),
                  )
                : homeCubit.citiesList.isEmpty
                    ? const NoDataOnHomeScreenWidget()
                    : DisplayTheListOfCities(
                        citiesList: homeCubit.citiesList,
                      ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              homeCubit.navigateFromHomeScreenToSearchScreen(
                context: context,
              );
            },
            backgroundColor: AppColors.primaryColorCyan,
            child: const Icon(
              Icons.search_rounded,
              color: AppColors.myWhite,
            ),
          ),
        );
      },
    );
  }
}
