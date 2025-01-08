// To parse this JSON data, do
//
//     final requestHistoryModel = requestHistoryModelFromJson(jsonString);

import 'dart:convert';

RequestHistoryModel requestHistoryModelFromJson(String str) => RequestHistoryModel.fromJson(json.decode(str));

// String requestHistoryModelToJson(RequestHistoryModel data) => json.encode(data.toJson());

class RequestHistoryModel {
  bool success;
  String message;
  RequestModel requestModel;

  RequestHistoryModel({
    required this.success,
    required this.message,
    required this.requestModel,
  });

  factory RequestHistoryModel.fromJson(Map<String, dynamic> json) => RequestHistoryModel(
    success: json["success"],
    message: json["message"],
    requestModel: RequestModel.fromJson(json["data"]),
  );

}

class RequestModel {
  List<Record> currentRecords;
  List<Record> previousRecords;
  int page;
  int totalPages;

  RequestModel({
    required this.currentRecords,
    required this.previousRecords,
    required this.page,
    required this.totalPages,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
    currentRecords: List<Record>.from(json["currentRecords"].map((x) => Record.fromJson(x))),
    previousRecords: List<Record>.from(json["previousRecords"].map((x) => Record.fromJson(x))),
    page:json['page'],
    totalPages: json['totalPages'],
  );


}

class Record {
  String id;
  String caseNumber;
  String createdDate;
  String status;
  String caseReason;
  String subject;
  CaseDepartment caseDepartment;//////////////////
  String subType;
  String paymentStatus;

  Record({
    required this.id,
    required this.caseNumber,
    required this.createdDate,
    required this.status,
    required this.caseReason,
    required this.subject,
    required this.caseDepartment,
    required this.subType,
    required this.paymentStatus,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["id"],
    createdDate: json["createdDate"],
    status: json['status'],
    caseReason: json['caseReason'],
    subject: json["subject"],
    caseDepartment: CaseDepartment.fromJson(json["caseDepartment"]),
    subType: json['subType'],
    paymentStatus: json['paymentStatus'],
    caseNumber: json['caseNumber'],
  );

}

class CaseDepartment {
  String departmentId;
  String departmentTitle;

  CaseDepartment({
    required this.departmentId,
    required this.departmentTitle,
  });

  factory CaseDepartment.fromJson(Map<String, dynamic> json) => CaseDepartment(
    departmentId: json['departmentId'],
    departmentTitle: json['departmentTitle'],
  );

}



