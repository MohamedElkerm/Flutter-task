// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

Notifications notificationsFromJson(String str) => Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  bool success;
  String message;
  List<Notification> notification;

  Notifications({
    required this.success,
    required this.message,
    required this.notification,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    success: json["success"],
    message: json["message"],
    notification: List<Notification>.from(json["data"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(notification.map((x) => x.toJson())),
  };
}

class Notification {
  String id;
  String title;
  String issueId;
  String issueType;
  bool seen;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String timeAgo;

  Notification({
    required this.id,
    required this.title,
    required this.issueId,
    required this.issueType,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.timeAgo,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["_id"],
    title: json["title"],
    issueId: json["issueId"],
    issueType: json["issueType"],
    seen: json["seen"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    timeAgo: json["timeAgo"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "issueId": issueId,
    "issueType": issueType,
    "seen": seen,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "timeAgo": timeAgo,
  };
}
