import 'dart:convert';

class ProductParams {
  String? name;
  String? barcode;
  String? description;
  String? price;
  String? quantity;
  String? minimumQuantity;
  String? sectionId;
  String? subSectionId;

  ProductParams({
    this.name,
    this.barcode,
    this.description,
    this.price,
    this.quantity,
    this.minimumQuantity,
    this.sectionId,
    this.subSectionId,
  });

  factory ProductParams.fromRawJson(String str) =>
      ProductParams.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductParams.fromJson(Map<String, dynamic> json) => ProductParams(
        name: json["name"],
        barcode: json["barcode"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        minimumQuantity: json["minimumQuantity"],
        sectionId: json["section_id"],
        subSectionId: json["subSection_id"],
      );

  Map<String, String> toJson() => {
        "name": name ?? "",
        "barcode": barcode ?? "",
        "description": description ?? "",
        "price": price ?? "",
        "quantity": quantity ?? "",
        "minimumQuantity": minimumQuantity ?? "",
        "section_id": sectionId ?? "",
        "subSection_id": subSectionId ?? "",
      };
}
