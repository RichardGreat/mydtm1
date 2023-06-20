import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/body_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bodyAriza1(
    {required BuildContext context, required ProviderAriza providerAriza}) {
  return GestureDetector(
    child: Container(
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyColors.appColorWhite(),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: MyColors.appColorGrey400(),
                spreadRadius: 1,
                blurRadius: 1)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.18,
                  child: Image.asset(
                    "assets/images/icon_person.png",
                    height: 60,
                    width: 30,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              MyWidgets.robotoFontText(text: "ID ${providerAriza.person.id}"),
            ],
          ),
           Container(height: double.infinity, width: 2, color: Colors.grey. shade50),
          const SizedBox(width: 10),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // MyWidgets.robotoFontText(text: "otmQabul".tr()),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    "otmQabul".tr(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                ),
               const SizedBox(height: 10),
                MyWidgets.robotoFontText(
                    text: "время регистрации"
                        .toString()
                        .substring(0, 16),
                    textSize: 14),
                MyWidgets.robotoFontText(
                    text: providerAriza.model.updatedAt
                        .toString()
                        .substring(0, 16),
                    textSize: 14),
                const SizedBox(height: 20),
                providerAriza.boolBitiruvchi
                    ? const SizedBox.shrink()
                    : Container(
                        height: 45,
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: providerAriza.model.pay == 0
                                ? MyColors.appColorRed()
                                : MyColors.appColorGreen2()),
                        child: Center(
                          child: MyWidgets.robotoFontText(
                                  text: providerAriza.model.pay == 0
                                      ? "noPayed".tr()
                                      : "payed".tr(),
                                  textColor: MyColors.appColorWhite(),
                                  textFontWeight: FontWeight.w600,
                                  textSize: 15)
                              .animate(
                                  onPlay: (controller) =>
                                      controller.repeat(reverse: true))
                              .scaleXY(
                                  end: 1,
                                  delay: const Duration(milliseconds: 3000),
                                  curve: Curves.linear)
                              .shimmer(
                                  color: providerAriza.model.pay == 0
                                      ? Colors.red
                                      : Colors.green,
                                  delay: const Duration(milliseconds: 3000))
                              .elevation(end: 0),
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    ),
    onTap: () {
      pushNewScreen(context,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
          screen: ArizaEnter(providerAriza: providerAriza));
    },
  );
}
