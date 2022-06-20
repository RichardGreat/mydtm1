import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/person_info/check_user_info/check_user_info.dart';
import 'package:mydtm/data/model_parse/person_info/check_user_info.dart';
import 'package:mydtm/view/pages/otm/choose_edu.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/pages/person_info/certificate/certificates.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:mydtm/view/pages/person_info/privillage/privillage.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProviderCheckInformation extends ChangeNotifier {
  List<ModelCheckInformationForDelete> myList = [
    ModelCheckInformationForDelete(
        id: 1, name: "personInformation".tr(), status: 0),
    ModelCheckInformationForDelete(
        id: 2, name: "addressAlways".tr(), status: 0),
    ModelCheckInformationForDelete(id: 3, name: "schoolInfo".tr(), status: 1),
    ModelCheckInformationForDelete(id: 4, name: "certificates".tr(), status: 1),
    ModelCheckInformationForDelete(id: 5, name: "privileges".tr(), status: 1),
    ModelCheckInformationForDelete(
        id: 6, name: "chooseDirection".tr(), status: 1),
  ];

  NetworkCheckUserInfo networkCheckUserInfo = NetworkCheckUserInfo();
  late ModelCheckUserInfo modelCheckUserInfo;
  bool boolCheckUserInfo = false;
  var box = Hive.box("online");

  Future getInfoUser() async {
    try {
      boolCheckUserInfo = false;
      String dataCheckInfo = await networkCheckUserInfo.getUserInfo(
          phoneNumber: box.get("phoneNumber"));
      modelCheckUserInfo =
          ModelCheckUserInfo.fromJson(jsonDecode(dataCheckInfo));
      boolCheckUserInfo = true;
      notifyListeners();
    } catch (e) {}
    // https://api.dtm.uz/v1/imtiyoz/check-data?imie=30309975270036
  }

  Future checkInfo(
      {required int index,
      required BuildContext context,
      required Function func}) async {
    if (modelCheckUserInfo.person) {
      if (index == 0) {
        pushNewScreen(
          context,
          screen: PersonInformation(funcState: func),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      } else if (modelCheckUserInfo.personAddress) {
        if (index == 1) {
          pushNewScreen(
            context,
            screen: AddressInfo(funcState: func),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
        if (modelCheckUserInfo.personGeneralEdu) {
          if (index == 2) {
            pushNewScreen(
              context,
              screen: Graduated(funcState: func),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (index == 3) {
            pushNewScreen(
              context,
              screen: Certificates(funcState: func),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (index == 4) {
            pushNewScreen(
              context,
              screen: Privilege(funcState: func),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (index == 5) {
            // infoAferta(context: context, function: func);
            inFoAferta(context: context, function: func);
          }
        } else {
          if (index == 2) {
            pushNewScreen(
              context,
              screen: Graduated(funcState: func),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else {
            MyWidgets.awesomeDialogError(
                context: context, valueText: "eduEndSchool".tr());
          }
        }
      } else {
        if (index == 1) {
          pushNewScreen(
            context,
            screen: AddressInfo(funcState: func),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        } else {
          MyWidgets.awesomeDialogError(
              context: context, valueText: "addressFillInfo".tr());
        }
      }
    } else {
      if (index == 0) {
        pushNewScreen(
          context,
          screen: PersonInformation(funcState: func),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      } else {
        MyWidgets.awesomeDialogError(
            context: context, valueText: "passportFillInfo".tr());
      }
    }
  }

  //
  //
  // Future infoAferta({required BuildContext context, required Function function})async{
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: DialogType.NO_HEADER,
  //     animType: AnimType.BOTTOMSLIDE,
  //     title: "DTM",
  //     body: SingleChildScrollView(child: Container(
  //       margin: EdgeInsets.all(5),
  //       child: Column(
  //         children: [
  //           Text("requestExamTest".tr(),
  //               textAlign: TextAlign.center,
  //               style: TextStyle(fontWeight: FontWeight.w600, )),
  //           const SizedBox(height: 20),
  //           CheckboxListTile(value: false,
  //               title: Text("afertaAccept".tr()),
  //               onChanged:(val){
  //
  //               }),
  //           ListTile(title: Text("afertaAccept".tr(),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(fontWeight: FontWeight.w600), ),
  //           onTap: (){
  //             inFoAferta(context: context);
  //           },
  //           )
  //         ],
  //       ),)),
  //     titleTextStyle: TextStyle(
  //         color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
  //     descTextStyle: TextStyle(
  //         color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
  //
  //     btnCancelOnPress: () {},
  //
  //     btnOkOnPress: (){
  //
  //
  //     },
  //   )
  //       .show();
  // }

  Future<void> inFoAferta(
      {required BuildContext context, required Function function}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:          Text("requestExamTest".tr(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w600, )),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Align(
                    alignment: Alignment.bottomRight,
                  child: Icon(Icons.arrow_downward_outlined, size: 14, color: MyColors.appColorBlack()),),
                Text("aferta".tr()),
                MaterialButton(
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  color: MyColors.appColorBlue1(),
                  child: Text("afertaAccept".tr(), style: TextStyle(color: MyColors.appColorWhite())),
                  onPressed: () {
                    Navigator.of(context).pop();
                    pushNewScreen(
                      context,
                      screen: ChooseEdu(funcState: function),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );

                  },
                ),
              ],
            ),
          ),
        );
      },
    );
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
