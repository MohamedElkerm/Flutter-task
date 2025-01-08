import 'package:flutter/material.dart';

import '../../../helper/global_widgets/MyResponsiveText.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/fonts_style.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({
    super.key,
    required this.countryName,
    required this.countryWeatherCondition,
    required this.countryTemp,
    this.haveSaveButton = false,
  });

  final String countryName;
  final String countryWeatherCondition;
  final String countryTemp;
  final haveSaveButton;

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
                      onPressed: () {},
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
