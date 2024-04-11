import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String title;
  String description;
  String imgUrl;
  Timestamp time;
  String location;
  String interest;

  Task({
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.time,
    required this.location,
    required this.interest,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        imgUrl: json["imgUrl"] ?? "",
        time: json["time"] ?? Timestamp.now(),
        location: json["location"] ?? "",
        interest: json["interest"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "imgUrl": imgUrl,
        "time": time,
        "location": location,
        "interest": interest,
      };
}
