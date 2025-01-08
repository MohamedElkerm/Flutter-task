// To parse this JSON data, do
//
//     final caseReason = caseReasonFromJson(jsonString);

import 'dart:convert';

CaseReason caseReasonFromJson(String str) =>
    CaseReason.fromJson(json.decode(str));

// String caseReasonToJson(CaseReason data) => json.encode(data.toJson());

class CaseReason {
  bool success;
  SubTypeData subTypeData;

  CaseReason({
    required this.success,
    required this.subTypeData,
  });

  factory CaseReason.fromJson(Map<String, dynamic> json) => CaseReason(
        success: json["success"],
        subTypeData: SubTypeData.fromJson(json["subTypeData"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "success": success,
  //       "subTypeData": subTypeData.toJson(),
  //     };
}

class SubTypeData {
  int id;
  String typeTitle;
  String typeIcon;
  String typeValue;
  dynamic caseReason;

  SubTypeData({
    required this.id,
    required this.typeTitle,
    required this.typeIcon,
    required this.typeValue,
    required this.caseReason,
  });

  factory SubTypeData.fromJson(Map<String, dynamic> json) => SubTypeData(
        id: json["id"],
        typeTitle: json["typeTitle"],
        typeIcon: json["typeIcon"],
        typeValue: json["typeValue"],
        caseReason:json['caseReason']==""?null: List<CaseReasonElement>.from(
          json["caseReason"].map(
            (x) => CaseReasonElement.fromJson(x),
          ),
        ),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "typeTitle": typeTitle,
  //       "typeIcon": typeIcon,
  //       "typeValue": typeValue,
  //       "caseReason": List<dynamic>.from(
  //         caseReason.map(
  //           (x) => x.toJson(),
  //         ),
  //       ),
  //     };
}

class CaseReasonElement {
  String caseReasonTitle;
  String caseReasonIcon;

  CaseReasonElement({
    required this.caseReasonTitle,
    required this.caseReasonIcon,
  });

  factory CaseReasonElement.fromJson(Map<String, dynamic> json) =>
      CaseReasonElement(
        caseReasonTitle: json["caseReasonTitle"],
        caseReasonIcon: json["caseReasonIcon"],
      );

  Map<String, dynamic> toJson() => {
        "caseReasonTitle": caseReasonTitle,
        "caseReasonIcon": caseReasonIcon,
      };
}
