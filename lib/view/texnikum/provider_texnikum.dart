import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/texnikum/internet/check_info_user/check_user_texnikum.dart';
import 'package:mydtm/data/texnikum/internet/get_all_qayd.dart';
import 'package:mydtm/data/texnikum/models/get_all_qayd.dart';
import 'package:mydtm/data/texnikum/models/user_check/model_user_check.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:mydtm/view/texnikum/aerta_texnikum.dart';
import 'package:mydtm/view/texnikum/certificate/certificate_texnikum.dart';
import 'package:mydtm/view/texnikum/choose_edu/choose_edu_texnikum.dart';
import 'package:mydtm/view/texnikum/privillage/privillage_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

class ProviderTexnikum extends ChangeNotifier {
  NetworkCheckUserInfoTexnikum networkCheckUserInfoTexnikum =
      NetworkCheckUserInfoTexnikum();
  late ModelCheckUserInfoTexnikum modelCheckUserInfoTexnikum;
  bool boolDownloadTexnikum = false;

  Future checkAllInfoUser() async {
    try {
      boolDownloadTexnikum = false;
      String data = await networkCheckUserInfoTexnikum.getUserInfoTexnikum(
          phoneNumber: "");
      modelCheckUserInfoTexnikum =
          ModelCheckUserInfoTexnikum.fromJson(jsonDecode(data));
      boolDownloadTexnikum = true;
      notifyListeners();
    } catch (e) {throw Exception(e.toString());}
  }

  final Uri _url = Uri.parse("https://lex.uz/docs/-4396419");

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> inFoAferta(
      {required BuildContext context,
      required Function function,
      required ProviderTexnikum providerTexnikum}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 10),
            Text("requestExamTest".tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                )),
          ]),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: AfertaTexnikum(
                providerTexnikum: providerTexnikum, function: function),
          ),
        );
      },
    );
  }

  bool boolAfertaButton = false;

  Future getButtonColor({required bool myBool}) async {
    boolAfertaButton = myBool;
    // notifyListeners();
  }

  Future checkInfo(
      {required int index,
      required ProviderTexnikum providerTexnikum,
      required BuildContext context,
      required Function func}) async {
    if (modelCheckUserInfoTexnikum.person) {
      if (index == 0) {
        pushNewScreen(
          context,
          screen: PersonInformation(
              funcState: func, idFunction: "0", windowIdPassport: "1"),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      } else if (modelCheckUserInfoTexnikum.personAddress) {
        if (index == 1) {
          pushNewScreen(
            context,
            screen: AddressInfo(funcState: func, addressWindowId: "1"),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
        if (modelCheckUserInfoTexnikum.personGeneralEdu) {
          if (index == 2) {
            pushNewScreen(
              context,
              screen: Graduated(funcState: func, windowIdGraduated: "1"),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (index == 3) {
            pushNewScreen(
              context,
              screen: CertificateTexnikum(funcState: func),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (index == 4) {
            pushNewScreen(
              context,
              screen: PrivilegeTexnikum(funcState: func, windowId: "0"),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (index == 5) {
            // Navigator.of(context).pop();
            pushNewScreen(
              context,
              screen: const ChooseEduTexnikum(),
              //QaydVaraqaEdit(providerCheckInformation: widget.providerTexnikum),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
            // inFoAferta(
            //     context: context,
            //     function: func,
            //     providerTexnikum: providerTexnikum);
          }
        } else {
          if (index == 2) {
            pushNewScreen(
              context,
              screen: Graduated(funcState: func, windowIdGraduated: "0"),
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
            screen: AddressInfo(funcState: func, addressWindowId: "0"),
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
            dialogType: DialogType.noHeader,
            animType: AnimType.bottomSlide,
            body: GestureDetector(
              onTap: () {
                _launchInBrowser(_url);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Text("personalInfoAccess".tr(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      color: MyColors.appColorBlue1(),
                    )),
              ),
            ),
            titleTextStyle: TextStyle(
                color: MyColors.appColorBlue1(),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            descTextStyle: TextStyle(
                color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
            btnOkOnPress: () {
              pushNewScreen(
                context,
                screen: PersonInformation(
                    funcState: func, idFunction: "0", windowIdPassport: "0"),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            btnOkText: "iAgree".tr(),
            btnOkColor: MyColors.appColorBlue1(),
            btnCancel: MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: MyColors.appColorWhite(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "notAgree".tr(),
                style: TextStyle(color: MyColors.appColorBlack()),
              ),
            )).show();
      } else {
        MyWidgets.awesomeDialogError(
            context: context, valueText: "passportFillInfo".tr());
      }
    }
  }

  NetworkGetAllQaydTexnikum networkGetAllQaydTexnikum =
      NetworkGetAllQaydTexnikum();
  late ModelQaydVaraqaTexnikum modelQaydVaraqaTexnikum;

  bool boolQaydVaraqaGet = false;

  Future getAllData() async {
    try {
      boolQaydVaraqaGet = false;
      String data = await networkGetAllQaydTexnikum.getAllQaydTexnikum();
      modelQaydVaraqaTexnikum =
          ModelQaydVaraqaTexnikum.fromJson(jsonDecode(data));
      boolQaydVaraqaGet = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
