// ignore_for_file: unnecessary_null_comparison, unused_import

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../modal/stock_responce_modal.dart';
import '../services/api_service.dart';

class StocksearchController extends GetxController {
  var isLoading = false.obs;

  var sum = 0.0.obs;
  var costavg = 0.0.obs;
  var askingavg = 0.0.obs;

  Rx<StockResponseModel> stocklist = StockResponseModel().obs;

  Map<dynamic, dynamic> perameter = {};
  Map<String, dynamic> swipepera = {};

  @override
  void onInit() {
    super.onInit();
    stocksearch();
    swipeapi();
  }

  stocksearch() {
    isLoading.value = true;
    log("parameter:$perameter");
    Apiservice.stocksearch(perameter).then((responce) {
      if (responce != null) {
        stocklist.value = StockResponseModel.fromJson(responce);

        isLoading.value = false;
        stockcounter();
      }
    });
  }

  swipeapi() {
    isLoading.value = true;
    log("parameter:$swipepera");
    Apiservice.saveswipeoption(swipepera).then((responce) {
      if (responce != null) {
        stocklist.value = StockResponseModel.fromJson(responce);

        isLoading.value = false;
      }
    });
  }

  stockcounter() {
    isLoading.value = true;

    sum.value = 0.0;
    costavg.value = 0.0;
    askingavg.value = 0.0;
    var cost = 0.0;
    var asking = 0.0;
    if (stocklist.value != null) {
      stocklist.value.data?.forEach((element) {
        sum.value += double.tryParse(element.totalCarat.toString()) ?? 0;

        cost += double.tryParse(element.cost.toString()) ?? 0;
        costavg.value = (cost / sum.value);
        asking += double.tryParse(element.askingRate.toString()) ?? 0;
        askingavg.value = (asking / sum.value);
      });
    }

    isLoading.value = false;
  }
}
