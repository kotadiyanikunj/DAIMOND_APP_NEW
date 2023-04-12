import 'package:daimond_app/utils/padding_widget.dart';
import 'package:daimond_app/widget/dynamic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
  final String? image;
  final String? text;
  final void Function()? onTap;
  const AppBarWidget({super.key, this.image, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: onTap,
            child: Container(
                height: 30,
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(image ?? ''),
                ))),
        horizontalSpacing(22),
        Center(
          child: DynamicText(
            text: text,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
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
