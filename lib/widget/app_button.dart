import 'package:daimond_app/constants/app_colors.dart';
import 'package:daimond_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.buttonText,
    this.buttonHeight,
    this.buttonWidth,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.boxDecoration,
    this.onTap,
    this.elevation,
  }) : super(key: key);
  final String buttonText;
  final double? buttonHeight, buttonWidth, fontSize, elevation;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final BoxDecoration? boxDecoration;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: elevation ?? 8,
        color: AppColors.color4455,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: buttonHeight ?? height * 0.0710,
          width: buttonWidth ?? width * 0.3645,
          alignment: Alignment.center,
          decoration: boxDecoration ??
              BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomLeft,
                      colors: [AppColors.color4455, AppColors.color1922])),
          child: appText(
            text: buttonText,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize ?? 20,
            fontColor: fontColor ?? AppColors.colorffff,
          ),
        ),
      ),
    );
  }
}
