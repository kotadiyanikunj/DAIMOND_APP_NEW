class StockResponseModel {
  bool? status;
  String? message;
  List<Data>? data;

  StockResponseModel({this.status, this.message, this.data});

  StockResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? line2;
  String? line3;
  String? type;
  String? refno;
  String? lotno;
  int? pcs;
  String? kapan;
  String? remarks;
  String? color;
  String? shape;
  String? size;
  String? clarity;
  String? certificateNo;
  String? polish;
  String? symmetry;
  String? cut;
  dynamic depthPct;
  int? tablePct;
  String? inscription;
  var length;
  var width;
  var height;
  String? pair;
  String? limite;
  String? askingRate;
  String? cost;
  String? lab;
  String? flIntensity;
  String? memoOut;
  String? memoIn;
  String? date;
  String? ratio;
  String? mesurement;
  String? intensity;
  String? colorName;
  String? overtone;
  var totalCarat;
  var onHand;
  String? client;
  String? country;

  Data(
      {this.line2,
      this.line3,
      this.type,
      this.refno,
      this.lotno,
      this.pcs,
      this.kapan,
      this.remarks,
      this.color,
      this.shape,
      this.size,
      this.clarity,
      this.certificateNo,
      this.polish,
      this.symmetry,
      this.cut,
      this.depthPct,
      this.tablePct,
      this.inscription,
      this.length,
      this.width,
      this.height,
      this.pair,
      this.limite,
      this.askingRate,
      this.cost,
      this.lab,
      this.flIntensity,
      this.memoOut,
      this.memoIn,
      this.date,
      this.ratio,
      this.mesurement,
      this.intensity,
      this.colorName,
      this.overtone,
      this.totalCarat,
      this.onHand,
      this.client,
      this.country});

  Data.fromJson(Map<String, dynamic> json) {
    line2 = json['line2'];
    line3 = json['line3'];
    type = json['type'];
    refno = json['refno'];
    lotno = json['lotno'];
    pcs = json['pcs'];
    kapan = json['kapan'];
    remarks = json['remarks'];
    color = json['color'];
    shape = json['shape'];
    size = json['size'];
    clarity = json['clarity'];
    certificateNo = json['certificate_no'];
    polish = json['polish'];
    symmetry = json['symmetry'];
    cut = json['cut'];
    depthPct = json['depth_pct'];
    tablePct = json['table_pct'];
    inscription = json['inscription'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    pair = json['pair'];
    limite = json['limite'];
    askingRate = json['asking_rate'];
    cost = json['cost'];
    lab = json['lab'];
    flIntensity = json['fl_intensity'];
    memoOut = json['memo_out'];
    memoIn = json['memo_in'];
    date = json['date'];
    ratio = json['ratio'];
    mesurement = json['mesurement'];
    intensity = json['intensity'];
    colorName = json['color_name'];
    overtone = json['overtone'];
    totalCarat = json['total_carat'];
    onHand = json['on_hand'];
    client = json['client'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line2'] = this.line2;
    data['line3'] = this.line3;
    data['type'] = this.type;
    data['refno'] = this.refno;
    data['lotno'] = this.lotno;
    data['pcs'] = this.pcs;
    data['kapan'] = this.kapan;
    data['remarks'] = this.remarks;
    data['color'] = this.color;
    data['shape'] = this.shape;
    data['size'] = this.size;
    data['clarity'] = this.clarity;
    data['certificate_no'] = this.certificateNo;
    data['polish'] = this.polish;
    data['symmetry'] = this.symmetry;
    data['cut'] = this.cut;
    data['depth_pct'] = this.depthPct;
    data['table_pct'] = this.tablePct;
    data['inscription'] = this.inscription;
    data['length'] = this.length;
    data['width'] = this.width;
    data['height'] = this.height;
    data['pair'] = this.pair;
    data['limite'] = this.limite;
    data['asking_rate'] = this.askingRate;
    data['cost'] = this.cost;
    data['lab'] = this.lab;
    data['fl_intensity'] = this.flIntensity;
    data['memo_out'] = this.memoOut;
    data['memo_in'] = this.memoIn;
    data['date'] = this.date;
    data['ratio'] = this.ratio;
    data['mesurement'] = this.mesurement;
    data['intensity'] = this.intensity;
    data['color_name'] = this.colorName;
    data['overtone'] = this.overtone;
    data['total_carat'] = this.totalCarat;
    data['on_hand'] = this.onHand;
    data['client'] = this.client;
    data['country'] = this.country;

 

    return data;
  }
}
