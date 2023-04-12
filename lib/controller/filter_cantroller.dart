import 'package:daimond_app/modal/filterresponcemodal.dart';
import 'package:daimond_app/modal/stock_responce_modal.dart';
import 'package:daimond_app/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FilterCanttroller extends GetxController {
  Rx<FilterResponseModel> filterlist = FilterResponseModel().obs;
  Rx<StockResponseModel> stocklist = StockResponseModel().obs;

  var isLoading = false.obs;
  List color = [].obs;
  List colorvalue = [].obs;

  List lab = [].obs;
  List labvalue = [].obs;
  List cliarity = [].obs;
  List cliarityvalue = [].obs;
  List intensity = [].obs;
  List intensityvalue = [].obs;
  List overtone = [].obs;
  List overtonevalue = [].obs;
  List polish = [].obs;
  List cut = [].obs;
  List symm = [].obs;
  List fluo = [].obs;
  List fluovalue = [].obs;
  List shap = [].obs;
  var selectedfluofValue = "".obs;
  var selectedsymmValue = "".obs;
  var selectedcutValue = "".obs;
  var selectedpolishValue = "".obs;
  var selectedshapValue = "".obs;
  var selectedrefValue = "".obs;
  Map fildata = {};
  Map selectevalue = {};
  // int selecteindex = 0;

  var loading = false.obs;
  Rx<TextEditingController> formdate = TextEditingController().obs;
  Rx<TextEditingController> todate = TextEditingController().obs;
  Rx<TextEditingController> lfrom = TextEditingController().obs;
  Rx<TextEditingController> lto = TextEditingController().obs;
  Rx<TextEditingController> wfrom1 = TextEditingController().obs;
  Rx<TextEditingController> wto1 = TextEditingController().obs;
  Rx<TextEditingController> hfrom = TextEditingController().obs;
  Rx<TextEditingController> hto = TextEditingController().obs;
  Rx<TextEditingController> rfrom1 = TextEditingController().obs;
  Rx<TextEditingController> rto1 = TextEditingController().obs;
  Rx<TextEditingController> cartno = TextEditingController().obs;
  Rx<TextEditingController> refno = TextEditingController().obs;

  Map selecteddata = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fillterdata();
  }

  refnovalue() {
    var ref = refno.value.text.split(' ');
    selectedrefValue.value =
        ref.toString().replaceAll("[", "").replaceAll("]", "");
  }

  textfilddata() {
    var dateTime = DateTime.now();

    // filtercanttroller.formdate.value

    final f = DateFormat('dd-MM-yyyy').format(dateTime);
    ("datetime:$f");
    selectevalue = {
      "from_date": f.toString(),
      "carat[0]": formdate.value.text.toString(),
      "carat[1]": todate.value.text.toString(),
      "refno": selectedrefValue.toString(),
      "certId": cartno.value.text.toString(),
      "ratio[0]": rfrom1.value.text.toString(),
      "ratio[1]": rto1.value.text.toString(),
      "leng[0]": lfrom.value.text.toString(),
      "leng[1]": lto.value.text.toString(),
      "width[0]": wfrom1.value.text.toString(),
      "width[1]": wto1.value.text.toString(),
      "height[0]": hfrom.value.text.toString(),
      "height[1]": hto.value.text.toString(),
    };

    selectevalue.removeWhere((key, value) {
      var temp = key == null || value == null;
      if (value == "") {
      } else {
        fildata[key] = value;
      }
      return temp;
    });
    selecteddata.addAll(fildata);
  }

  fillterdata() {
    isLoading.value = true;
    Apiservice.fillter().then(
      (responce) {
        if (responce != null) {
          filterlist.value = FilterResponseModel.fromJson(responce);
          if (kDebugMode) {}
          isLoading.value = false;
        }
      },
    );
  }

  reset() {
    formdate.value.clear();
    todate.value.clear();
    lfrom.value.clear();
    lto.value.clear();
    wfrom1.value.clear();
    wto1.value.clear();
    hfrom.value.clear();
    hto.value.clear();
    rfrom1.value.clear();
    rto1.value.clear();
    cartno.value.clear();
    color.clear();
    colorvalue.clear();
    lab.clear();
    labvalue.clear();
    cliarity.clear();
    cliarityvalue.clear();
    intensity.clear();
    intensityvalue.clear();
    overtone.clear();
    overtonevalue.clear();
    polish.clear();
    cut.clear();
    symm.clear();
    fluo.clear();
    selecteddata.clear();
    shap.clear();
  }

  colorselection(var value) {
    if (color.contains(value)) {
      color.remove(value);

      loading.value = true;
    } else {
      color.toSet();
      color.add(value);
    }
  }

  intensityselection(var value) {
    if (intensity.contains(value)) {
      intensity.remove(value);
      loading.value = true;
    } else {
      intensity.add(value);
    }
  }

  overtoneselection(var value) {
    if (overtone.contains(value)) {
      overtone.remove(value);
      loading.value = true;
    } else {
      overtone.toSet();
      overtone.add(value);
    }
  }

  labselection(var value) {
    if (lab.contains(value)) {
      lab.remove(value);
      loading.value = true;
    } else {
      lab.add(value);

      // allselectiontab(value);
      // allselectiontab();
    }
  }

  clarityselection(var value) {
    if (cliarity.contains(value)) {
      cliarity.remove(value);
      loading.value = true;
    } else {
      cliarity.add(value);
    }
  }

  cutselection(var value) {
    if (cut.contains(value)) {
      cut.remove(value);
      loading.value = true;
    } else {
      cut.add(value);
      selectedcutValue.value =
          cut.toString().replaceAll("[", "").replaceAll("]", "");
      // var temp1 = temp.replaceAll(RegExp(r"\s[]"), "");
    }
  }

  cutValue() {
    int selecteindex = 0;
    for (var i = 0; i < cut.length; i++) {
      selectevalue = {
        "cut[${selecteindex++}]": cut[i].toString(),
      };

      selecteddata.addAll(selectevalue);
    }
  }

  polishselection(var value) {
    if (polish.contains(value)) {
      polish.remove(value);
      loading.value = true;
    } else {
      polish.add(value);
      selectedpolishValue.value =
          polish.toString().replaceAll("[", "").replaceAll("]", "");
      // var temp1 = temp.replaceAll(RegExp(r"\s[]"), "");
    }
  }

  polishValue() {
    int selecteindex = 0;
    for (var i = 0; i < polish.length; i++) {
      selectevalue = {
        "polish[${selecteindex++}]": polish[i].toString(),
      };

      selecteddata.addAll(selectevalue);
    }
  }

  symmselection(var value) {
    if (symm.contains(value)) {
      symm.remove(value);
      loading.value = true;
    } else {
      symm.add(value);
      selectedsymmValue.value =
          symm.toString().replaceAll("[", "").replaceAll("]", "");
      // var temp1 = temp.replaceAll(RegExp(r"\s[]"), "");
    }
  }

  symmValue() {
    int selecteindex = 0;
    for (var i = 0; i < symm.length; i++) {
      selectevalue = {
        "symmetry[${selecteindex++}]": symm[i].toString(),
      };

      selecteddata.addAll(selectevalue);
    }
  }

  fluoselection(var value) {
    if (fluo.contains(value)) {
      fluo.remove(value);
      loading.value = true;
    } else {
      fluo.add(value);
    }
  }

  fluoValue() {
    int selecteindex = 0;
    for (var i = 0; i < fluo.length; i++) {
      selectevalue = {
        "fl[${selecteindex++}]": fluo[i].toString(),
      };

      selecteddata.addAll(selectevalue);
    }
  }

  shapeselection(var value) {
    if (shap.contains(value)) {
      shap.remove(value);
      loading.value = true;
    } else {
      shap.add(value);
      // shpevalue();
      // print("shap:$shap");
    }
  }

  shpevalue() {
    int selecteindex = 0;
    for (var i = 0; i < shap.length; i++) {
      selectevalue = {
        "shape[${selecteindex++}]": shap[i].toString(),
      };
      selecteddata.addAll(selectevalue);
    }
  }

  colorValue() {
    int selecteindex = 0;
    for (var i = 0; i < color.length; i++) {
      filterlist.value.data?.color?.forEach((element) {
        if (element.id == color[i]) {
          selectevalue = {
            "color[${selecteindex++}]": element.color.toString(),
          };

          colorvalue.add(selectevalue);
        }
      });
    }
    for (var i = 0; i < colorvalue.length; i++) {
      selecteddata.addAll(colorvalue[i]);
    }
  }

  clarityValue() {
    int selecteindex = 0;
    for (var i = 0; i < cliarity.length; i++) {
      filterlist.value.data?.clarityMaster?.forEach((element) {
        if (element.priority == cliarity[i] + 1) {
          selectevalue = {
            "clarity[${selecteindex++}]": element.name.toString(),
          };
          cliarityvalue.add(selectevalue);
        }
      });
    }
    for (var i = 0; i < cliarityvalue.length; i++) {
      selecteddata.addAll(cliarityvalue[i]);
    }
  }

  labValue() {
    int selecteindex = 0;
    for (var i = 0; i < lab.length; i++) {
      filterlist.value.data?.labMaster?.forEach((element) {
        if (element.priority == lab[i] + 1) {
          selectevalue = {
            "labs[${selecteindex++}]": element.name.toString(),
          };
          labvalue.add(selectevalue);
        }
      });
    }

    for (var i = 0; i < labvalue.length; i++) {
      selecteddata.addAll(labvalue[i]);
    }
  }

  overToneValue() {
    int selecteindex = 0;
    for (var i = 0; i < overtone.length; i++) {
      filterlist.value.data?.overtone?.forEach((element) {
        if (element.id == overtone[i]) {
          selectevalue = {
            "overtone[${selecteindex++}]": element.overtone.toString(),
          };

          overtonevalue.add(selectevalue);
        }
      });
    }

    for (var i = 0; i < overtonevalue.length; i++) {
      selecteddata.addAll(overtonevalue[i]);
    }
  }

  intensityValue() {
    int selecteindex = 0;
    for (var i = 0; i < intensity.length; i++) {
      filterlist.value.data?.intensity?.forEach((element) {
        if (element.id == intensity[i]) {
          selectevalue = {
            "intensity[${selecteindex++}]": element.intensity.toString(),
          };
          intensityvalue.add(selectevalue);
        }
      });
    }
    for (var i = 0; i < intensityvalue.length; i++) {
      selecteddata.addAll(intensityvalue[i]);
    }
  }
}
