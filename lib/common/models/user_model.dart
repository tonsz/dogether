class UserModel {
  final String greeting;
  final List<String> instructions;

  UserModel({
    required this.greeting,
    required this.instructions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        greeting: json["greeting"],
        instructions: List<String>.from(json["instructions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "greeting": greeting,
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
      };
}
