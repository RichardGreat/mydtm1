import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/phone_change.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyProfile({required BuildContext context, required ProviderProfile providerProfile}){
  var box = Hive.box("online");
  List<Icon> myIcon = [
    Icon(
      CupertinoIcons.news_solid,
      color: MyColors.appColorBlue1(),
    ),
    Icon(
      Icons.book_outlined,
      color: MyColors.appColorBlue1(),
    ),
    Icon(
      Icons.settings,
      color: MyColors.appColorBlue1(),
    ),
    Icon(
      Icons.help,
      color: MyColors.appColorBlue1(),
    ),
    Icon(
      Icons.announcement_outlined,
      color: MyColors.appColorBlue1(),
    ),
    Icon(
      Icons.exit_to_app,
      color: MyColors.appColorBlue1(),
    ),
  ];

  List<String> myList = [
    "news".tr(),
    "advice".tr(),
    "settings".tr(),
    "help".tr(),
    "system_infor".tr(),
    "exet".tr(),
  ];

  return SingleChildScrollView(
    child: Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: MyColors.appColorWhite(),
                  radius: 50,
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(50), // Image radius
                    child: ClipOval(

                      child: box.get("personImage") == null
                         ?
                        Image.asset("assets/images/splash_picture.png")
                         : Image.memory(
                           base64Decode(
                               box.get("personImage").replaceAll("\n", "").toString().substring(23)),
                           fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     // MyWidgets.robotoFontText(
              //     //     text: providerAccount.modelAccountInfo.data.firstName +
              //     //         " " +
              //     //         providerAccount.modelAccountInfo.data.lastName,
              //     //     textSize: 20),
              //     // const SizedBox(
              //     //   height: 4,
              //     // ),
              //     // MyWidgets.appTextWithColor1(
              //     //     txt: "ID: 16758747 (Oddiy)",
              //     //     txtSize: 14,
              //     //     colorText: MyColors.appColorGrey400()),
              //     // const SizedBox(
              //     //   height: 10,
              //     // ),
              //   ],
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          // pushNewScreen(
                          //   context,
                          //   screen: const ChangeProfileName(),
                          //   withNavBar: false,
                          //   // OPTIONAL VALUE. True by default.
                          //   pageTransitionAnimation:
                          //   PageTransitionAnimation.cupertino,
                          // );
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 32,
                          color: MyColors.appColorBlue1(),
                        )),
                  ],
                ),
              )
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
                screen:  ChangePhoneNumber(providerProfile: providerProfile),
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
            title: MyWidgets.robotoFontText(text: box.get("phoneNumber")),
            subtitle: MyWidgets.robotoFontText(
                text: "nomer o'zgatirish",
                textColor: MyColors.appColorGrey400(),
                textSize: 14,
                textFontWeight: FontWeight.w100),
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
              // pushNewScreen(
              //   context,
              //   screen: const ChangePassword(),
              //   withNavBar: false,
              //   // OPTIONAL VALUE. True by default.
              //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
              // );
            },
            leading: Icon(
              Icons.lock,
              color: MyColors.appColorBlue1(),
              size: 24,
            ),
            title: MyWidgets.robotoFontText(text: "Parolni o'zgartish"),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: MyColors.appColorGrey400(),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            color: MyColors.appColorGrey100(),
            thickness: 3,
          ),
          const SizedBox(
            height: 4,
          ),
          MyWidgets.robotoFontText(
            text: "Foydali",
            textSize: 20,
            textColor: MyColors.appColorBlue1(),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                itemCount: myIcon.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      title: MyWidgets.robotoFontText(
                          text: myList[index], textFontWeight: FontWeight.w400),
                      leading: myIcon[index],
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: MyColors.appColorGrey400(),
                      ),
                    ),
                    Divider(
                      indent: 2,
                      color: MyColors.appColorGrey100(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ))
        ],
      ),
    ),
  );
}