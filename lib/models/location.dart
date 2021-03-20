import 'dart:convert';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  LocationModel({
    this.id,
    this.name,
    this.contact,
    this.address,
  });

  String id;
  String name;
  String contact;
  String address;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        name: json["name"],
        contact: json["contact"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contact": contact,
        "address": address,
      };
}
