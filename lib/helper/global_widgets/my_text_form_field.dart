import 'package:flutter/material.dart';
import 'package:weather_app/resources/media_query_values.dart';
import '../../resources/colors_manager.dart';
import 'MyResponsiveText.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.hintText,
    required this.label,
    required this.textEditingController,
    required this.textInputType,
  });

  final TextEditingController textEditingController;
  final String label;
  final String hintText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: MediaQueryValues(context).height * 0.064,
        width: double.infinity,
        child: TextFormField(
          controller: textEditingController,
          cursorColor: AppColors.b_w_50,
          keyboardType: textInputType,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            suffix: SizedBox(
              height: MediaQueryValues(context).height * 0.025,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.myGrey, // Grey when not focused
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.primaryColorCyan, // Cyan when focused
                width: 2.0,
              ),
            ),
            label: FittedBox(
              fit: BoxFit.scaleDown,
              child: MyResponsiveText(
                text: label,
                style: const TextStyle(
                  color: AppColors.b_w_200,
                ),
                minFontSize: 4,
              ),
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
