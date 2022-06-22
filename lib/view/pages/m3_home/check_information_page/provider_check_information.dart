import 'dart:convert';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
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
import 'package:url_launcher/url_launcher.dart';

class ProviderCheckInformation extends ChangeNotifier {
  List<ModelCheckInformationForDelete> myList = [
    ModelCheckInformationForDelete(
        id: 1, name: "personInformation".tr(), ),
    ModelCheckInformationForDelete(
        id: 2, name: "addressAlways".tr(),),
    ModelCheckInformationForDelete(id: 3, name: "schoolInfo".tr(),),
    ModelCheckInformationForDelete(id: 4, name: "certificates".tr(),),
    ModelCheckInformationForDelete(id: 5, name: "privileges".tr(),),
    ModelCheckInformationForDelete(
        id: 6, name: "chooseDirection".tr(), ),
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
      log(dataCheckInfo);
      modelCheckUserInfo =
          ModelCheckUserInfo.fromJson(jsonDecode(dataCheckInfo));

      boolCheckUserInfo = true;
      notifyListeners();
    } catch (e) {}
    // https://api.dtm.uz/v1/imtiyoz/check-data?imie=30309975270036
  }
  final Uri _url = Uri.parse("https://lex.uz/docs/-4396419");
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
        AwesomeDialog(
            context: context,
            dialogType: DialogType.NO_HEADER,
            animType: AnimType.BOTTOMSLIDE,
            title: "DTM",

            body: GestureDetector(
              onTap: (){
                _launchInBrowser(_url);
              },
              child: Container(
                margin:const  EdgeInsets.all(10),
                child: Text("personalInfoAccess".tr(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                  decoration: TextDecoration.underline,

                  fontWeight: FontWeight.w500, color: MyColors.appColorBlue1(), )),

              ),
            ),
            titleTextStyle: TextStyle(
                color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold, fontSize: 20),
            descTextStyle: TextStyle(
                color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),

           btnOkOnPress: (){
             pushNewScreen(
               context,
               screen: PersonInformation(funcState: func),
               withNavBar: false,
               pageTransitionAnimation: PageTransitionAnimation.cupertino,
             );
           },
            btnCancelOnPress: () {
            },
            btnCancelColor: MyColors.appColorBlue1(),
            btnCancelText: "notAgree".tr(),
            btnOkText: "iAgree".tr(),


        )
            .show();

      } else {
        MyWidgets.awesomeDialogError(
            context: context, valueText: "passportFillInfo".tr());
      }
    }
  }

  Future<void> inFoAferta(
      {required BuildContext context, required Function function}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Column(
            children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close))
            ],),
              SizedBox(height: 10),
              Text("requestExamTest".tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w600, )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.arrow_downward_outlined, size: 14, color: MyColors.appColorRed()),),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.arrow_downward_outlined, size: 14, color: MyColors.appColorRed()),),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.arrow_downward_outlined, size: 14, color: MyColors.appColorRed()),),
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
          content:
        SizedBox.expand(

          child:

        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
            child: ListBody(
              children: [

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
          ),)
        );
      },
    );
  }
  // final Uri urls = Uri.parse("https://lex.uz/docs/-4396419");
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
 


  // void _launchUrl() async {
  //   if (!await launchUrl(urls)) throw 'Sahifa ochilmadi $urls';
  // }
}

class ModelCheckInformationForDelete {
  String name;
  int id;

  ModelCheckInformationForDelete(
      {required this.id, required this.name,});

  factory ModelCheckInformationForDelete.fromJson(Map<String, dynamic> json) =>
      ModelCheckInformationForDelete(
          id: json["id"], name: json["name"],);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,

      };
}
