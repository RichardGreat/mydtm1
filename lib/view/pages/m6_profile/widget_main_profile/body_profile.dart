import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/change_passport/change_password.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/phone_change.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/sheet_lang/sheets_lang.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyProfile({required BuildContext context, required ProviderProfile providerProfile,  required Function functions}){
  var box = Hive.box("online");
  return SingleChildScrollView(
    child: Container(
      height: MediaQuery.of(context).size.height,
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
                child:
                providerProfile.boolHasTokenNoImie?Image.asset("assets/images/icon_person.png", height: 70, fit: BoxFit.fill):
                Image.memory(
                  base64Decode(
                      box.get("personImage").replaceAll("\n", "").toString().substring(23)),
                  fit: BoxFit.cover,
                  height: 90,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              providerProfile.boolHasTokenNoImie?const SizedBox.shrink():
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                MyWidgets.robotoFontText(text:providerProfile.dataGetImieInfo.lname),
                const SizedBox(height: 5),
                MyWidgets.robotoFontText(text:providerProfile.dataGetImieInfo.fname),
                  const SizedBox(height: 5),
                  MyWidgets.robotoFontText(text:providerProfile.dataGetImieInfo.mname),
              ],)
            ],
          ),
          Divider(
            color: MyColors.appColorGrey100(),
            thickness: 3,
          ),
          MyWidgets.robotoFontText(
              text: "Akaunt",
              textColor: MyColors.appColorBlue1(),
              textSize: 20),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen:  ChangePhoneNumber(providerProfile: providerProfile, function: functions),
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
              subtitle: MyWidgets.robotoFontText(text: box.get("phoneNumber"),textSize: 14,   textColor: MyColors.appColorGrey400(),

                  textFontWeight: FontWeight.w100),
           title : MyWidgets.robotoFontText(
                text: "Nomer o'zgatirish",
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
                screen:  ChangeAccountPasswords(providerProfile: providerProfile),
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
            subtitle: MyWidgets.robotoFontText(text: "*******",textSize: 14,   textColor: MyColors.appColorGrey400(),

                textFontWeight: FontWeight.w100),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: MyColors.appColorGrey400(),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          const Divider(
            thickness: 0.4,
          ),
          ListTile(
            onTap: () {
              sheetAppLanguageInterface(context: context, providerProfile: providerProfile);
            },
            leading: Icon(
              Icons.language,
              color: MyColors.appColorBlue1(),
              size: 24,
            ),
            title: MyWidgets.robotoFontText(text: "languageApp".tr()),
              subtitle: Text(""),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: MyColors.appColorGrey400(),
            ),
          ),
          Divider(
            color: MyColors.appColorGrey100(),
            thickness: 3,
          ),
        ],
      ),
    ),
  );
}