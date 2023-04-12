// To parse this JSON data, do
//
//     final sqfResponceModal = sqfResponceModalFromJson(jsonString);

import 'dart:convert';

SqfResponceModal sqfResponceModalFromJson(String str) =>
    SqfResponceModal.fromJson(json.decode(str));

String sqfResponceModalToJson(SqfResponceModal data) =>
    json.encode(data.toJson());

class SqfResponceModal {
  SqfResponceModal({
    this.id,
    this.filterdata,
  });

  int? id;
  String? filterdata;

  factory SqfResponceModal.fromJson(Map<String, dynamic> json) =>
      SqfResponceModal(
        id: json["id"],
        filterdata: json["Filterdata"] == null ? null : json["Filterdata"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Filterdata": filterdata,
      };
}

class Filterdata {
  Filterdata({
    this.fromDate,
    this.labs0,
  });

  String? fromDate;
  String? labs0;

  factory Filterdata.fromJson(Map<String, dynamic> json) => Filterdata(
        fromDate: json["from_date"],
        labs0: json["labs[0]"],
      );

  Map<String, dynamic> toJson() => {
        "from_date": fromDate,
        "labs[0]": labs0,
      };
}
