class ListModel {
  int? id;
  String? name;
  int? creatorId;
  String? dateCreated;

  ListModel({this.id, this.name, this.creatorId, this.dateCreated});

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        id: json["id"],
        name: json["name"],
        creatorId: json["creatorId"],
        dateCreated: json["dateCreated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "creatorId": creatorId,
        "dateCreated": dateCreated,
      };
}
