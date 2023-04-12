import 'package:daimond_app/constants/app_colors.dart';
import 'package:daimond_app/widget/dynamic_text.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final double? height;
  final String? text;
  final int? itemCount;
  final double? borderRadius;
  final ScrollController? controller;
  const ListViewWidget(
      {super.key,
      this.height,
      this.text,
      this.itemCount,
      this.borderRadius,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              color: AppColors.color4455,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: DynamicText(
                  text: text,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
