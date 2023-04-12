import 'package:flutter/material.dart';

class DynamicText extends StatelessWidget {
  const DynamicText({
    super.key,
    this.text,
    this.style,
    this.textAlign,
  });

  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      style: style,
    );
  }
}
