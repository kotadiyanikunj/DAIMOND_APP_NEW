// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unnecessary_string_interpolations

import 'dart:convert';
import 'dart:developer';

import 'package:daimond_app/constants/app_colors.dart';
import 'package:daimond_app/constants/app_images.dart';
import 'package:daimond_app/constants/string_const.dart';
import 'package:daimond_app/controller/dashbord_cantroller.dart';
import 'package:daimond_app/controller/filter_cantroller.dart';
import 'package:daimond_app/controller/login_cantroller.dart';
import 'package:daimond_app/controller/stock_search_cantroller.dart';
import 'package:daimond_app/modal/sqf_responce_modal.dart';
import 'package:daimond_app/screens/bottom_navigation/bottom_navigation.dart';
import 'package:daimond_app/screens/full_details_screen.dart';
import 'package:daimond_app/screens/login_screen.dart';
import 'package:daimond_app/utils/padding_widget.dart';
import 'package:daimond_app/widget/dynamic_text.dart';
import 'package:daimond_app/widget/row_dynamic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:kf_drawer/kf_drawer.dart';

import '../modal/List_modal/sqflite.dart';
import 'filter_screen/filter_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final TextEditingController searchController = TextEditingController();
  final DashbordCantroller dashboardcanttroller = Get.put(DashbordCantroller());
  final LoggedInController logincantroller = Get.put(LoggedInController());
  final FilterCanttroller filterCanttroller = Get.put(FilterCanttroller());

  ScrollController listcontroller = ScrollController();
  bool closetop = false;
  var listlength = 8;
  bool isactive = false;
  Database? db;
  bool status = false;
  List<Map<String, Object?>> l = List.empty(growable: true);
  final Stockcanttroller = Get.put(StocksearchController());
  var getsearchData = <SqfResponceModal>[];

  getdata() async {
    db = await DBHelper().createDatabase();
    String qur = "select * from searchHistory ORDER BY ID LIMIT 5";

    List<Map<String, Object?>> x = await db!.rawQuery(qur);

    l.addAll(x);
    status = true;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.color202b,
              primaryColor: AppColors.color202b,
            ),
            child: BottomAppBar(
                color: Colors.white,
                shape: CircularNotchedRectangle(),
                notchMargin: 8.0,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  height: Get.height * 0.09,
                  // color: AppColors.color202b,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {}, child: Image.asset(AppImages.phone)),
                      InkWell(
                          onTap: () {}, child: Image.asset(AppImages.skype)),
                      InkWell(
                          onTap: () {}, child: Image.asset(AppImages.social)),
                      InkWell(onTap: () {}, child: Image.asset(AppImages.chat)),
                    ],
                  ),
                )),
          ),
          backgroundColor: AppColors.color202b,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.daimondImg),
                        alignment: Alignment.topRight)),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    verticalSpacing(height * 0.040),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              SideSheet.left(
                                  sheetColor: AppColors.color4455,
                                  body: Column(
                                    children: [
                                      verticalSpacing(height * 0.030),
                                      ListTile(
                                        leading: Icon(Icons.dashboard,
                                            color: AppColors.colorffff),
                                        title: Text("Dashboard",
                                            style: TextStyle(
                                                color: AppColors.colorffff)),
                                        trailing: Icon(
                                            Icons.arrow_forward_outlined,
                                            color: AppColors.colorffff),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.search,
                                            color: AppColors.colorffff),
                                        title: Text("Advance_search",
                                            style: TextStyle(
                                                color: AppColors.colorffff)),
                                        trailing: Icon(
                                            Icons.arrow_forward_outlined,
                                            color: AppColors.colorffff),
                                      ),
                                      verticalSpacing(height * 0.7),
                                      Container(
                                        color: AppColors.color202b,
                                        child: InkWell(
                                          onTap: () {},
                                          child: ListTile(
                                            title: Text("Sign OUT",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.colorffff)),
                                            trailing: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.login_outlined,
                                                  color: AppColors.colorffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  context: context);
                            },
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(AppImages.menu))),
                        DynamicText(
                          text: Strconst.dashboard,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 20,
                                  ),
                        ),
                        DynamicText(
                          text: "",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 16,
                                  ),
                        )
                      ],
                    ),
                    verticalSpacing(40),
                    TextFiledWidget(
                      contentHeight: height * 0.0231,
                      contentWidth: width * 0.072,
                      hintText: Strconst.enterReferNo,
                      textEditingController: filterCanttroller.refno.value,
                      suffixIcon: Padding(
                        padding:
                            EdgeInsets.only(right: width * 0.048, left: 42),
                        child: InkWell(
                          onTap: () {
                            filterCanttroller.refnovalue();
                          },
                          child: InkWell(
                            onTap: () {
                              Get.offAll(bottom_nev());
                            },
                            child: SvgPicture.asset(
                              AppImages.searchIcon,
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpacing(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              filterCanttroller.refno.value.clear();
                            },
                            child: SvgPicture.asset(AppImages.restart)),
                        // horizontalSpacing(30),
                        SvgPicture.asset(AppImages.voice),
                        // horizontalSpacing(30),
                        SvgPicture.asset(AppImages.scan),
                        // horizontalSpacing(30),
                        InkWell(
                            onTap: () {
                              filterCanttroller.reset();
                              Get.offAll(bottom_nev());
                            },
                            child: SvgPicture.asset(AppImages.search)),
                      ],
                    ),
                    verticalSpacing(16),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          DashboardDataComponantWidget(
                              OnTap: () {
                                // Get.defaultDialog(
                                //   backgroundColor:
                                //       AppColors.color202b,
                                //   title: "New Arrivals",
                                //   titleStyle: const TextStyle(
                                //       color: AppColors.colorffff),
                                //   middleText:
                                //       "New Arrivals  :-\t\t\t${dashboardcanttroller.dashboardlist.value.data?.counts?.arrival ?? 0}",
                                //   content: Column(
                                //     children: [
                                //       Container(),
                                //     ],
                                //   ),
                                // );
                              },
                              isLoading: dashboardcanttroller.isLoading.value,
                              img: AppImages.diamond,
                              title:
                                  "${dashboardcanttroller.dashboardlist.value.data?.counts?.arrival ?? 0}",
                              description: 'New Arrivals'),
                          DashboardDataComponantWidget(
                              isLoading: dashboardcanttroller.isLoading.value,
                              img: AppImages.watch,
                              title:
                                  '${dashboardcanttroller.dashboardlist.value.data?.counts?.remainder ?? 0}',
                              description: 'Reminder'),
                          DashboardDataComponantWidget(
                              isLoading: dashboardcanttroller.isLoading.value,
                              img: AppImages.thump,
                              title:
                                  '${dashboardcanttroller.dashboardlist.value.data?.counts?.recomanded ?? 0}',
                              description: 'Recommended'),
                          DashboardDataComponantWidget(
                              isLoading: dashboardcanttroller.isLoading.value,
                              img: AppImages.call,
                              title:
                                  '${dashboardcanttroller.dashboardlist.value.data?.counts?.enquiry ?? 0}',
                              description: 'Enquiry'),
                        ],
                      ),
                    ),
                    verticalSpacing(height * 0.0258),
                    RowDynamicText(
                      text: Strconst.featuredStones,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      onTap: () {
                        Get.offAll(FilterResultScreen());
                      },
                      title: Strconst.viewAll,
                      style1: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    verticalSpacing(height * 0.00816),
                    Obx(
                      () => SizedBox(
                        height: height * 0.300,
                        // width: width,
                        child: ListView.builder(
                          itemCount: dashboardcanttroller
                              .featuredstoneslist.value.data?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                onTap: () {
                                  Get.offAll(FulldetailsScreen());
                                },
                                child: Container(
                                  width: width * 0.40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.color4455,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: height * 0.1632,
                                        width: width * 0.355,
                                        margin: EdgeInsets.only(
                                            left: width * 0.0144,
                                            right: width * 0.0144,
                                            top: height * 0.00816,
                                            bottom: height * 0.01224),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                AppImages.yellowDaimond,
                                              ),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            left: width * 0.020),
                                        child: Text(
                                          "${dashboardcanttroller.featuredstoneslist.value.data?[index].totalCarat ?? 0} - ${dashboardcanttroller.featuredstoneslist.value.data?[index].colorName ?? 0}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(fontSize: 10),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Container(
                                          width: 147,
                                          height: 1,
                                          color: const Color(0xFF788296),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 1),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.020),
                                          child: Text(
                                            "${dashboardcanttroller.featuredstoneslist.value.data?[index].line2 ?? 0}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    verticalSpacing(height * 0.0258),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: DynamicText(
                        text: Strconst.history,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 15),
                      ),
                    ),
                    // verticalSpacing(6),
                    SizedBox(
                      height: height * 0.5,
                      child: status
                          ? (l.length > 0
                              ? ListView.builder(
                                  itemCount: l.length,
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: AppColors.color4455,
                                      child: ListTile(
                                        title: Text(
                                          "${l[index].toString().replaceAll("{", "").replaceAll("}", "")}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Center(
                                  child: DynamicText(
                                    text: "NO History",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ))
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class DashboardDataComponantWidget extends StatelessWidget {
  const DashboardDataComponantWidget({
    Key? key,
    required this.img,
    required this.title,
    required this.description,
    this.isLoading,
    this.OnTap,
  }) : super(key: key);
  final String img;
  final String title;
  final String description;
  final bool? isLoading;
  final void Function()? OnTap;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: OnTap,
      child: Container(
        // height: height * 0.121,
        width: width * 0.204,
        decoration: BoxDecoration(
          color: AppColors.color4455,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.0108,
            ),
            SvgPicture.asset(img),
            SizedBox(
              height: height * 0.0068,
            ),
            isLoading ?? false
                // ignore: prefer_const_constructors
                ? Center(
                    child: const CircularProgressIndicator(color: Colors.white),
                  )
                : Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
            Text(
              description,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),
            ),
            SizedBox(
              height: height * 0.00952,
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> svgImages = [
  {"image": AppImages.diamond, "title": "1217", "des": "New Arrivals"},
  {"image": AppImages.watch, "title": "0", "des": "Reminder"},
  {"image": AppImages.thump, "title": "29", "des": "Recommended"},
  {"image": AppImages.call, "title": "0", "des": "Enquiry"},
];
