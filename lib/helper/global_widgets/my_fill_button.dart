import 'package:flutter/material.dart';
import 'package:weather_app/resources/media_query_values.dart';

import '../../resources/colors_manager.dart';
import 'my_responsive_text.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    this.btnColor = AppColors.primaryColorCyan,
    this.btnBorderColor = AppColors.primaryColorCyan,
    required this.textStyle,
    required this.btnName,
    required this.function,
    this.isDisabled = false,
  });

  Color btnColor;
  Color btnBorderColor;
  TextStyle textStyle;
  String btnName;
  Function function;
  bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isDisabled ? null : function();
      },
      child: Container(
        height: MediaQueryValues(context).height * 0.065,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDisabled ? AppColors.b_w_100 : btnColor,
          border: Border.all(
            color: isDisabled ? AppColors.b_w_100 : btnBorderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            9,
          ),
        ),
        child: Center(
          child:  MyResponsiveText(
                  text: btnName.toString(),
                  style: textStyle,
                  minFontSize: 12,
                ),
        ),
      ),
    );
  }
}

class MyButtonLoading extends StatelessWidget {
  const MyButtonLoading({
    super.key,
    this.btnColor = AppColors.primaryColorCyan,
  });

  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQueryValues(context).height * 0.065,
      width: double.infinity,
      decoration: BoxDecoration(
        color: btnColor,
        border: Border.all(
          color: AppColors.primaryColorCyan,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          9,
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.b_w_25,
        ),
      ),
    );
  }
}
