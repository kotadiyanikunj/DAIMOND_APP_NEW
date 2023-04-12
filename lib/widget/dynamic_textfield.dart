import 'package:daimond_app/constants/app_colors.dart';
import 'package:daimond_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class DynamicTextField extends StatelessWidget {
  const DynamicTextField({
    Key? key,
    this.hintText,
    this.obsecureText,
    this.textfieldHeight,
    this.textFieldWidth,
    this.hintTextStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.textEditingController,
    this.obscuringCharacter,
    this.focusNode,
  }) : super(key: key);

  final String? hintText, obscuringCharacter;
  final bool? obsecureText;
  final double? textfieldHeight, textFieldWidth;
  final TextStyle? hintTextStyle;
  final Widget? prefixIcon, suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder, focusedBorder;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.red,
        height: textfieldHeight ?? totalHeight * 0.0710,
        width: textFieldWidth ?? totalWidth * 0.851,
        child: TextField(
          focusNode: focusNode,
          controller: textEditingController,
          obscureText: obsecureText ?? false,
          obscuringCharacter: obscuringCharacter ?? '•',
          style:
              TextStyle(color: AppColors.colorffff, fontFamily: appFontFamily),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintTextStyle ??
                  TextStyle(
                      color: AppColors.colorffff, fontFamily: appFontFamily),
              contentPadding: contentPadding ??
                  EdgeInsets.only(
                      top: totalHeight * 0.028,
                      bottom: totalHeight * 0.028,
                      left: totalWidth * 0.0657),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: AppColors.color8296, width: 1)),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: AppColors.color8296, width: 1))),
        ));
  }
}
