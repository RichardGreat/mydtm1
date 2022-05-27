import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/pages/person_info/certificate/certificates.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/foreigion_lang_add.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProviderCheckInformation extends ChangeNotifier {
  List<ModelCheckInformationForDelete> myList = [
    ModelCheckInformationForDelete(
        id: 1, name: "Shaxsiy ma'lumotlar", status: 0),
    ModelCheckInformationForDelete(
        id: 2, name: "Doimiy yashash manzili", status: 0),
    ModelCheckInformationForDelete(
        id: 3, name: "Umumta'lim muassasi", status: 1),
    ModelCheckInformationForDelete(id: 4, name: "Sertifikatlar", status: 1),
    ModelCheckInformationForDelete(id: 5, name: "Imtiyozlar", status: 1),
    ModelCheckInformationForDelete(id: 6, name: "Yo'nalish tanlash", status: 1),
  ];

  Future checkInfo({required int index, required BuildContext context}) async {
    if (index == 0) {
      pushNewScreen(
        context,
        screen: const PersonInformation(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    } else if (index == 1) {
      pushNewScreen(
        context,
        screen: const AddressInfo(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    } else if (index == 2) {
      pushNewScreen(
        context,
        screen: const Graduated(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    } else if (index == 3) {
      pushNewScreen(
        context,
        screen: const Certificates(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    } else if (index == 4) {
      pushNewScreen(
        context,
        screen: const ForeignLanguageAdd(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }
  }
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
