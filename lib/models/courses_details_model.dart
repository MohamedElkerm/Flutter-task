// To parse this JSON data, do
//
//     final ProgramDetailsModel = coursesDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProgramDetailsModel coursesDetailsModelFromJson(String str) => ProgramDetailsModel.fromJson(json.decode(str));

String coursesDetailsModelToJson(ProgramDetailsModel data) => json.encode(data.toJson());

class ProgramDetailsModel {
  bool success;
  String message;
  List<CourseDetailsModel> data;

  ProgramDetailsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProgramDetailsModel.fromJson(Map<String, dynamic> json) => ProgramDetailsModel(
    success: json["success"],
    message: json["message"],
    data: List<CourseDetailsModel>.from(json["data"].map((x) => CourseDetailsModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CourseDetailsModel {
  Duration duration;
  String id;
  String courseName;
  String courseNameEn;
  String programId;
  String programOverview;
  String programOverviewEn;
  List<MainOutline> mainOutlines;
  bool undergradCourse;
  bool active;
  String params;
  int v;
  String imgUrl;

  CourseDetailsModel({
    required this.duration,
    required this.id,
    required this.courseName,
    required this.courseNameEn,
    required this.programId,
    required this.programOverview,
    required this.programOverviewEn,
    required this.mainOutlines,
    required this.undergradCourse,
    required this.active,
    required this.params,
    required this.v,
    required this.imgUrl,
  });

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) => CourseDetailsModel(
    duration: Duration.fromJson(json["duration"]),
    id: json["_id"],
    courseName: json["courseName"],
    courseNameEn: json["courseNameEn"],
    programId: json["programId"],
    programOverview: json["programOverview"],
    programOverviewEn: json["programOverviewEn"],
    mainOutlines: List<MainOutline>.from(json["mainOutlines"].map((x) => MainOutline.fromJson(x))),
    undergradCourse: json["undergradCourse"],
    active: json["active"],
    params: json["params"],
    v: json["__v"],
    imgUrl: json["imgUrl"],
  );

  Map<String, dynamic> toJson() => {
    "duration": duration.toJson(),
    "_id": id,
    "courseName": courseName,
    "courseNameEn": courseNameEn,
    "programId": programId,
    "programOverview": programOverview,
    "programOverviewEn": programOverviewEn,
    "mainOutlines": List<dynamic>.from(mainOutlines.map((x) => x.toJson())),
    "undergradCourse": undergradCourse,
    "active": active,
    "params": params,
    "__v": v,
    "imgUrl": imgUrl,
  };
}

class Duration {
  int hours;

  Duration({
    required this.hours,
  });

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
    hours: json["hours"],
  );

  Map<String, dynamic> toJson() => {
    "hours": hours,
  };
}

class MainOutline {
  String outline;
  String outlineEn;
  String id;

  MainOutline({
    required this.outline,
    required this.outlineEn,
    required this.id,
  });

  factory MainOutline.fromJson(Map<String, dynamic> json) => MainOutline(
    outline: json["outline"],
    outlineEn: json["outlineEn"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "outline": outline,
    "outlineEn": outlineEn,
    "_id": id,
  };
}
