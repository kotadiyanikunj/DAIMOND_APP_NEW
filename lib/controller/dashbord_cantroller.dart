import 'package:daimond_app/modal/dashboardresponcemodal.dart';
import 'package:daimond_app/services/api_service.dart';
import 'package:get/get.dart';

import '../modal/featuredstonesresponcemodal.dart';

class DashbordCantroller extends GetxController {
  Rx<DashboardResponseModel> dashboardlist = DashboardResponseModel().obs;
  Rx<FeaturedstonesResponseModel> featuredstoneslist =
      FeaturedstonesResponseModel().obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    dashbordApi();
    featuredstones();
  }

  dashbordApi() {
    isLoading.value = true;
    Apiservice.dashboard().then(
      (response) {
       
        if (response != null) {
          dashboardlist.value = DashboardResponseModel.fromJson(response);
          isLoading.value = false;
        }
      },
    );
  }

  featuredstones() {
    isLoading.value = true;
    Apiservice.featuredstones().then(
      (response) {
        
        if (response != null) {
          featuredstoneslist.value =
              FeaturedstonesResponseModel.fromJson(response);
          isLoading.value = false;
        }
      },
    );
  }
}
  