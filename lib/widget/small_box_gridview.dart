import 'package:daimond_app/constants/app_colors.dart';

import 'package:daimond_app/widget/dynamic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallBoxGridview extends StatelessWidget {
  final int? crossAxisCount;
  final double? mainAxisExtent;
  final double? childAspectRatio;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final int? itemCount;
  final double? containerHeight;
  final double? containerWidth;
  final double? containerRadius;
  final List<Map<String, dynamic>>? svgPicture;
  final List<Map<String, dynamic>>? title;
  final List<Map<String, dynamic>>? des;

  const SmallBoxGridview(
      {super.key,
      this.crossAxisCount,
      this.mainAxisExtent,
      this.childAspectRatio,
      this.crossAxisSpacing,
      this.mainAxisSpacing,
      this.itemCount,
      this.containerHeight,
      this.containerWidth,
      this.containerRadius,
      this.svgPicture,
      this.title,
      this.des});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount ?? 0,
          mainAxisExtent: mainAxisExtent,
          childAspectRatio: childAspectRatio ?? 0,
          crossAxisSpacing: crossAxisSpacing ?? 0,
          mainAxisSpacing: mainAxisSpacing ?? 0,
        ),
        itemCount: itemCount,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(containerRadius ?? 0),
              color: AppColors.color4455,
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 7),
                child: CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: SvgPicture.asset(svgPicture?[index]["image"]),
                ),
              ),
              DynamicText(
                text: title?[index]['title'],
                style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.colorffff,
                    fontWeight: FontWeight.w500),
              ),
              DynamicText(
                text: des?[index]['des'],
                style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.colorffff,
                    fontWeight: FontWeight.w500),
              )
            ]),
          );
        });
  }
}
