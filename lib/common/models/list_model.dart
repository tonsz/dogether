class ListModel {
  int? id;
  String? name;
  int? creatorId;

  ListModel({
    this.id,
    this.name,
    this.creatorId,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        id: json["id"],
        name: json["name"],
        creatorId: json["creatorId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "creatorId": creatorId,
      };
}
