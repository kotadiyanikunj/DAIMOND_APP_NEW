import 'dart:convert';

import 'package:daimond_app/modal/loginresponcemodal.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharprefsCantroller extends GetxController {
  Rx<LoginResponseModel> userlist = LoginResponseModel().obs;

  @override
  void onInit() {
    super.onInit();
    getuser();
  }

  getuser() async {
    final prefs = await SharedPreferences.getInstance();
    var userdata = prefs.getString("signinResponse");
    userlist.value = LoginResponseModel.fromJson(jsonDecode(userdata!));
  }
}
