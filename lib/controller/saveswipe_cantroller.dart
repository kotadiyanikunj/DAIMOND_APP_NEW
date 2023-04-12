import 'dart:developer';

import 'package:daimond_app/modal/saveswiperesponcemodal.dart';
import 'package:daimond_app/services/api_service.dart';
import 'package:get/get.dart';

class SaveswipeCantroller extends GetxController {
  var isLoading = false.obs;
  Rx<SaveSwipeResponceModal> saveoptionlist = SaveSwipeResponceModal().obs;

  Map<String, dynamic> swipepera = {};

  @override
  void onInit() {
    super.onInit();

    swipeapi();
  }

  swipeapi() {
    isLoading.value = true;
    log("parameter:$swipepera");
    Apiservice.saveswipeoption(swipepera).then((responce) {
      if (responce != null) {
        saveoptionlist.value = SaveSwipeResponceModal.fromJson(responce);
        print("saverepo:${saveoptionlist.value.data}");
        isLoading.value = false;
      }
    });
  }
}
