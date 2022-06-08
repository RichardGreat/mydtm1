import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/person_info/check_user_info/check_user_info.dart';
import 'package:mydtm/data/model_parse/person_info/check_user_info.dart';
import 'package:mydtm/view/pages/otm/choose_edu.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/pages/person_info/certificate/certificates.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/foreigion_lang_add.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:mydtm/view/pages/person_info/privillage/privillage.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:easy_localization/easy_localization.dart';
class ProviderCheckInformation extends ChangeNotifier {


  List<ModelCheckInformationForDelete> myList = [

    ModelCheckInformationForDelete(
        id: 1, name: "personInformation".tr(), status: 0),
    ModelCheckInformationForDelete(
        id: 2, name: "addressAlways".tr(), status: 0),
    ModelCheckInformationForDelete(
        id: 3, name: "schoolInfo".tr(), status: 1),
    ModelCheckInformationForDelete(id: 4, name: "certificates".tr(), status: 1),
    ModelCheckInformationForDelete(id: 5, name: "privileges".tr(), status: 1),
    ModelCheckInformationForDelete(id: 6, name: "chooseDirection".tr(), status: 1),
  ];



  NetworkCheckUserInfo networkCheckUserInfo = NetworkCheckUserInfo();
  late ModelCheckUserInfo modelCheckUserInfo;
  bool boolCheckUserInfo = false;
  Future getInfoUser()async{
    try{
      boolCheckUserInfo = false;
      String dataCheckInfo = await networkCheckUserInfo.getUserInfo(phoneNumber: "998489900");
      modelCheckUserInfo = ModelCheckUserInfo.fromJson(jsonDecode(dataCheckInfo));
      boolCheckUserInfo = true;

      notifyListeners();
    }catch(e){}
    // https://api.dtm.uz/v1/imtiyoz/check-data?imie=30309975270036
  }


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
        screen: const Privilege(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }
    else if (index == 5) {
      pushNewScreen(
        context,
        screen: const ChooseEdu(),
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
