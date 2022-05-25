import 'package:flutter/material.dart';

class ProviderCheckInformation extends ChangeNotifier {
  List<ModelCheckInformationForDelete> myList = [
    ModelCheckInformationForDelete(
        id: 1, name: "Shaxsiy ma'lumotlar", status: 1),
    ModelCheckInformationForDelete(
        id: 2, name: "Doimiy yashash manzili", status: 1),
    ModelCheckInformationForDelete(
        id: 3, name: "Umumta'lim muassasi", status: 1),
    ModelCheckInformationForDelete(id: 4, name: "Sertifikatlar", status: 1),
    ModelCheckInformationForDelete(id: 5, name: "Imtiyozlar", status: 1),
    ModelCheckInformationForDelete(id: 6, name: "Yo'nalish tanlash", status: 1),
  ];




}

class ModelCheckInformationForDelete {
  String name;
  int id;
  int status;

  ModelCheckInformationForDelete(
      {required this.id, required this.name, required this.status});

  factory ModelCheckInformationForDelete.fromJson(Map<String, dynamic> json) =>
      ModelCheckInformationForDelete(
          id: json["id"], name: json["name"], status: json["status"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}
