import 'package:flutter/material.dart';
import 'package:weather_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:weather_app/helper/global_widgets/my_app_bar_widget.dart';
import 'package:weather_app/resources/colors_manager.dart';
import 'package:weather_app/resources/fonts_style.dart';
import 'package:weather_app/resources/strings/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        appBarTitle: AppStrings.homeScreenTitle,
      ),
      body: Center(
        child: MyResponsiveText(
          text: "No data to display",
          style: getBold(
            fontColor: AppColors.primaryColorCyan,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
