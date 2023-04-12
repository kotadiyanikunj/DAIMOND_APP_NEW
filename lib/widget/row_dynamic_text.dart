import 'package:daimond_app/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowDynamicText extends StatelessWidget {
  const RowDynamicText({
    super.key,
    this.text,
    this.style,
    this.textAlign,
    this.title,
    this.style1,
    this.onTap,
  });

  final String? text;
  final String? title;
  final TextStyle? style;
  final TextStyle? style1;
  final TextAlign? textAlign;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text ?? "",
          textAlign: textAlign,
          style: style,
        ),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                title ?? "",
                textAlign: textAlign,
                style: style1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: SvgPicture.asset(AppImages.rightArrow),
              )
            ],
          ),
        ),
      ],
    );
  }
}
