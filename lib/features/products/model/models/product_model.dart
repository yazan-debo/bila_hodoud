import 'dart:convert';

class ProductModel {
  int? id;
  String? barcode;
  String? name;
  String? description;
  int? price;
  int? quantity;
  int? minimumQuantity;
  List<String>? images;
  int? sectionId;
  dynamic subSectionsId;

  ProductModel({
    this.id,
    this.barcode,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.minimumQuantity,
    this.images,
    this.sectionId,
    this.subSectionsId,
  });

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        barcode: json["barcode"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        minimumQuantity: json["minimumQuantity"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        sectionId: json["section_id"],
        subSectionsId: json["subSections_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "barcode": barcode,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "minimumQuantity": minimumQuantity,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "section_id": sectionId,
        "subSections_id": subSectionsId,
      };
}
