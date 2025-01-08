// To parse this JSON data, do
//
//     final pdfsModel = pdfsModelFromJson(jsonString);

import 'dart:convert';

PdfsModel pdfsModelFromJson(String str) => PdfsModel.fromJson(json.decode(str));

String pdfsModelToJson(PdfsModel data) => json.encode(data.toJson());

class PdfsModel {
  bool success;
  String message;
  List<AnnouncementModel> pdfs;

  PdfsModel({
    required this.success,
    required this.message,
    required this.pdfs,
  });

  factory PdfsModel.fromJson(Map<String, dynamic> json) => PdfsModel(
        success: json["success"],
        message: json["message"],
        pdfs:
            List<AnnouncementModel>.from(json["data"].map((x) => AnnouncementModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(pdfs.map((x) => x.toJson())),
      };
}

class AnnouncementModel {
  String name;
  String link;
  String type;
  String category;

  AnnouncementModel({
    required this.name,
    required this.link,
    required this.type,
    required this.category,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) => AnnouncementModel(
        name: json["name"],
        link: json["link"],
        type: json["type"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
      };
}
