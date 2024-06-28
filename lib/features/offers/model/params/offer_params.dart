import 'dart:convert';

class OfferParams {
  String? name;
  String? description;

  OfferParams({
    this.name,
    this.description,
  });

  factory OfferParams.fromRawJson(String str) =>
      OfferParams.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OfferParams.fromJson(Map<String, dynamic> json) => OfferParams(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}
