class TaskModel {
  int? id;
  String? title;
  String? desc;
  int? isCompleted;
  String? date;
  int? ownerId;
  int? listId;

  TaskModel({
    this.id,
    this.title,
    this.desc,
    this.isCompleted,
    this.date,
    this.ownerId,
    this.listId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        isCompleted: json["isCompleted"],
        date: json["date"],
        ownerId: json["ownerId"],
        listId: json["listId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "isCompleted": isCompleted,
        "date": date,
        "ownerId": ownerId,
        "listId": listId,
      };
}
