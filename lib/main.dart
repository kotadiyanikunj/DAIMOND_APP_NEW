// ignore_for_file: deprecated_member_use

import 'package:daimond_app/constants/app_colors.dart';
import 'package:daimond_app/screens/login_screen.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                color: AppColors.colorffff,
                fontFamily: "SF Pro",
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              bodyText2: TextStyle(
                color: AppColors.colorffff,
                fontFamily: "SF Pro",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              headline1: TextStyle(
                color: AppColors.colorffff,
                fontFamily: "SF Pro",
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}
