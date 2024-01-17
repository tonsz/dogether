class ListModel {
  int? userId;
  int? listId;

  ListModel({
    this.userId,
    this.listId,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        userId: json["userId"],
        listId: json["listId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "listId": listId,
      };
}
