// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, unnecessary_string_interpolations, avoid_print, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unnecessary_brace_in_string_interps

import 'package:daimond_app/constants/app_colors.dart';
import 'package:daimond_app/constants/app_images.dart';
import 'package:daimond_app/screens/advance_search_screen.dart';
import 'package:daimond_app/screens/filter_screen/filter_screen.dart';
import 'package:daimond_app/widget/dynamic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../controller/filter_cantroller.dart';
import '../../controller/stock_search_cantroller.dart';
import '../../modal/List_modal/sqflite.dart';

class bottom_nev extends StatefulWidget {
  @override
  State<bottom_nev> createState() => _bottom_nevState();
}

class _bottom_nevState extends State<bottom_nev> {
  final page = <Widget>[
    AdvanceSearchScreen(),
  ];
  int index = 0;
  Map filteredData = {};
  Database? db;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DBHelper().createDatabase().then((value) {
      db = value;
    });
  }

  final filtercanttroller = Get.put(FilterCanttroller());
  final Stockcanttroller = Get.put(StocksearchController());

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.color202b,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment(3, 0.8),
                  colors: [
                    AppColors.color4455,
                    AppColors.color1922,
                  ])),
          child: Obx(
            () => FloatingActionButton(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              onPressed: () async {
                filtercanttroller.textfilddata();
                filtercanttroller.colorValue();
                filtercanttroller.clarityValue();
                filtercanttroller.labValue();
                filtercanttroller.overToneValue();
                filtercanttroller.intensityValue();
                filtercanttroller.refnovalue();
                filtercanttroller.fluoValue();
                filtercanttroller.cutValue();
                filtercanttroller.symmValue();
                filtercanttroller.polishValue();
                filtercanttroller.shpevalue();

                String q =
                    "insert into searchHistory(Filterdata)values('${filtercanttroller.selecteddata}')";
                int id = await db!.rawInsert(q);

                Get.to(FilterResultScreen());
                Stockcanttroller.perameter = filtercanttroller.selecteddata;
                Stockcanttroller.stocksearch();
              },
              child: filtercanttroller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.colorffff,
                      ),
                    )
                  : SvgPicture.asset(AppImages.searchIconb),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromARGB(255, 36, 42, 57),
          primaryColor: AppColors.color1922,
        ),
        child: BottomAppBar(
          color: AppColors.color1922,
          shape: CircularNotchedRectangle(),
          // notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        filtercanttroller.reset();
                      },
                      child: SvgPicture.asset(AppImages.reset)),
                  DynamicText(
                    text: "Reset",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.09),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.bookmatrk),
                    DynamicText(
                      text: "Add Demand",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  filtercanttroller.textfilddata();
                  filtercanttroller.colorValue();
                  filtercanttroller.clarityValue();
                  filtercanttroller.labValue();
                  filtercanttroller.overToneValue();
                  filtercanttroller.intensityValue();
                  filtercanttroller.refnovalue();
                  filtercanttroller.fluoValue();
                  filtercanttroller.cutValue();
                  filtercanttroller.symmValue();
                  filtercanttroller.polishValue();
                  filtercanttroller.shpevalue();

                  String q =
                      "insert into searchHistory(Filterdata)values('${filtercanttroller.selecteddata}')";
                  int id = await db!.rawInsert(q);

                  Get.to(FilterResultScreen());
                  Stockcanttroller.perameter = filtercanttroller.selecteddata;
                  Stockcanttroller.stocksearch();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.save),
                      DynamicText(
                        text: "Save & Search",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.savesearch),
                  DynamicText(
                    text: "Saved Search",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: page[index],
    );
  }
}
