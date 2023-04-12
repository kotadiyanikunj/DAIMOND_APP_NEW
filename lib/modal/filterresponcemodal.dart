// To parse this JSON data, do
//
//     final filterResponseModel = filterResponseModelFromJson(jsonString);

import 'dart:convert';

FilterResponseModel filterResponseModelFromJson(String str) => FilterResponseModel.fromJson(json.decode(str));

String filterResponseModelToJson(FilterResponseModel data) => json.encode(data.toJson());

class FilterResponseModel {
    FilterResponseModel({
        this.status,
        this.message,
        this.data,
    });

    bool? status;
    String? message;
    Data? data;

    factory FilterResponseModel.fromJson(Map<String, dynamic> json) => FilterResponseModel(
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
        this.sizeMaster,
        this.clarityMaster,
        this.typeMaster,
        this.shapeMaster,
        this.entryMaster,
        this.labMaster,
        this.currancyMaster,
        this.overtone,
        this.color,
        this.intensity,
    });

    List<Master>? sizeMaster;
    List<Master>? clarityMaster;
    List<Master>? typeMaster;
    List<Master>? shapeMaster;
    List<Master>? entryMaster;
    List<Master>? labMaster;
    List<Master>? currancyMaster;
    List<Overtone>? overtone;
    List<Color>? color;
    List<Intensity>? intensity;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        sizeMaster: json["size_master"] == null ? [] : List<Master>.from(json["size_master"]!.map((x) => Master.fromJson(x))),
        clarityMaster: json["clarity_master"] == null ? [] : List<Master>.from(json["clarity_master"]!.map((x) => Master.fromJson(x))),
        typeMaster: json["type_master"] == null ? [] : List<Master>.from(json["type_master"]!.map((x) => Master.fromJson(x))),
        shapeMaster: json["shape_master"] == null ? [] : List<Master>.from(json["shape_master"]!.map((x) => Master.fromJson(x))),
        entryMaster: json["entry_master"] == null ? [] : List<Master>.from(json["entry_master"]!.map((x) => Master.fromJson(x))),
        labMaster: json["lab_master"] == null ? [] : List<Master>.from(json["lab_master"]!.map((x) => Master.fromJson(x))),
        currancyMaster: json["currancy_master"] == null ? [] : List<Master>.from(json["currancy_master"]!.map((x) => Master.fromJson(x))),
        overtone: json["overtone"] == null ? [] : List<Overtone>.from(json["overtone"]!.map((x) => Overtone.fromJson(x))),
        color: json["color"] == null ? [] : List<Color>.from(json["color"]!.map((x) => Color.fromJson(x))),
        intensity: json["intensity"] == null ? [] : List<Intensity>.from(json["intensity"]!.map((x) => Intensity.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "size_master": sizeMaster == null ? [] : List<dynamic>.from(sizeMaster!.map((x) => x.toJson())),
        "clarity_master": clarityMaster == null ? [] : List<dynamic>.from(clarityMaster!.map((x) => x.toJson())),
        "type_master": typeMaster == null ? [] : List<dynamic>.from(typeMaster!.map((x) => x.toJson())),
        "shape_master": shapeMaster == null ? [] : List<dynamic>.from(shapeMaster!.map((x) => x.toJson())),
        "entry_master": entryMaster == null ? [] : List<dynamic>.from(entryMaster!.map((x) => x.toJson())),
        "lab_master": labMaster == null ? [] : List<dynamic>.from(labMaster!.map((x) => x.toJson())),
        "currancy_master": currancyMaster == null ? [] : List<dynamic>.from(currancyMaster!.map((x) => x.toJson())),
        "overtone": overtone == null ? [] : List<dynamic>.from(overtone!.map((x) => x.toJson())),
        "color": color == null ? [] : List<dynamic>.from(color!.map((x) => x.toJson())),
        "intensity": intensity == null ? [] : List<dynamic>.from(intensity!.map((x) => x.toJson())),
    };
}

class Master {
    Master({
        this.id,
        this.priority,
        this.type,
        this.name,
        this.color,
        this.intensity,
        this.overtone,
    });

    int? id;
    int? priority;
    Type? type;
    String? name;
    String? color;
    String? intensity;
    String? overtone;

    factory Master.fromJson(Map<String, dynamic> json) => Master(
        id: json["id"],
        priority: json["priority"],
        type: typeValues.map[json["type"]]!,
        name: json["name"],
        color: json["color"],
        intensity: json["intensity"],
        overtone: json["overtone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "priority": priority,
        "type": typeValues.reverse[type],
        "name": name,
        "color": color,
        "intensity": intensity,
        "overtone": overtone,
    };
}

enum Type { CLARITY_MASTER, CURRANCY_MASTER, ENTRY_MASTER, LAB_MASTER, SHAPE_MASTER, SIZE_MASTER, TYPE_MASTER }

final typeValues = EnumValues({
    "clarity_master": Type.CLARITY_MASTER,
    "currancy_master": Type.CURRANCY_MASTER,
    "entry_master": Type.ENTRY_MASTER,
    "lab_master": Type.LAB_MASTER,
    "shape_master": Type.SHAPE_MASTER,
    "size_master": Type.SIZE_MASTER,
    "type_master": Type.TYPE_MASTER
});

class Color {
    Color({
        this.id,
        this.color,
    });

    int? id;
    String? color;

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
    };
}

class Intensity {
    Intensity({
        this.id,
        this.intensity,
    });

    int? id;
    String? intensity;

    factory Intensity.fromJson(Map<String, dynamic> json) => Intensity(
        id: json["id"],
        intensity: json["intensity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "intensity": intensity,
    };
}

class Overtone {
    Overtone({
        this.id,
        this.overtone,
    });

    int? id;
    String? overtone;

    factory Overtone.fromJson(Map<String, dynamic> json) => Overtone(
        id: json["id"],
        overtone: json["overtone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "overtone": overtone,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
