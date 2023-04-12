// To parse this JSON data, do
//
//     final dashboardResponseModel = dashboardResponseModelFromJson(jsonString);

import 'dart:convert';

DashboardResponseModel dashboardResponseModelFromJson(String str) =>
    DashboardResponseModel.fromJson(json.decode(str));

String dashboardResponseModelToJson(DashboardResponseModel data) =>
    json.encode(data.toJson());

class DashboardResponseModel {
  DashboardResponseModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      DashboardResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.counts,
  });

  Counts? counts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        counts: json["counts"] == null ? null : Counts.fromJson(json["counts"]),
      );

  Map<String, dynamic> toJson() => {
        "counts": counts?.toJson(),
      };
}

class Counts {
  Counts({
    this.arrival,
    this.remainder,
    this.recomanded,
    this.enquiry,
  });

  int? arrival;
  int? remainder;
  int? recomanded;
  int? enquiry;

  factory Counts.fromJson(Map<String, dynamic> json) => Counts(
        arrival: json["ARRIVAL"],
        remainder: json["REMAINDER"],
        recomanded: json["RECOMANDED"],
        enquiry: json["ENQUIRY"],
      );

  Map<String, dynamic> toJson() => {
        "ARRIVAL": arrival,
        "REMAINDER": remainder,
        "RECOMANDED": recomanded,
        "ENQUIRY": enquiry,
      };
}
