class UserModel {
  int? id;
  String? name;
  int? isVerified;
  String? photoUrl;

  UserModel({
    this.id,
    this.name,
    this.isVerified,
    this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        isVerified: json["isVerified"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isVerified": isVerified,
        "photoUrl": photoUrl,
      };
}
