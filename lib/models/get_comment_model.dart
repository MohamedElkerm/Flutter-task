// To parse this JSON data, do
//
//     final commentsModel = commentsModelFromJson(jsonString);

import 'dart:convert';

CommentsModel commentsModelFromJson(String str) => CommentsModel.fromJson(json.decode(str));

String commentsModelToJson(CommentsModel data) => json.encode(data.toJson());

class CommentsModel {
  bool success;
  List<Comment> comments;

  CommentsModel({
    required this.success,
    required this.comments,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
    success: json["success"],
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
  };
}

class Comment {
  String commentBody;
  String createdBy;
  String createdById;
  String createdDate;
  String timeAgo;

  Comment({
    required this.commentBody,
    required this.createdBy,
    required this.createdById,
    required this.createdDate,
    required this.timeAgo,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    commentBody: json["commentBody"],
    createdBy: json["createdBy"],
    createdById: json["createdById"],
    createdDate: json["createdDate"],
    timeAgo: json["timeAgo"],
  );

  Map<String, dynamic> toJson() => {
    "commentBody": commentBody,
    "createdBy": createdBy,
    "createdById": createdById,
    "createdDate": createdDate,
    "timeAgo": timeAgo,
  };
}
