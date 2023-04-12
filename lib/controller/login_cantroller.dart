// ignore_for_file: invalid_return_type_for_catch_error, avoid_print, prefer_const_constructors

import 'package:daimond_app/screens/dashboard_screen.dart';
import 'package:daimond_app/services/api_service.dart';
import 'package:daimond_app/services/shar_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../modal/loginresponcemodal.dart';

class LoggedInController extends GetxController {
  Rx<LoginResponseModel> loggedin = LoginResponseModel().obs;

  var isLoading = false.obs;
  var name = "".obs;

  loggedInList(Map<String, dynamic> data, BuildContext context) async {
    isLoading.value = true;
    Apiservice.loginAPI(data).then((response) {
      if (response != null) {
        loggedin.value = LoginResponseModel.fromJson(response);
        String strUser = loginResponseModelToJson(loggedin.value);
        Get.off(DashBoardScreen());
        isLoading.value = false;

        setUserResponse(strUser);
      }
    }).catchError((err) => print('error$err'));
  }
}
