import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/data/model_parse/person_info/check_user_info.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/m3_home/webview_window/webv_window.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/change_passport/change_password.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/phone_change.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/sheet_lang/lang_change.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

Widget myText() {
  var box = Hive.box("online");
  return box.get("language") == "1"
      ? Text("uz".tr())
      : box.get("language") == "2"
      ? Text("qq".tr())
      : Text("ru".tr());
}

late ModelCheckUserInfo modelCheckUserInfo;
Future<void> _makePhoneCall(String phoneNumber) async {

  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Widget bodyProfile({required BuildContext context,
  required Function function,
  required ProviderProfile providerProfile,
  required Function functions}) {
  var box = Hive.box("online");
  return Container(
    // height: MediaQuery
    //     .of(context)
    //     .size
    //     .height * 1.12,
    margin: const EdgeInsets.only(left: 10, right: 10),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(5),
                height: 125,
                width: 100,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: providerProfile.boolHasTokenNoImie
                          ? Image.asset("assets/images/icon_person.png",
                          height: 80, fit: BoxFit.fill)
                          : Image.memory(
                        base64Decode(box
                            .get("personImage")
                            .toString()
                            .replaceAll("\n", "")
                            .substring(23)
                            .trim()),
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(top:8.0, left: 8),
                          child: Icon(Icons.verified, color: Colors.teal,),
                        )),
                  ],
                ),
              ),

              const SizedBox(height: 5),
              providerProfile.boolHasTokenNoImie
                  ? const SizedBox.shrink()
                  : Text(
                providerProfile.dataGetImieInfo.lname +
                    " " +
                    providerProfile.dataGetImieInfo.fname +
                    " " +
                    providerProfile.dataGetImieInfo.mname,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Divider(
          color: Colors.teal.withOpacity(0.2),
          thickness: 2,
        ),
        MyWidgets.robotoFontText(
            text: "account".tr(),
            textColor: MyColors.appColorBlue1(),
            textSize: 20),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          onTap: () {
            // screenLock(
            //     context: context,
            //     correctString: "1234",
            //     canCancel: false,
            //     title: Text("SOBIR"),
            //     withBlur: true,
            //     didOpened: () {},
            //     retryDelay: const Duration(minutes: 2),
            //     didUnlocked: () {
            //       Navigator.of(context).pop();
            //     });

            if (box
                .get("personImage")
                .toString()
                .length > 50) {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => PersonInformation(
                        funcState: function,
                        windowIdPassport: "1",
                        idFunction: box
                            .get("personImage")
                            .toString()
                            .length > 50
                            ? "1"
                            : "99"),
                  ));

            } else {
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.noHeader,
                  animType: AnimType.bottomSlide,
                  body: GestureDetector(
                    onTap: () {
                      providerProfile.launchInBrowser(providerProfile.url);
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
                      color: MyColors.appColorBlack(),
                      fontWeight: FontWeight.bold),
                  btnOkOnPress: () {
                    Navigator.push(context,CupertinoPageRoute(builder: (context) =>  PersonInformation(
                        funcState: function,
                        idFunction:
                        box
                            .get("personImage")
                            .toString()
                            .length > 50
                            ? "1"
                            : "99",
                        windowIdPassport: "0"),));

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
            }
          },
          leading: Icon(
            Icons.person_pin_rounded,
            color: MyColors.appColorBlue1(),
          ),
          title: MyWidgets.robotoFontText(
            text: "personInformation".tr(),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.teal.shade800,
          ),
        ),
        ListTile(
          onTap: () {
            if (box
                .get("personImage")
                .toString()
                .length > 50) {
              Navigator.push(context,CupertinoPageRoute(builder: (context) => AddressInfo(funcState: function, addressWindowId: "1"),));

            } else {
              MyWidgets.awesomeDialogError(
                  context: context, valueText: "passportFillInfo".tr());
            }
          },
          leading: Icon(
            Icons.home,
            color: MyColors.appColorBlue1(),
          ),
          title: MyWidgets.robotoFontText(
            text: "addressAlways".tr(),
          ),
          trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.teal.shade800
          ),
        ),
        ListTile(
          onTap: () {
            if (box
                .get("personImage")
                .toString()
                .length > 50) {
              Navigator.push(context,CupertinoPageRoute(builder: (context) =>  Graduated(funcState: function, windowIdGraduated: "1"),));

            } else {
              MyWidgets.awesomeDialogError(
                  context: context, valueText: "passportFillInfo".tr());
            }
          },
          leading: Icon(
            Icons.school,
            color: MyColors.appColorBlue1(),
          ),
          title: MyWidgets.robotoFontText(
            text: "schoolInfo".tr(),
          ),
          trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.teal.shade800
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,CupertinoPageRoute(builder: (context) =>ChangePhoneNumber(
                providerProfile: providerProfile, function: functions) ,));
          },
          leading: Icon(
            Icons.phone,
            color: MyColors.appColorBlue1(),
          ),
          subtitle: MyWidgets.robotoFontText(
              text: box.get("phoneNumber").toString(),
              textSize: 14,
              textColor: MyColors.appColorGrey400(),
              textFontWeight: FontWeight.w100),
          title: MyWidgets.robotoFontText(
            text: "phoneNumberChange".tr(),
          ),
          trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.teal.shade800
          ),
        ),

        ListTile(
          onTap: () {
            Navigator.push(context,CupertinoPageRoute(builder: (context) =>  ChangeAccountPasswords(providerProfile: providerProfile),));
          },
          leading: Icon(
            Icons.lock,
            color: MyColors.appColorBlue1(),
          ),
          title: MyWidgets.robotoFontText(text: "changePassport".tr()),
          subtitle: MyWidgets.robotoFontText(
              text: "*******",
              textSize: 14,
              textColor: MyColors.appColorGrey400(),
              textFontWeight: FontWeight.w100),
          trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.teal.shade800
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Divider(
          color: Colors.teal.withOpacity(0.2),
          thickness: 1,
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,CupertinoPageRoute(builder: (context) => LangChangeAll(providerProfile: providerProfile) ,));
          },
          leading: Icon(
            Icons.language,
            color: MyColors.appColorBlue1(),
            size: 24,
          ),
          title: MyWidgets.robotoFontText(text: "languageApp".tr()),
          subtitle: myText(),
          trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.teal.shade800
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,CupertinoPageRoute(builder: (context) =>  WebViewWindow(

              modelServiceMainList: ServiceMainList(
                  id: "600000",
                  serviceName: "regionSection".tr(),
                  serviceText: "regionSection".tr(),
                  serviceTextRu: "regionSection".tr(),
                  serviceTextQQ: "regionSection".tr(),
                  serviceNameRu: "regionSection".tr(),
                  serviceNameQQ: "",
                  status: true,
                  mobilIcon: "",
                  link: "https://uzbmb.uz/page/representatives",
                  icon: "",
                  catId: "",
                  cod: "",
                  sortId: "",
                  createdAt: "",
                  updatedAt: "",
                  deleted: "") ,
            ),));

          },
          leading: Icon(
            Icons.person_pin_circle_outlined,
            color: MyColors.appColorBlue1(),
            size: 24,
          ),
          title: MyWidgets.robotoFontText(text: "regionSection".tr()),

          trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.teal.shade800
          ),
        ),
        ListTile(
          onTap: () {
            try{
              log("1223");
              _makePhoneCall("1195");
            }catch(e){
              log(e.toString());
            }
          },
          leading: Icon(
            Icons.phone,
            color: MyColors.appColorBlue1(),
            size: 24,
          ),
          title: MyWidgets.robotoFontText(text: "Call markaz"),

          trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.teal.shade800
          ),
        ),
        ListTile(
          onTap: () {
            _makePhoneCall("951991914");
          },
          leading: Icon(
            CupertinoIcons.phone,
            color: MyColors.appColorBlue1(),
            size: 24,
          ),
          title: MyWidgets.robotoFontText(text: "Ishonch telefoni"),

          trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.teal.shade800
          ),
        ),
        ListTile(
          onTap: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.noHeader,
              animType: AnimType.bottomSlide,
              title: "deleteAccount".tr(),
              desc: "deleteAccountText".tr(),
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              btnOkOnPress: () {
                providerProfile.launchDeleteAccountInBrowser();
                box.delete("token");
                box.delete("imie");
                box.delete("psnum");
                box.delete("personImage");
                box.delete("boxAllPersonInfo");
                box.delete("langLock");
                box.delete("lockScreen");
                box.delete("notShowAgain1");
                box.delete("phoneNumber");
                //
                Navigator.push(context,CupertinoPageRoute(builder: (context) => MainPages(homeIdMainpage: "0"),));
              },
              btnOkText: "yes".tr(),
              btnOkColor: MyColors.appColorBlue1(),
              btnCancelColor: MyColors.appColorGrey600(),
              btnCancelOnPress: () {},
              btnCancelText: "no".tr(),
            ).show();
          },
          leading: Icon(
            Icons.no_accounts_rounded,
            color: MyColors.appColorBlue1(),
            size: 24,
          ),
          title: MyWidgets.robotoFontText(text: "deleteAccount".tr()),
          trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.teal.shade800
          ),
        ),
        box
            .get("token")
            .toString()
            .length > 30
            ? ListTile(
          onTap: () {
            box
                .get("token")
                .toString()
                .length > 30
                ? AwesomeDialog(
              context: context,
              dialogType: DialogType.noHeader,
              animType: AnimType.bottomSlide,
              title: "BBA",
              desc: "logUot".tr(),
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              btnOkOnPress: () {
                box.delete("token");
                box.delete("imie");
                box.delete("psnum");
                box.delete("personImage");
                box.delete("boxAllPersonInfo");
                box.delete("langLock");
                box.delete("lockScreen");
                box.delete("notShowAgain1");
                box.delete("phoneNumber");

                // Navigator.pushAndRemoveUntil(
                //   context,
                //   CupertinoPageRoute(
                //       builder: (context) =>const EnterFirst()),
                //       (route) => false,
                // );
                Navigator.push(context,CupertinoPageRoute(builder: (context) => EnterFirst(windowIdEnterFirst: "1"),));

              },
              btnOkText: "yes".tr(),
              btnOkColor: MyColors.appColorBlue1(),
              btnCancelColor: MyColors.appColorGrey600(),
              btnCancelOnPress: () {},
              btnCancelText: "no".tr(),
            ).show()
                : {};
          },
          leading: Icon(
            Icons.logout,
            color: MyColors.appColorBlue1(),
            size: 24,
          ),
          title: MyWidgets.robotoFontText(text: "logOut1".tr()),
          trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.teal.shade800
          ),
        )
            : const SizedBox.shrink(),
        Divider(
          color: Colors.teal.withOpacity(0.2),
          thickness: 1,
        ),
         Row(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Text("${"versionMobil".tr()}: 4.5.12", style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 13)),
          ],
        ),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
      ],
    ),
  );
}
