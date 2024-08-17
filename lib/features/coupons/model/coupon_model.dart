import 'dart:convert';

class CouponModel {
  int? id;
  int? totalValue;
  int? valueLeft;
  int? valueConsumed;
  int? percentage;
  String? sender;
  String? receiver;
  String? createdAt;

  CouponModel({
    this.id,
    this.totalValue,
    this.valueLeft,
    this.valueConsumed,
    this.percentage,
    this.sender,
    this.receiver,
    this.createdAt,
  });

  factory CouponModel.fromRawJson(String str) =>
      CouponModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        id: json["id"],
        totalValue: json["total_value"],
        valueLeft: json["value_left"],
        valueConsumed: json["value_consumed"],
        percentage: json["percentage"],
        sender: json["sender"],
        receiver: json["receiver"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_value": totalValue,
        "value_left": valueLeft,
        "value_consumed": valueConsumed,
        "percentage": percentage,
        "sender": sender,
        "receiver": receiver,
        "created_at": createdAt,
      };
}
