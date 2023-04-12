// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';

// import 'package:daimond_app/controller/get_argument_cantroller.dart';
import 'package:daimond_app/screens/filter_screen/filter_screen.dart';
import 'package:daimond_app/screens/full_view_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../constants/string_const.dart';
import '../modal/stock_responce_modal.dart';
import '../utils/padding_widget.dart';
import '../widget/dynamic_text.dart';
import 'dashboard_screen.dart';

class FulldetailsScreen extends StatefulWidget {
  @override
  State<FulldetailsScreen> createState() => _FulldetailsScreenState();
}

class _FulldetailsScreenState extends State<FulldetailsScreen> {
  bool isactive = false;
  Data? argumentsdata;
  List? stonedata;
  // GetArgumentCantroller getargumentscantroller = GetArgumentCantroller();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() {
    argumentsdata = Get.arguments;
    stonedata = [
      argumentsdata?.totalCarat,
      argumentsdata?.color,
      argumentsdata?.clarity,
      argumentsdata?.shape,
      argumentsdata?.cut,
      argumentsdata?.polish,
      argumentsdata?.symmetry,
      argumentsdata?.depthPct,
      argumentsdata?.tablePct,
      argumentsdata?.mesurement,
      argumentsdata?.ratio,
      argumentsdata?.lab,
      argumentsdata?.country,
    ];
  }

  Future<bool> goback() {
    Get.off(FilterResultScreen());
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: goback,
      child: Scaffold(
        backgroundColor: AppColors.color202b,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.036),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpacing(height * 0.050),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.off(FilterResultScreen());
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: SvgPicture.asset(AppImages.leftArrow),
                            ))),
                    horizontalSpacing(22),
                    Center(
                      child: DynamicText(
                        text: "${argumentsdata?.refno}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isactive = !isactive;
                            if (isactive) {
                            } else {}
                          });
                        },
                        icon: isactive
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ))
                  ],
                ),
                verticalSpacing(height * 0.028),
                Container(
                  child: Container(
                    height: height * 0.30,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.filterimage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                verticalSpacing(height * 0.025),
                Row(
                  children: [
                    horizontalSpacing(width * 0.22),
                    InkWell(
                      onTap: () {
                        Get.to(FullimageScreen(),
                            arguments: argumentsdata?.refno);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(AppImages.rectangle),
                          SvgPicture.asset(AppImages.imagei)
                        ],
                      ),
                    ),
                    horizontalSpacing(width * 0.06),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(AppImages.rectangle),
                        SvgPicture.asset(AppImages.video)
                      ],
                    ),
                    horizontalSpacing(width * 0.06),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(AppImages.rectangle),
                        SvgPicture.asset(AppImages.preview)
                      ],
                    )
                  ],
                ),
                verticalSpacing(height * 0.025),
                Container(
                  height: height * 0.13,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.color4455,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            verticalSpacing(height * 0.035),
                            DynamicText(
                              text: "------",
                              style: TextStyle(fontSize: 17),
                            ),
                            DynamicText(
                              text: "Total Price",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        // color: Colors.brown,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.020),
                        child: VerticalDivider(width: 1.0),
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            verticalSpacing(height * 0.035),
                            DynamicText(
                              text: "-------",
                              style: TextStyle(fontSize: 17),
                            ),
                            DynamicText(
                              text: "Total Price",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        // color: Colors.brown,
                      )),
                    ],
                  ),
                ),
                verticalSpacing(height * 0.025),
                Container(
                  alignment: Alignment.centerLeft,
                  child: DynamicText(
                    text: Strconst.stonedetails,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: height * 0.6,
                  width: width,
                  child: ListView.builder(
                    itemCount: Strconst.stonelist.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Table(
                        columnWidths: const {
                          0: FlexColumnWidth(5),
                          1: FlexColumnWidth(0.7),
                          2: FlexColumnWidth(5),
                        },
                        children: [
                          TableRow(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: height * 0.037,
                              child: DynamicText(
                                text: Strconst.stonelist[index],
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            DynamicText(
                              text: ":",
                            ),
                            Container(
                              height: height * 0.034,
                              alignment: Alignment.centerLeft,
                              child: DynamicText(
                                text: "${stonedata?[index]}",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ]),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
