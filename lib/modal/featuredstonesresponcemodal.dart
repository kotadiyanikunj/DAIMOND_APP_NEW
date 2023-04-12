class FeaturedstonesResponseModel {
  bool? status;
  String? message;
  List<Data>? data;

  FeaturedstonesResponseModel({this.status, this.message, this.data});

  FeaturedstonesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? image;
  dynamic totalCarat;
  String? line2;
  String? colorName;
  String? lab;
  String? date;
  String? client;

  Data(
      {this.image,
      this.totalCarat,
      this.line2,
      this.colorName,
      this.lab,
      this.date,
      this.client});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    totalCarat = json['total_carat'];
    line2 = json['line2'];
    colorName = json['color_name'];
    lab = json['lab'];
    date = json['date'];
    client = json['client'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['total_carat'] = this.totalCarat;
    data['line2'] = this.line2;
    data['color_name'] = this.colorName;
    data['lab'] = this.lab;
    data['date'] = this.date;
    data['client'] = this.client;
    return data;
  }
}
