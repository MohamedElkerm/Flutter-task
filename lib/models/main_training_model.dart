// To parse this JSON data, do
//
//     final mainTrainingProgramModel = mainTrainingProgramModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MainTrainingProgramModel mainTrainingProgramModelFromJson(String str) => MainTrainingProgramModel.fromJson(json.decode(str));

String mainTrainingProgramModelToJson(MainTrainingProgramModel data) => json.encode(data.toJson());

class MainTrainingProgramModel {
  bool success;
  String message;
  List<CourseModel> data;

  MainTrainingProgramModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MainTrainingProgramModel.fromJson(Map<String, dynamic> json) => MainTrainingProgramModel(
    success: json["success"],
    message: json["message"],
    data: List<CourseModel>.from(json["data"].map((x) => CourseModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CourseModel {
  String id;
  String programName;
  String programNameEn;
  bool undergradProgram;
  int v;
  String type;
  bool active;

  CourseModel({
    required this.id,
    required this.programName,
    required this.programNameEn,
    required this.undergradProgram,
    required this.v,
    required this.type,
    required this.active,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    id: json["_id"],
    programName: json["programName"],
    programNameEn: json["programNameEn"],
    undergradProgram: json["undergradProgram"],
    v: json["__v"],
    type: json["type"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "programName": programName,
    "programNameEn": programNameEn,
    "undergradProgram": undergradProgram,
    "__v": v,
    "type": type,
    "active": active,
  };
}
