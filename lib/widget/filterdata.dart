import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class filterDataComponantWidget extends StatelessWidget {
  const filterDataComponantWidget({
    Key? key,
    required this.title,
    this.isLoading,
  }) : super(key: key);

  final String title;

  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width * 0.217,
          height: height * 0.060,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.color4455,
            borderRadius: BorderRadius.circular(5),
          ),
          child: isLoading ?? false
              // ignore: prefer_const_constructors
              ? Center(
                  child: const CircularProgressIndicator(),
                )
              : Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
        ),
      ],
    );
  }
}
