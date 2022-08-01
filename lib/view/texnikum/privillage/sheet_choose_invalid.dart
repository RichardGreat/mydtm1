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

              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: MyColors.appColorBlue1(), width: 1)),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            pushNewScreen(context,
                                screen: InvalidAddTexnikum(titleName:  "Ko‘zi ojiz bo‘lgan shaxslar uchun imtiyoz", typeWindow: "1"),
                                pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                                withNavBar: false);
                          },
                          icon: Icon(Icons.add_a_photo_outlined,
                              color: MyColors.appColorBlue1(), size: 25)),
                      Text(
                        "Ko‘zi ojiz bo‘lgan shaxslar uchun imtiyoz",
                        style: TextStyle(color: MyColors.appColorBlue1()),
                      )
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: MyColors.appColorBlue1(), width: 1)),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            pushNewScreen(context,
                                screen: InvalidAddTexnikum( titleName:  "Kam taminlangan shaxslar uchun imtiyoz",typeWindow: "2"),
                                pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                                withNavBar: false);
                          },
                          icon: Icon(
                            Icons.add_photo_alternate_outlined,
                            color: MyColors.appColorBlue1(),
                            size: 25,
                          )),
                      Text(
                        "Kam taminlangan shaxslar uchun imtiyoz",
                        style: TextStyle(color: MyColors.appColorBlue1()),
                      )
                    ],
                  )),
              Container(),
            ],
          ),
        ],
      ),
    ),
  );
}
