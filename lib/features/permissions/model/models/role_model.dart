import 'dart:convert';

class RoleModel {
  int? id;
  String? name;
  String? description;

  RoleModel({
    this.id,
    this.name,
    this.description,
  });

  factory RoleModel.fromRawJson(String str) =>
      RoleModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
