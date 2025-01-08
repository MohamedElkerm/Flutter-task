import 'dart:convert';

SubService subServiceFromJson(String str) => SubService.fromJson(json.decode(str));

String subServiceToJson(SubService data) => json.encode(data.toJson());

class SubService {
  bool success;
  Data data;

  SubService({
    required this.success,
    required this.data,
  });

  factory SubService.fromJson(Map<String, dynamic> json) => SubService(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String recordTypeId;
  String recordTypeTitle;
  String recordTypeIcon;
  List<SubTypeSbService> subType;

  Data({
    required this.id,
    required this.recordTypeId,
    required this.recordTypeTitle,
    required this.recordTypeIcon,
    required this.subType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    recordTypeId: json["recordTypeId"],
    recordTypeTitle: json["recordTypeTitle"],
    recordTypeIcon: json["recordTypeIcon"],
    subType: List<SubTypeSbService>.from(json["subType"].map((x) => SubTypeSbService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "recordTypeId": recordTypeId,
    "recordTypeTitle": recordTypeTitle,
    "recordTypeIcon": recordTypeIcon,
    "subType": List<dynamic>.from(subType.map((x) => x.toJson())),
  };
}

class SubTypeSbService {
  int id;
  String typeTitle;
  String typeValue;
  String typeIcon;

  SubTypeSbService({
    required this.id,
    required this.typeTitle,
    required this.typeValue,
    required this.typeIcon,
  });

  factory SubTypeSbService.fromJson(Map<String, dynamic> json) => SubTypeSbService(
    id: json["id"],
    typeTitle: json["typeTitle"],
    typeValue: json["typeValue"],
    typeIcon: json["typeIcon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "typeTitle": typeTitle,
    "typeValue": typeValue,
    "typeIcon": typeIcon,
  };
}
