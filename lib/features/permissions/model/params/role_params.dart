import 'dart:convert';

class RoleParams {
  String? name;
  String? description;

  RoleParams({
    this.name,
    this.description,
  });

  factory RoleParams.fromRawJson(String str) =>
      RoleParams.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoleParams.fromJson(Map<String, dynamic> json) => RoleParams(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}
