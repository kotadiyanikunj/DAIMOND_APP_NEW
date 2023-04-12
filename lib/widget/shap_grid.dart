import 'package:daimond_app/utils/padding_widget.dart';
import 'package:daimond_app/widget/dynamic_text.dart';
import 'package:flutter/material.dart';

class Shapgrid extends StatelessWidget {
  final String? image;
  final String? text;
  const Shapgrid({super.key, this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(image ?? ''),
        const Spacer(),
        horizontalSpacing(22),
        Center(
          child: DynamicText(
            text: text,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 11),
          ),
        ),
        const Spacer(),
        // DynamicText(
        //   text: text,
        //   style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
        // ),
      ],
    );
  }
}
