import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/model_parse/person_info/check_user_info.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/change_passport/change_password.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/phone_change.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/sheet_lang/lang_change.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget myText() {
  var box = Hive.box("online");
  return box.get("language") == "1"
      ? Text("uz".tr())
      : box.get("language") == "2"
          ? Text("qq".tr())
          : Text("ru".tr());
}
late ModelCheckUserInfo modelCheckUserInfo;
Widget bodyProfile(
    {required BuildContext context,
    required Function function,
    required ProviderProfile providerProfile,
    required Function functions}) {
  var box = Hive.box("online");
  return SingleChildScrollView(
    child: Container(
      height: MediaQuery.of(context).size.height * 1.12,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: MyColors.appColorWhite()),
                child: providerProfile.boolHasTokenNoImie
                    ? Image.asset("assets/images/icon_person.png",
                        height: 70, fit: BoxFit.fill)
                    : Image.memory(
                        base64Decode(box
                            .get("personImage")
                            .toString()
                            .replaceAll("\n", "")
                            .substring(23)
                            .trim()),
                        fit: BoxFit.cover,
                        height: 90,
                      ),
              ),
              const SizedBox(
                width: 20,
              ),
              providerProfile.boolHasTokenNoImie
                  ? const SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyWidgets.robotoFontText(
                            text: providerProfile.dataGetImieInfo.lname),
                        const SizedBox(height: 5),
                        MyWidgets.robotoFontText(
                            text: providerProfile.dataGetImieInfo.fname),
                        const SizedBox(height: 5),
                        MyWidgets.robotoFontText(
                            text: providerProfile.dataGetImieInfo.mname),
                      ],
                    )
            ],
          ),
          Divider(
            color: MyColors.appColorGrey100(),
            thickness: 3,
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

              pushNewScreen(
                context,
                screen: PersonInformation(
                    funcState: function,
                    idFunction:
                        box.get("imie").toString().length > 13 ? "1" : "99"),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            leading: Icon(
              Icons.person_pin_rounded,
              color: MyColors.appColorBlue1(),
              size: 24,
            ),
            title: MyWidgets.robotoFontText(
              text: "personInformation".tr(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: MyColors.appColorGrey400(),
            ),
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen: AddressInfo(funcState: function),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            leading: Icon(
              Icons.home,
              color: MyColors.appColorBlue1(),
              size: 24,
            ),
            title: MyWidgets.robotoFontText(
              text: "addressAlways".tr(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: MyColors.appColorGrey400(),
            ),
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen: Graduated(funcState: function, modelCheckUserInfo: modelCheckUserInfo),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            leading: Icon(
              Icons.school,
              color: MyColors.appColorBlue1(),
              size: 24,
            ),
            title: MyWidgets.robotoFontText(
              text: "schoolInfo".tr(),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: MyColors.appColorGrey400(),
            ),
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen: ChangePhoneNumber(
                    providerProfile: providerProfile, function: functions),
                withNavBar: false,
                // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            leading: Icon(
              Icons.phone,
              color: MyColors.appColorBlue1(),
              size: 24,
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
              color: MyColors.appColorGrey400(),
            ),
          ),
          const Divider(
            thickness: 0.4,
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen:
                    ChangeAccountPasswords(providerProfile: providerProfile),
                withNavBar: false,
                // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            leading: Icon(
              Icons.lock,
              color: MyColors.appColorBlue1(),
              size: 24,
            ),
            title: MyWidgets.robotoFontText(text: "changePassport".tr()),
            subtitle: MyWidgets.robotoFontText(
                text: "*******",
                textSize: 14,
                textColor: MyColors.appColorGrey400(),
                textFontWeight: FontWeight.w100),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: MyColors.appColorGrey400(),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          ListTile(
            onTap: () {
              pushNewScreen(context,
                  screen: LangChangeAll(providerProfile: providerProfile),
                  withNavBar: false);
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
              color: MyColors.appColorGrey400(),
            ),
          ),
          ListTile(
            onTap: () {
              box.get("token").toString().length > 30
                  ? AwesomeDialog(
                      context: context,
                      dialogType: DialogType.NO_HEADER,
                      animType: AnimType.BOTTOMSLIDE,
                      title: "DTM",
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
                        // box.delete("getEdInfo");
                        pushNewScreenWithRouteSettings(context,
                            screen: EnterFirst(),
                            settings: RouteSettings(),
                            withNavBar: false);
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
              color: MyColors.appColorGrey400(),
            ),
          ),
          Divider(
            color: MyColors.appColorGrey100(),
            thickness: 1,
          ),
        ],
      ),
    ),
  );
}
