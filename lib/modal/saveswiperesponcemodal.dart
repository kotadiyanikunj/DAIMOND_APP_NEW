// To parse this JSON data, do
//
//     final saveSwipeResponceModal = saveSwipeResponceModalFromJson(jsonString);

import 'dart:convert';

SaveSwipeResponceModal saveSwipeResponceModalFromJson(String str) => SaveSwipeResponceModal.fromJson(json.decode(str));

String saveSwipeResponceModalToJson(SaveSwipeResponceModal data) => json.encode(data.toJson());

class SaveSwipeResponceModal {
    SaveSwipeResponceModal({
        this.status,
        this.message,
        this.data,
    });

    bool? status;
    String? message;
    List<dynamic>? data;

    factory SaveSwipeResponceModal.fromJson(Map<String, dynamic> json) => SaveSwipeResponceModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    };
}
