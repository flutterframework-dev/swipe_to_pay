import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  CardModel({
    this.name,
    this.image,
  });

  String name;
  String image;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
