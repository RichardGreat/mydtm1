import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/add_invalid.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget chooseInvalidType({required BuildContext context}) {
  return Center(
    child: Container(
      margin: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  pushNewScreen(context,
                      screen: InvalidAddTexnikum(
                          titleName: "privilegeEyeTexnikum".tr(),
                          typeWindow: "1"),
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                      withNavBar: false);
                },
                child: Container(height: 50,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColors.appColorWhite(),
                      boxShadow: [BoxShadow(color: MyColors
                          .appColorGrey600(),
                          spreadRadius: 1,
                          blurRadius: 1)
                      ]
                  ),child: Center(child: Text("privilegeEyeTexnikum".tr())),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  pushNewScreen(context,
                      screen: InvalidAddTexnikum(
                          titleName: "privilegeEyeTexnikum".tr(),
                          typeWindow: "2"),
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                      withNavBar: false);
                },
                child: Container(height: 50,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColors.appColorWhite(),
                      boxShadow: [BoxShadow(color: MyColors
                          .appColorGrey600(),
                          spreadRadius: 1,
                          blurRadius: 1)
                      ]
                  ),child: Center(child: Text("privilegeEyeTexnikum".tr())),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
