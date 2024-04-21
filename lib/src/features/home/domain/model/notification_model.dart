import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String title;
  String body;
  Timestamp date;

  NotificationModel({
    required this.title,
    required this.body,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        title: json["title"] ?? "",
        body: json["body"] ?? "",
        date: json["date"] ?? Timestamp.now(),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "date": date,
      };
}
