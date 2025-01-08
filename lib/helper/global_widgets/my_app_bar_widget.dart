import 'package:flutter/material.dart';
import 'package:weather_app/helper/global_widgets/my_responsive_text.dart';
import 'package:weather_app/resources/fonts_style.dart';

import '../../resources/colors_manager.dart';

PreferredSizeWidget myAppBar({required String appBarTitle}) {
  return AppBar(
    title: MyResponsiveText(
      text: appBarTitle.toString(),
      style: getRegular(
        fontColor: AppColors.myWhite,
        fontSize: 24,
      ),
    ),
    backgroundColor: AppColors.primaryColorCyan,
    centerTitle: true,
  );
}
