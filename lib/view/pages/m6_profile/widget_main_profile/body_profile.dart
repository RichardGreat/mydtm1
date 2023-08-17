import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/model_parse/person_info/check_user_info.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
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
  return Container(
    height: MediaQuery.of(context).size.height * 1.12,
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
                margin:const EdgeInsets.all(15),
                padding:const EdgeInsets.all(5),
                height: 120,
                width: 100,
                child: ClipRRect(
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

            if (box.get("personImage").toString().length > 50) {
              pushNewScreen(
                context,
                screen: PersonInformation(
                    funcState: function,
                    windowIdPassport: "1",
                    idFunction: box.get("personImage").toString().length > 50
                        ? "1"
                        : "99"),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
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
                    pushNewScreen(
                      context,
                      screen: PersonInformation(
                          funcState: function,
                          idFunction:
                              box.get("personImage").toString().length > 50
                                  ? "1"
                                  : "99",
                          windowIdPassport: "0"),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
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
            color: MyColors.appColorGrey400(),
          ),
        ),
        ListTile(
          onTap: () {
            if (box.get("personImage").toString().length > 50) {
              pushNewScreen(
                context,
                screen: AddressInfo(funcState: function, addressWindowId: "1"),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
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
            color: MyColors.appColorGrey400(),
          ),
        ),
        ListTile(
          onTap: () {
            if (box.get("personImage").toString().length > 50) {
              pushNewScreen(
                context,
                screen: Graduated(funcState: function, windowIdGraduated: "1"),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
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
              screen: ChangeAccountPasswords(providerProfile: providerProfile),
              withNavBar: false,
              // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
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
            color: MyColors.appColorGrey400(),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        ListTile(
          onTap: () {
            pushNewScreen(context,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
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
            size: 16,
            color: MyColors.appColorGrey400(),
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
                pushNewScreenWithRouteSettings(context,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    screen: MainPages(homeIdMainpage: "0"),
                    settings: const RouteSettings(),
                    withNavBar: false);
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
            color: MyColors.appColorGrey400(),
          ),
        ),
        box.get("token").toString().length > 30
            ? ListTile(
                onTap: () {
                  box.get("token").toString().length > 30
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
                            pushNewScreenWithRouteSettings(context,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                                screen: EnterFirst(windowIdEnterFirst: "1"),
                                settings: const RouteSettings(),
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
                  size: 16,
                  color: MyColors.appColorGrey400(),
                ),
              )
            : const SizedBox.shrink(),
        Divider(
          color: MyColors.appColorGrey100(),
          thickness: 1,
        ),
      ],
    ),
  );
}
