// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, unused_local_variable, avoid_unnecessary_containers, null_argument_to_non_null_type

import 'dart:collection';

import 'package:daimond_app/constants/app_colors.dart';
import 'package:daimond_app/constants/app_images.dart';
import 'package:daimond_app/controller/filter_cantroller.dart';
import 'package:daimond_app/screens/dashboard_screen.dart';
import 'package:daimond_app/utils/padding_widget.dart';
import 'package:daimond_app/widget/app_bar.dart';
import 'package:daimond_app/widget/dynamic_text.dart';
import 'package:daimond_app/widget/shap_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/string_const.dart';
import '../widget/row_dynamic_text.dart';

class AdvanceSearchScreen extends StatefulWidget {
  const AdvanceSearchScreen({super.key});

  @override
  State<AdvanceSearchScreen> createState() => _AdvanceSearchScreenState();
}

class _AdvanceSearchScreenState extends State<AdvanceSearchScreen> {
  final filtercanttroller = Get.put(FilterCanttroller());

  List ll = ["ddd", "20", "200", "30/40", "50", "888", "999", "2546"];
  String gvalue = Strconst.whitecolor;
  // List<Widget> page = [Whitecolor(), Fancycolor()];
  int pos = 0;
  bool isactive = false;

  HashSet select = HashSet();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void maultiselection(String value) {
    setState(() {
      if (select.contains(value)) {
        select.remove(value);
      } else {
        select.add(value);
      }
    });
  }

  void checkRadio(String value) {
    setState(() {
      gvalue = value;

      if (gvalue.isNotEmpty) {
        if (gvalue == Strconst.whitecolor) {
          // Whitecolor();
          filtercanttroller.reset();
        } else {
          // Fancycolor();
          filtercanttroller.reset();
        }
      }
    });
  }

  Future<bool> goback() {
    Get.off(DashBoardScreen());
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    // String whitecolor = "White Color";
    // String fancycolor = "Fancy Color";

    TextEditingController from = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: goback,
        child: Scaffold(
            backgroundColor: Color(0xfff1B202B),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    verticalSpacing(40),
                    AppBarWidget(
                      onTap: () {
                        Get.off(DashBoardScreen());
                      },
                      image: AppImages.leftArrow,
                      text: 'Advance Search',
                    ),
                    verticalSpacing(height * 0.0200),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: DynamicText(
                        text: Strconst.shape,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                            ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7,
                          crossAxisCount: 4,
                          childAspectRatio: 0.9),
                      itemCount: isactive ? 16 : 12,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            filtercanttroller
                                .shapeselection(Strconst.shaptext[index]);
                          },
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                  color: filtercanttroller.shap
                                          .contains(Strconst.shaptext[index])
                                      ? AppColors.color5c73
                                      : Color(0xfff3C4455).withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Shapgrid(
                                image: AppImages.shapeimage[index],
                                text: Strconst.shaptext[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    verticalSpacing(height * 0.0150),
                    RowDynamicText(
                      text: Strconst.cart,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      title: Strconst.viewAll,
                      onTap: () {
                        setState(() {
                          isactive = !isactive;
                          if (isactive) {}
                        });
                      },
                      style1: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2, color: AppColors.color8296))),
                            child: TextField(
                              cursorColor: AppColors.colorffff,
                              keyboardType: TextInputType.number,
                              controller: filtercanttroller.formdate.value,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    // bottom: height * 0.020,
                                    left: width * 0.020,
                                  ),
                                  hintText: "From",
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontSize: 12)),
                            ),
                          ),
                        ),
                        horizontalSpacing(width * 0.025),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2, color: AppColors.color8296))),
                            child: TextField(
                              cursorColor: Colors.white,
                              autofocus: false,
                              keyboardType: TextInputType.number,
                              controller: filtercanttroller.todate.value,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    // bottom: height * 0.020,
                                    left: width * 0.020,
                                  ),
                                  hintText: "To",
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontSize: 12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(height * 0.0150),
                    SizedBox(
                      height: height * 0.045,
                      child: ListView.builder(
                        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //   crossAxisCount: 1,
                        //   childAspectRatio: 0.9,
                        //   mainAxisSpacing: 4,
                        // ),
                        scrollDirection: Axis.horizontal,
                        itemCount: ll.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              maultiselection(ll[index]);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: width * 0.010),
                              decoration: BoxDecoration(
                                color: select.contains(ll[index])
                                    ? AppColors.color5c73
                                    : Color.fromARGB(255, 77, 87, 108)
                                        .withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: height * 0.030,
                                    vertical: width * 0.008),
                                child: Text(
                                  ll[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // verticalSpacing(height * 0.0150),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: DynamicText(
                            text: Strconst.color,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        horizontalSpacing(width * 0.11),
                        Radio(
                          activeColor: Colors.white,
                          value: Strconst.whitecolor,
                          groupValue: gvalue,
                          onChanged: (value) {
                            debugPrint("value ==> $value");
                            checkRadio(value as String);

                            if (gvalue == Strconst.whitecolor) {}
                          },
                        ),
                        DynamicText(
                          text: Strconst.whitecolor,
                        ),
                        Radio(
                          activeColor: Colors.white,
                          value: Strconst.fancycolor,
                          groupValue: gvalue,
                          onChanged: (value) {
                            checkRadio(value as String);
                          },
                        ),
                        DynamicText(
                          text: Strconst.fancycolor,
                        ),
                      ],
                    ),
                    gvalue != Strconst.fancycolor
                        ? whiteColor(
                            filtercanttroller,
                            height,
                            width,
                          )
                        : fancycolor(filtercanttroller, height, width)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

Widget whiteColor(
  FilterCanttroller filtercantroller,
  height,
  width,
) {
  return Obx(
    () {
      return Column(
        children: [
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              // gridDelegate: liverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 1,
              //   childAspectRatio: width / height,
              //   mainAxisSpacing: 4,
              //   // mainAxisExtent:
              // ),
              scrollDirection: Axis.horizontal,
              itemCount: filtercantroller.filterlist.value.data?.color != null
                  ? filtercantroller.filterlist.value.data!.color!.length + 1
                  : 0,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.lab.contains(index)
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height * 0.020,
                            vertical: width * 0.008),
                        child: DynamicText(
                          text: "All",
                        ),
                      ),
                    ),
                  );
                }
                index = index - 1;
                return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      filtercantroller.colorselection(filtercantroller
                          .filterlist.value.data?.color?[index].id);
                    },
                    child: Obx(
                      () => Container(
                        height: height * 0.060,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: width * 0.010),
                        decoration: BoxDecoration(
                          color: filtercantroller.color.contains(
                                  filtercantroller
                                      .filterlist.value.data?.color?[index].id)
                              ? AppColors.color5c73
                              : AppColors.color4455.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: height * 0.020,
                              vertical: width * 0.008),
                          child: Text(
                            "${filtercantroller.filterlist.value.data?.color![index].color ?? 0}",
                            style: TextStyle(color: Colors.white),
                            maxLines: 1,
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.lab,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1,
              //     mainAxisSpacing: 4,
              //     childAspectRatio: width / height),
              scrollDirection: Axis.horizontal,

              itemCount:
                  filtercantroller.filterlist.value.data?.labMaster?.length,
              itemBuilder: (context, index) {
                // debugPrint("index:$index");

                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.labselection(index);
                  },
                  child: Obx(
                    () => Container(
                      height: height * 0.060,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.lab.contains(index)
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height * 0.030,
                            vertical: width * 0.008),
                        child: Text(
                          "${filtercantroller.filterlist.value.data?.labMaster![index].name ?? 0}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.clarity,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1,
              //     mainAxisSpacing: 4,
              //     childAspectRatio: width / height),
              scrollDirection: Axis.horizontal,
              itemCount:
                  filtercantroller.filterlist.value.data?.clarityMaster!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.clarityselection(index);
                  },
                  child: Obx(
                    () => Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.cliarity.contains(index)
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height * 0.030,
                            vertical: width * 0.008),
                        child: Text(
                          "${filtercantroller.filterlist.value.data?.clarityMaster![index].name ?? 0}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.cut,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.cutselection(Strconst.cutt[index]);
                  },
                  child: Obx(
                    () => Container(
                      width: width * 0.225,
                      height: height * 0.060,
                      margin: EdgeInsets.only(right: width * 0.010),
                      decoration: BoxDecoration(
                        color:
                            filtercantroller.cut.contains(Strconst.cutt[index])
                                ? AppColors.color5c73
                                : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: Text(
                        "${Strconst.cutt[index]}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.polish,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.polishselection(Strconst.cutt[index]);
                  },
                  child: Obx(
                    () => Container(
                      width: width * 0.225,
                      height: height * 0.060,
                      margin: EdgeInsets.only(right: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.polish
                                .contains(Strconst.cutt[index])
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: Text(
                        "${Strconst.cutt[index]}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.symm,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.symmselection(Strconst.cutt[index]);
                  },
                  child: Obx(
                    () => Container(
                      width: width * 0.225,
                      height: height * 0.060,
                      margin: EdgeInsets.only(right: width * 0.010),
                      decoration: BoxDecoration(
                        color:
                            filtercantroller.symm.contains(Strconst.cutt[index])
                                ? AppColors.color5c73
                                : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: Text(
                        "${Strconst.cutt[index]}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.fluo,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            width: width,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.fluoselection(Strconst.fluoo[index]);
                  },
                  child: Obx(
                    () => Container(
                      width: width * 0.225,
                      height: height * 0.060,
                      margin: EdgeInsets.only(right: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.fluo
                                .contains(Strconst.fluoo[index])
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: Text(
                        "${Strconst.fluoo[index]}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0150),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DynamicText(
                text: Strconst.lenght,
              ),
              DynamicText(
                text: Strconst.width,
              ),
            ],
          ),
          verticalSpacing(height * 0.0150),
          Row(
            children: [
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    controller: filtercantroller.lfrom.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      border: InputBorder.none,
                      hintText: "From",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    onSubmitted: (value) {},
                    controller: filtercantroller.lto.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "To",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: filtercantroller.wfrom1.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "From",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    controller: filtercantroller.wto1.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "To",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
            ],
          ),
          verticalSpacing(height * 0.0150),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DynamicText(
                text: Strconst.height,
              ),
              DynamicText(
                text: Strconst.ratio,
              ),
            ],
          ),
          verticalSpacing(height * 0.0150),
          Row(
            children: [
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    controller: filtercantroller.hfrom.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "From",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    controller: filtercantroller.hto.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "To",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    controller: filtercantroller.rfrom1.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "From",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    controller: filtercantroller.rto1.value,
                    cursorColor: AppColors.colorffff,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "To",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
            ],
          ),
          verticalSpacing(height * 0.0150),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.cartno,
            ),
          ),
          verticalSpacing(height * 0.0150),
          SizedBox(
            height: height * 0.05,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: AppColors.color8296)),
              child: TextField(
                cursorColor: AppColors.colorffff,
                controller: filtercantroller.cartno.value,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      bottom: height * 0.020,
                      left: width * 0.020,
                    ),
                    hintText: Strconst.cartno,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ),
          verticalSpacing(height * 0.10),
        ],
      );
    },
  );
}

Widget fancycolor(FilterCanttroller filtercantroller, height, width) {
  return Obx(
    () {
      return Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.intensity,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1, mainAxisSpacing: 4, childAspectRatio: 0.6),
              scrollDirection: Axis.horizontal,
              itemCount:
                  filtercantroller.filterlist.value.data?.intensity!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.intensityselection(filtercantroller
                        .filterlist.value.data?.intensity?[index].id);
                  },
                  child: Obx(
                    () => Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.intensity.contains(
                                filtercantroller.filterlist.value.data
                                    ?.intensity?[index].id)
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height * 0.030,
                            vertical: width * 0.008),
                        child: Text(
                          "${filtercantroller.filterlist.value.data?.intensity?[index].intensity ?? 0}",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.overtone,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1,
              //     mainAxisSpacing: 4,
              //     childAspectRatio: width / height),
              scrollDirection: Axis.horizontal,
              itemCount:
                  filtercantroller.filterlist.value.data?.overtone!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.overtoneselection(filtercantroller
                        .filterlist.value.data?.overtone?[index].id);
                  },
                  child: Obx(
                    () => Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.overtone.contains(
                                filtercantroller
                                    .filterlist.value.data?.overtone?[index].id)
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height * 0.030,
                            vertical: width * 0.008),
                        child: Text(
                          "${filtercantroller.filterlist.value.data?.overtone?[index].overtone ?? 0}",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.color,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1,
              //     mainAxisSpacing: 4,
              //     childAspectRatio: width / height),
              scrollDirection: Axis.horizontal,
              itemCount: filtercantroller.filterlist.value.data?.color!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.colorselection(filtercantroller
                        .filterlist.value.data?.color?[index].id);
                  },
                  child: Obx(
                    () => Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.color.contains(filtercantroller
                                .filterlist.value.data?.color?[index].id)
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height * 0.030,
                            vertical: width * 0.008),
                        child: Text(
                          "${filtercantroller.filterlist.value.data?.color?[index].color ?? 0}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.lab,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  filtercantroller.filterlist.value.data?.labMaster!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.labselection(index);
                  },
                  child: Obx(
                    () => Container(
                      margin: EdgeInsets.only(left: width * 0.010),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: filtercantroller.lab.contains(index)
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height * 0.030,
                            vertical: width * 0.008),
                        child: Text(
                          "${filtercantroller.filterlist.value.data?.labMaster![index].name ?? 0}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.clarity,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1,
              //     mainAxisSpacing: 4,
              //     childAspectRatio: width / height),
              scrollDirection: Axis.horizontal,
              itemCount:
                  filtercantroller.filterlist.value.data?.clarityMaster!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.clarityselection(index);
                  },
                  child: Obx(
                    () => Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.cliarity.contains(index)
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height * 0.030,
                            vertical: width * 0.008),
                        child: Text(
                          "${filtercantroller.filterlist.value.data?.clarityMaster![index].name ?? 0}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.cut,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.cutselection(Strconst.cutt[index]);
                  },
                  child: Obx(
                    () => Container(
                      width: width * 0.225,
                      height: height * 0.060,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: width * 0.010),
                      decoration: BoxDecoration(
                        color:
                            filtercantroller.cut.contains(Strconst.cutt[index])
                                ? AppColors.color5c73
                                : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: Text(
                        "${Strconst.cutt[index]}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.polish,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.polishselection(Strconst.cutt[index]);
                  },
                  child: Obx(
                    () => Container(
                      width: width * 0.225,
                      height: height * 0.060,
                      margin: EdgeInsets.only(right: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.polish
                                .contains(Strconst.cutt[index])
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: Text(
                        "${Strconst.cutt[index]}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.symm,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.symmselection(Strconst.cutt[index]);
                  },
                  child: Obx(
                    () => Container(
                      width: width * 0.225,
                      height: height * 0.060,
                      margin: EdgeInsets.only(right: width * 0.010),
                      decoration: BoxDecoration(
                        color:
                            filtercantroller.symm.contains(Strconst.cutt[index])
                                ? AppColors.color5c73
                                : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: Text(
                        "${Strconst.cutt[index]}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0050),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.fluo,
            ),
          ),
          verticalSpacing(height * 0.0050),
          SizedBox(
            height: height * 0.045,
            width: width,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1,
              //     mainAxisSpacing: 8,
              //     childAspectRatio: width / height),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    filtercantroller.fluoselection(Strconst.fluoo[index]);
                  },
                  child: Obx(
                    () => Container(
                      width: width * 0.225,
                      height: height * 0.060,
                      margin: EdgeInsets.only(right: width * 0.010),
                      decoration: BoxDecoration(
                        color: filtercantroller.fluo
                                .contains(Strconst.fluoo[index])
                            ? AppColors.color5c73
                            : AppColors.color4455.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: Text(
                        "${Strconst.fluoo[index]}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpacing(height * 0.0150),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DynamicText(
                text: Strconst.lenght,
              ),
              DynamicText(
                text: Strconst.width,
              ),
            ],
          ),
          verticalSpacing(height * 0.0150),
          Row(
            children: [
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    controller: filtercantroller.lfrom.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      border: InputBorder.none,
                      hintText: "From",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    onSubmitted: (value) {},
                    controller: filtercantroller.lto.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "To",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: filtercantroller.wfrom1.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "From",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    controller: filtercantroller.wto1.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "To",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
            ],
          ),
          verticalSpacing(height * 0.0150),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DynamicText(
                text: Strconst.height,
              ),
              DynamicText(
                text: Strconst.ratio,
              ),
            ],
          ),
          verticalSpacing(height * 0.0150),
          Row(
            children: [
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    controller: filtercantroller.hfrom.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "From",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    controller: filtercantroller.hto.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "To",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    cursorColor: AppColors.colorffff,
                    controller: filtercantroller.rfrom1.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "From",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
              horizontalSpacing(width * 0.010),
              Flexible(
                  child: SizedBox(
                height: height * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColors.color8296)),
                  child: TextField(
                    controller: filtercantroller.rto1.value,
                    cursorColor: AppColors.colorffff,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: height * 0.020,
                        left: width * 0.020,
                      ),
                      hintText: "To",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              )),
            ],
          ),
          verticalSpacing(height * 0.0150),
          Container(
            alignment: Alignment.centerLeft,
            child: DynamicText(
              text: Strconst.cartno,
            ),
          ),
          verticalSpacing(height * 0.0150),
          SizedBox(
            height: height * 0.05,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: AppColors.color8296)),
              child: TextField(
                cursorColor: AppColors.colorffff,
                controller: filtercantroller.cartno.value,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      bottom: height * 0.020,
                      left: width * 0.020,
                    ),
                    hintText: Strconst.cartno,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ),
          verticalSpacing(height * 0.10),
        ],
      );
    },
  );
}
