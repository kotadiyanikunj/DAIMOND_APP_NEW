// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:daimond_app/constants/app_colors.dart';
import 'package:daimond_app/constants/app_constants.dart';
import 'package:daimond_app/constants/app_images.dart';
import 'package:daimond_app/constants/string_const.dart';
import 'package:daimond_app/controller/login_cantroller.dart';
import 'package:daimond_app/screens/dashboard_screen.dart';
import 'package:daimond_app/services/api_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController userNmCntrl = TextEditingController();
  final TextEditingController passwordCntrl = TextEditingController();
  LoggedInController loggedInController = LoggedInController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final Apiservice _apiService = Apiservice();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.color202b,
        body: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: SizedBox(
                height: height * 0.450,
                child: Image.asset(AppImages.daimondImg),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.048),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(height: height * 0.250),
                    Text(
                      Strconst.login.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 30, letterSpacing: width * 0.068),
                    ),
                    verticalSpace(height: height * 0.16576),
                    TextFiledWidget(
                      textEditingController: userNmCntrl,
                      contentHeight: height * 0.028,
                      contentWidth: width * 0.0657,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            right: width * 0.042, left: width * 0.058),
                        child: Image.asset(
                          AppImages.person,
                          height: height * 0.0214,
                          width: width * 0.0450,
                        ),
                      ),
                      hintText: Strconst.username,
                    ),
                    verticalSpace(height: height * 0.0237),
                    TextFiledWidget(
                      textEditingController: passwordCntrl,
                      contentHeight: height * 0.028,
                      contentWidth: width * 0.0657,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            right: width * 0.042, left: width * 0.058),
                        child: Image.asset(
                          AppImages.lock,
                          height: height * 0.0214,
                          width: width * 0.0450,
                        ),
                      ),
                      hintText: Strconst.password,
                    ),
                    verticalSpace(height: height * 0.1481),
                    Obx(
                      () => AppButtonWidget(
                        isLoading: loggedInController.isLoading.value,
                        width: width * 0.36,
                        height: height * 0.082,
                        onTap: () {
                          /*  loggedInController.isLoading.value = true;
                          Future.delayed(Duration(seconds: 3), () {
                            loggedInController.isLoading.value = false;
                          }); */
                          String user = userNmCntrl.text;
                          String password = passwordCntrl.text;
                          if (user.isEmpty && password.isEmpty) {
                            Get.snackbar(
                              "enter velid emil and password",
                              "enter velid emil and password",
                              colorText: AppColors.colorffff,
                              icon: Icon(Icons.person, color: Colors.white),
                              snackPosition: SnackPosition.TOP,
                            );
                          } else {
                            Map<String, dynamic> data = {
                              'username': user,
                              'password': password,
                            };

                            // _apiService.login(context, data);
                            loggedInController.loggedInList(data, context);
                          }
                        },
                        btnName: Strconst.login,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.btnName,
    this.isLoading,
    this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final void Function()? onTap;
  final String btnName;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFf3C4455),
            Color(0xFF151922),
          ],
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: isLoading ?? false
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : Text(
                      btnName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 20),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFiledWidget extends StatelessWidget {
  const TextFiledWidget({
    Key? key,
    required this.contentHeight,
    required this.contentWidth,
    this.prefixIcon,
    required this.hintText,
    required this.textEditingController,
    this.suffixIcon,
    this.searchfocus,
  }) : super(key: key);

  final double contentHeight;
  final double contentWidth;
  final Widget? prefixIcon;
  final String hintText;
  final TextEditingController textEditingController;
  final Widget? suffixIcon;
  final FocusNode? searchfocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      cursorColor: Colors.white,
      focusNode: searchfocus,
      controller: textEditingController,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle:
            Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
        contentPadding: EdgeInsets.only(
            top: contentHeight, bottom: contentHeight, left: contentWidth),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: AppColors.color8296, width: 1)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: AppColors.color8296, width: 1),
        ),
      ),
    );
  }
}
