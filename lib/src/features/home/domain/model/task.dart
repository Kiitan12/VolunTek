
class Task {
  String title;
  String description;
  String imgUrl;
  String time;
  String location;
  String cause;
  String id;
  List<dynamic> favorites;

  Task({
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.time,
    required this.location,
    required this.cause,
    required this.id,
     this.favorites = const [],
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        imgUrl: json["imgUrl"] ?? "",
        time: json["time"] ?? "",
        location: json["location"] ?? "",
        cause: json["interest"] ?? "",
        id: json["id"] ?? "",
        favorites: json["favorites"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "imgUrl": imgUrl,
        "time": time,
        "location": location,
        "interest": cause,
        "id": id,
        "favorites": favorites,
      };
}
