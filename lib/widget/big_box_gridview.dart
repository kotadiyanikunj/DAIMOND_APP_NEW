import 'package:daimond_app/constants/app_colors.dart';
import 'package:daimond_app/widget/dynamic_text.dart';
import 'package:flutter/material.dart';

class BigBoxGridview extends StatelessWidget {
  final int? itemCount;
  final double? containerHeight;
  final double? containerWidth;
  final double? containerRadius;
  final double? imageRadius;
  final String title;
  final String des;
  final String image;

  const BigBoxGridview(
      {super.key,
      this.itemCount,
      this.containerHeight,
      this.containerWidth,
      this.containerRadius,
      this.imageRadius,
      required this.title,
      required this.des,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(containerRadius ?? 0),
                  color: AppColors.color4455,
                ),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 7, left: 8, right: 8),
                      child: Container(
                        height: 120,
                        width: 169,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(containerRadius ?? 0),
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.brown,
                        ),
                      )),
                  DynamicText(
                    text: title,
                    style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.colorffff,
                        fontWeight: FontWeight.w500),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5, top: 7),
                    child: Divider(
                      height: 1,
                      color: AppColors.color8296,
                    ),
                  ),
                  DynamicText(
                    text: des,
                    style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.colorffff,
                        fontWeight: FontWeight.w500),
                  )
                ])),
          )
        ]);
      },
    ); /* GridView.builder(
        //physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount ?? 0,
          mainAxisExtent: mainAxisExtent,
          childAspectRatio: childAspectRatio ?? 0,
          crossAxisSpacing: crossAxisSpacing ?? 0,
          mainAxisSpacing: mainAxisSpacing ?? 0,
        ),
        itemCount: itemCount,
        itemBuilder: (BuildContext ctx, index) {
          return Row(
            children: [
              Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(containerRadius ?? 0),
                  color: AppColors.color4455,
                ),
                /*  child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 7),
                      child: Container(
                        height: 132,
                        width: 169,
                        color: Colors.brown,
                      )),
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
                ]), */
              ),
            ],
          );
        }); */
  }
}
