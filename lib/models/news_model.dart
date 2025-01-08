// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

class NewsModel {
  bool success;
  String message;
  List<NewModel> news;
  int total;
  int totalPages;

  NewsModel({
    required this.success,
    required this.message,
    required this.news,
    required this.total,
    required this.totalPages,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    success: json["success"],
    message: json["message"],
    news:
    List<NewModel>.from(json["data"].map((x) => NewModel.fromJson(x))),
    total: json["total"],
    totalPages: json["totalPages"],
  );
}

class NewModel {
  String id;
  String title;
  String titleEn;
  String bodyEn;
  String body;
  // List<List<String>>? refrances;
  String date;
  String imgUrl;

  // DateTime? createdAt;
  // DateTime? updatedAt;
  // int v;
  String params;

  // bool activeAd;
  // bool studentNews;
  List<PdfModel> pdfs;

  NewModel({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.bodyEn,
    required this.body,
    // required this.refrances,
    required this.date,
    required this.imgUrl,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.v,
    required this.params,
    // required this.activeAd,
    // required this.studentNews,
    required this.pdfs,
  });

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
    id: json["_id"]??"",
    title: json["title"]??"",
    titleEn: json["titleEn"]??"",
    bodyEn: json["bodyEn"] ?? "",
    body: json["body"] ?? "",
    // refrances: json["refrances"] == null || json["refrances"] == []
    //     ? []
    //     : List<List<String>>.from(json["refrances"]!
    //     .map((x) => List<String>.from(x.map((x) => x)))),
    date: json["date"]??"",
    imgUrl: json["imgUrl"] ?? "",
    // createdAt: DateTime.parse(json["createdAt"]),
    // updatedAt: DateTime.parse(json["updatedAt"]),
    // v: json["__v"],
    params: json["params"] == null ? "" : json['params'],
    // activeAd: json["activeAd"]==null ? false:json['activeAd'],
    // studentNews: json["studentNews"]==null?false:json['studentNews'],
    pdfs:json['pdfs'] == null || json['pdfs'] == []? [] : List<PdfModel>.from(json["pdfs"].map((x) => PdfModel.fromJson(x))),
  );
}

class PdfModel {
  String title;
  String path;

  PdfModel({
    required this.title,
    required this.path,
  });

  factory PdfModel.fromJson(json) {
    return PdfModel(
      title: json['title'],
      path: json['path'],
    );
  }
}