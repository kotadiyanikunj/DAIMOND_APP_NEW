// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, null_argument_to_non_null_type, sized_box_for_whitespace

import 'package:daimond_app/constants/app_colors.dart';
import 'package:daimond_app/constants/app_images.dart';
import 'package:daimond_app/constants/string_const.dart';
import 'package:daimond_app/controller/filter_cantroller.dart';
import 'package:daimond_app/controller/saveswipe_cantroller.dart';
import 'package:daimond_app/controller/sharprefs_cantroller.dart';
import 'package:daimond_app/modal/stock_responce_modal.dart';
import 'package:daimond_app/screens/full_details_screen.dart';
import 'package:daimond_app/utils/padding_widget.dart';
import 'package:daimond_app/widget/dynamic_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/stock_search_cantroller.dart';
import '../bottom_navigation/bottom_navigation.dart';

class FilterResultScreen extends StatefulWidget {
  @override
  State<FilterResultScreen> createState() => _FilterResultScreenState();
}

class _FilterResultScreenState extends State<FilterResultScreen> {
  int gried = 0;
  bool isactive = true;
  final filterController = Get.put(FilterCanttroller());
  final stockController = Get.put(StocksearchController());
  final usercantroller = Get.put(SharprefsCantroller());
  final swipeoptioncantroller = Get.put(SaveswipeCantroller());

  Future<bool> goback() {
    Get.off(bottom_nev());
    return Future.value();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // stockController.stockcounter();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: goback,
        child: Scaffold(
          backgroundColor: AppColors.color202b,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.036),
            child: Column(
              children: [
                verticalSpacing(height * 0.065),
                //// Appbar widget
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          filterController.reset();
                          Get.off(bottom_nev());
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
                        text: Strconst.filterResult,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                    const Spacer(),
                    DynamicText(
                      text: "Excel",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: height * 0.0408,
                        width: width * 0.0096,
                        color: AppColors.color4455,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isactive = !isactive;
                            if (isactive) {
                            } else {}
                          });
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: isactive
                                  ? SvgPicture.asset(AppImages.squareMenuImg)
                                  : SvgPicture.asset(
                                      AppImages.squaremenu,
                                    ),
                            )))
                  ],
                ),
                verticalSpacing(height * 0.028),
                ///// Body
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DottedBorderWidgetFilterScreenComponant(
                      height: height * 0.0489,
                      width: width * 0.206,
                      title: Strconst.chart,
                    ),
                    DottedBorderWidgetFilterScreenComponant(
                      height: height * 0.0489,
                      width: width * 0.206,
                      title: Strconst.action,
                    ),
                    DottedBorderWidgetFilterScreenComponant(
                      height: height * 0.0489,
                      width: width * 0.206,
                      title: Strconst.imgView,
                    ),
                    DottedBorderWidgetFilterScreenComponant(
                      height: height * 0.0489,
                      width: width * 0.206,
                      title: Strconst.excel,
                    ),
                  ],
                ),
                verticalSpacing(height * 0.021),
                Obx(
                  () => usercantroller.userlist.value.data?.user?.userType ==
                          "admin"
                      ? Container(
                          height: height * 0.119,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.color8296),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.085,
                                width: width * 0.180,
                                margin:
                                    EdgeInsets.only(left: Get.width * 0.025),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.color4455,
                                      AppColors.color1922,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "LOT/CRT",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 10),
                                    ),
                                    SizedBox(
                                      width: width * 0.211,
                                      child: const Divider(
                                        thickness: 2,
                                        color: AppColors.color8296,
                                      ),
                                    ),
                                    Text(
                                      "${stockController.stocklist.value.data?.length}/${stockController.sum.value.toStringAsFixed(2)}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.085,
                                width: width * 0.180,
                                margin:
                                    EdgeInsets.only(left: Get.width * 0.024),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.color4455,
                                      AppColors.color1922,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "COST AVG",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 10),
                                    ),
                                    SizedBox(
                                      width: width * 0.211,
                                      child: const Divider(
                                        thickness: 2,
                                        color: AppColors.color8296,
                                      ),
                                    ),
                                    Text(
                                      "${stockController.costavg.floor()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.092,
                                width: width * 0.180,
                                margin:
                                    EdgeInsets.only(left: Get.width * 0.024),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.color4455,
                                      AppColors.color1922,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ASKING AVG",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 10),
                                    ),
                                    SizedBox(
                                      width: width * 0.211,
                                      child: const Divider(
                                        thickness: 2,
                                        color: AppColors.color8296,
                                      ),
                                    ),
                                    Text(
                                      "${stockController.askingavg.value.floor()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.092,
                                width: width * 0.180,
                                margin:
                                    EdgeInsets.only(left: Get.width * 0.024),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.color4455,
                                      AppColors.color1922,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "GIVE OFFER",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 10),
                                    ),
                                    SizedBox(
                                      width: width * 0.211,
                                      child: const Divider(
                                        thickness: 2,
                                        color: AppColors.color8296,
                                      ),
                                    ),
                                    Text(
                                      "----",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              horizontalSpacing(width * 0.030),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(AppImages.forvard),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: height * 0.119,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.color8296),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.085,
                                width: width * 0.230,
                                margin:
                                    EdgeInsets.only(left: Get.width * 0.025),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.color4455,
                                      AppColors.color1922,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "LOT/CRT",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: width * 0.211,
                                      child: const Divider(
                                        thickness: 2,
                                        color: AppColors.color8296,
                                      ),
                                    ),
                                    Text(
                                      "5/34.44",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.092,
                                width: width * 0.230,
                                margin:
                                    EdgeInsets.only(left: Get.width * 0.025),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.color4455,
                                      AppColors.color1922,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "LOT/CRT",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: width * 0.211,
                                      child: const Divider(
                                        thickness: 2,
                                        color: AppColors.color8296,
                                      ),
                                    ),
                                    Text(
                                      "5/34.44",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.092,
                                width: width * 0.230,
                                margin:
                                    EdgeInsets.only(left: Get.width * 0.025),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.color4455,
                                      AppColors.color1922,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "LOT/CRT",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: width * 0.211,
                                      child: const Divider(
                                        thickness: 2,
                                        color: AppColors.color8296,
                                      ),
                                    ),
                                    Text(
                                      "5/34.44",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              horizontalSpacing(width * 0.050),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(AppImages.forvard),
                              ),
                            ],
                          ),
                        ),
                ),

                Obx(
                  () => isactive
                      ? Expanded(
                          child: usercantroller
                                      .userlist.value.data?.user?.userType ==
                                  "admin"
                              ? adminlistdittails(height, width,
                                  stockController, swipeoptioncantroller)
                              : listdittails(height, width, stockController,
                                  swipeoptioncantroller),
                        )
                      : Expanded(
                          child: griedlistdittails(height, width,
                              stockController, swipeoptioncantroller)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  adminlistdittails(
    height,
    width,
    StocksearchController stockController,
    SaveswipeCantroller swipeoptioncantroller,
  ) {
    return Obx(
      () {
        if (stockController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: stockController.stocklist.value.data?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.010,
              ),
              child: Slidable(
                enabled: true,
                endActionPane: ActionPane(
                    motion: BehindMotion(),
                    extentRatio: 0.60,
                    children: [
                      SlidableAction(
                        backgroundColor: AppColors.color0000,
                        foregroundColor: Colors.white,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.REMAINDER
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "    Add\nReminder",
                        padding: EdgeInsets.all(0.1),
                      ),
                      SlidableAction(
                        backgroundColor: AppColors.colora100,
                        foregroundColor: Colors.white,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;

                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.FEATURES
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "\t\t\tAdd\nFeature",
                        padding: EdgeInsets.all(0.1),
                      ),
                    ]),
                startActionPane: ActionPane(
                    motion: BehindMotion(),
                    extentRatio: 0.60,
                    children: [
                      SlidableAction(
                        backgroundColor: AppColors.color0000,
                        foregroundColor: Colors.white,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.ENQUIRY
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "  Add\nEnquiry",
                      ),
                      SlidableAction(
                        backgroundColor: AppColors.colora100,
                        foregroundColor: Colors.white,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.RECOMANDED
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "\t\t\t\t\t\t\tAdd\nRecommended",
                        padding: EdgeInsets.all(0.1),
                      ),
                    ]),
                child: InkWell(
                  onTap: () {
                    Data data;
                    // var finaldata = <Data>[];
                    data = stockController.stocklist.value.data![index];

                    // stockController.stockindexditails(data, index);

                    Get.off(FulldetailsScreen(), arguments: data);
                  },
                  child: Container(
                    // height: height * 0.23,
                    // width: width,
                    decoration: BoxDecoration(
                        color: Color(0xfff3C4455),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          // height: height,
                          width: width * 0.35,
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.015,
                              vertical: height * 0.010),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppImages.filterimage,
                              fit: BoxFit.fill,
                              height: height * 0.20,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.016,
                                vertical: height * 0.010),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      DynamicText(
                                          text:
                                              "${stockController.stocklist.value.data?[index].refno ?? 0}",
                                          style: TextStyle(fontSize: 10)),
                                      DynamicText(
                                        text:
                                            "${stockController.stocklist.value.data?[index].type ?? 0} ${stockController.stocklist.value.data?[index].certificateNo ?? 0} / ${stockController.stocklist.value.data?[index].refno ?? 0} /${stockController.stocklist.value.data?[index].pcs ?? 0} ",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpacing(height * 0.003),
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Expanded(
                                      child: DynamicText(
                                        text:
                                            "${stockController.stocklist.value.data?[index].totalCarat.toStringAsFixed(2) ?? 0}\t ${stockController.stocklist.value.data?[index].colorName ?? 0}",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpacing(height * 0.003),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: DynamicText(
                                    text:
                                        "${stockController.stocklist.value.data?[index].line2 ?? 0}",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                verticalSpacing(height * 0.003),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DynamicText(
                                      text:
                                          "${stockController.stocklist.value.data?[index].line3 ?? 0}",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Image.asset(AppImages.star),
                                  ],
                                ),
                                verticalSpacing(height * 0.003),
                                Table(
                                  border: TableBorder.all(
                                      width: 1.0,
                                      color: AppColors.color8296,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5))),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    // ignore: prefer_const_literals_to_create_immutables
                                    TableRow(children: [
                                      Container(
                                        height: height * 0.034,
                                        alignment: Alignment.center,
                                        child: DynamicText(
                                          text: "Cost",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      Container(
                                        height: height * 0.034,
                                        alignment: Alignment.center,
                                        child: DynamicText(
                                          text: "Asking",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      Container(
                                        height: height * 0.034,
                                        alignment: Alignment.center,
                                        child: DynamicText(
                                          text: "Give Limit",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: height * 0.037,
                                        child: DynamicText(
                                          text:
                                              "${stockController.stocklist.value.data?[index].cost}",
                                          style: TextStyle(fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: height * 0.034,
                                        child: DynamicText(
                                          text:
                                              "${stockController.stocklist.value.data?[index].askingRate ?? 0}",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: height * 0.034,
                                        child: Center(
                                            child: DynamicText(
                                          text:
                                              "${stockController.stocklist.value.data?[index].limite ?? 0}",
                                          style: TextStyle(fontSize: 10),
                                        )),
                                      ),
                                    ]),
                                  ],
                                ),
                                Container(
                                  height: height * 0.034,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                      border: Border.all(
                                        // width: 0.5,
                                        color: Color(0xff788296),
                                      )),
                                  child: TextField(
                                    cursorHeight: height * 0.032,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            // vertical: height * 0.015,
                                            left: width * 0.03),
                                        suffixIcon: Image.asset(
                                          AppImages.forvard,
                                        ),
                                        hintText: "Comment",
                                        isDense: true,
                                        hintStyle: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.colorafaf)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  listdittails(
    height,
    width,
    StocksearchController stockController,
    SaveswipeCantroller swipeoptioncantroller,
  ) {
    return Obx(
      () {
        if (stockController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: stockController.stocklist.value.data?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.010,
              ),
              child: Slidable(
                enabled: true,
                endActionPane: ActionPane(
                    motion: BehindMotion(),
                    extentRatio: 0.60,
                    children: [
                      SlidableAction(
                        backgroundColor: AppColors.color0000,
                        foregroundColor: Colors.white,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.REMAINDER
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "    Add\nReminder",
                        padding: EdgeInsets.all(0.1),
                      ),
                      SlidableAction(
                        backgroundColor: AppColors.colora100,
                        foregroundColor: Colors.white,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.FEATURES
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "\t\t\tAdd\nFeature",
                        padding: EdgeInsets.all(0.1),
                      ),
                    ]),
                startActionPane: ActionPane(
                    motion: BehindMotion(),
                    extentRatio: 0.60,
                    children: [
                      SlidableAction(
                        backgroundColor: AppColors.color0000,
                        foregroundColor: Colors.white,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.ENQUIRY
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "  Add\nEnquiry",
                      ),
                      SlidableAction(
                        backgroundColor: AppColors.colora100,
                        foregroundColor: Colors.white,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.RECOMANDED
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "\t\t\t\t\t\t\tAdd\nRecommended",
                        padding: EdgeInsets.all(0.1),
                      ),
                    ]),
                child: InkWell(
                  onTap: () {
                    Data data;
                    // var finaldata = <Data>[];
                    data = stockController.stocklist.value.data![index];

                    // stockController.stockindexditails(data, index);

                    Get.off(FulldetailsScreen(), arguments: data);
                  },
                  child: Container(
                    height: height * 0.27,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color(0xfff3C4455),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          height: height,
                          width: width * 0.35,
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.015,
                              vertical: height * 0.010),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppImages.filterimage,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.016,
                                vertical: height * 0.010),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      DynamicText(
                                          text:
                                              "${stockController.stocklist.value.data?[index].refno ?? 0}",
                                          style: TextStyle(fontSize: 10)),
                                      DynamicText(
                                        text:
                                            "${stockController.stocklist.value.data?[index].type ?? 0} ${stockController.stocklist.value.data?[index].certificateNo ?? 0} / ${stockController.stocklist.value.data?[index].refno ?? 0} /${stockController.stocklist.value.data?[index].pcs ?? 0} ",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpacing(height * 0.010),
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Expanded(
                                      child: DynamicText(
                                        text:
                                            "${stockController.stocklist.value.data?[index].totalCarat.toStringAsFixed(2) ?? 0}\t ${stockController.stocklist.value.data?[index].colorName ?? 0}",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpacing(height * 0.010),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: DynamicText(
                                    text:
                                        "${stockController.stocklist.value.data?[index].line2 ?? 0}",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                verticalSpacing(height * 0.010),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DynamicText(
                                      text:
                                          "${stockController.stocklist.value.data?[index].line3 ?? 0}",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Image.asset(AppImages.star),
                                  ],
                                ),
                                verticalSpacing(height * 0.010),
                                Table(
                                  border: TableBorder.all(
                                      width: 1.0,
                                      color: AppColors.color8296,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5))),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    // ignore: prefer_const_literals_to_create_immutables
                                    TableRow(children: [
                                      Container(
                                        height: height * 0.034,
                                        alignment: Alignment.center,
                                        child: DynamicText(
                                          text: "Asking",
                                        ),
                                      ),
                                      Center(
                                          child:
                                              DynamicText(text: "Give Limit")),
                                    ]),
                                    TableRow(children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: height * 0.034,
                                        child: DynamicText(
                                          text:
                                              "${stockController.stocklist.value.data?[index].askingRate ?? 0}",
                                        ),
                                      ),
                                      Center(
                                          child: DynamicText(
                                              text:
                                                  "${stockController.stocklist.value.data?[index].limite ?? 0}")),
                                    ]),
                                  ],
                                ),
                                Container(
                                  height: height * 0.034,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                      border: Border.all(
                                        // width: 0.5,
                                        color: Color(0xff788296),
                                      )),
                                  child: TextField(
                                    cursorHeight: height * 0.032,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            // vertical: height * 0.015,
                                            left: width * 0.03),
                                        suffixIcon: Image.asset(
                                          AppImages.forvard,
                                        ),
                                        hintText: "Comment",
                                        isDense: true,
                                        hintStyle: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.colorafaf)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  griedlistdittails(height, width, StocksearchController stockController,
      SaveswipeCantroller swipeoptioncantroller) {
    return Obx(
      () {
        if (stockController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: stockController.stocklist.value.data?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.010,
              ),
              child: Slidable(
                enabled: true,
                endActionPane: ActionPane(
                    motion: BehindMotion(),
                    extentRatio: 0.60,
                    children: [
                      SlidableAction(
                        backgroundColor: AppColors.color0000,
                        foregroundColor: Colors.white,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.REMAINDER
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "    Add\nReminder",
                        padding: EdgeInsets.all(0.1),
                      ),
                      SlidableAction(
                        backgroundColor: AppColors.colora100,
                        foregroundColor: Colors.white,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.FEATURES
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "\t\t\tAdd\nFeature",
                        padding: EdgeInsets.all(0.1),
                      ),
                    ]),
                startActionPane: ActionPane(
                    motion: BehindMotion(),
                    extentRatio: 0.60,
                    children: [
                      SlidableAction(
                        backgroundColor: AppColors.color0000,
                        foregroundColor: AppColors.colorffff,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.ENQUIRY
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "  Add\nEnquiry",
                      ),
                      SlidableAction(
                        backgroundColor: AppColors.colora100,
                        foregroundColor: AppColors.colorffff,
                        onPressed: (context) {
                          var ref = stockController
                              .stocklist.value.data![index].refno;
                          print("refno:$ref");
                          Map<String, dynamic> swipepera = {
                            "refno": ref,
                            "type": Strconst.RECOMANDED
                          };
                          swipeoptioncantroller.swipepera = swipepera;
                          swipeoptioncantroller.swipeapi();
                        },
                        label: "\t\t\t\t\t\t\tAdd\nRecommended",
                        padding: EdgeInsets.all(0.1),
                      ),
                    ]),
                child: InkWell(
                  onTap: () {
                    Data data;
                    // var finaldata = <Data>[];
                    data = stockController.stocklist.value.data![index];

                    // stockController.stockindexditails(data, index);

                    Get.off(FulldetailsScreen(), arguments: data);
                  },
                  child: Container(
                    // height: height * 0.09,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.030),
                    decoration: BoxDecoration(
                        color: AppColors.color4455,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          height: height * 0.09,
                          width: width * 0.13,
                          child: CircleAvatar(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                DynamicText(
                                  text:
                                      "${stockController.stocklist.value.data?[index].totalCarat.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                DynamicText(
                                  text: "CRT",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                        horizontalSpacing(width * 0.020),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    DynamicText(
                                        text:
                                            "${stockController.stocklist.value.data?[index].refno}  ",
                                        style: TextStyle(fontSize: 12)),
                                    Expanded(
                                      child: Text(
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        " ${stockController.stocklist.value.data?[index].lotno ?? 0}",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    DynamicText(
                                      text:
                                          "${stockController.stocklist.value.data?[index].cost ?? 0}/ct",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Expanded(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      "${stockController.stocklist.value.data?[index].line2 ?? 0}",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  DynamicText(
                                    text:
                                        "${stockController.stocklist.value.data?[index].askingRate ?? 0}/Amt",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DynamicText(
                                    text:
                                        "${stockController.stocklist.value.data?[index].line3 ?? 0}",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Image.asset(AppImages.star),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class DottedBorderWidgetFilterScreenComponant extends StatelessWidget {
  const DottedBorderWidgetFilterScreenComponant({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
  }) : super(key: key);

  final double height;
  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [8, 1],
      strokeWidth: 1.3,
      color: AppColors.color8296,
      child: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
