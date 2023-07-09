import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/body_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bodyAriza1(
    {required BuildContext context, required ProviderAriza providerAriza}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const SizedBox(height: 5),
                Text(
                  "otmQabul".tr(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Divider(),
               const SizedBox(height: 10),
                /// ID RAQAM
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyWidgets.robotoFontText(text: "ID", textSize: 16),
                    MyWidgets.robotoFontText(
                        text: providerAriza.person.id.toString(),
                        textSize: 16),
                  ],
                ),
                const SizedBox(height: 10),
                /// FISH
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyWidgets.robotoFontText(
                        text: "fish".tr(), textSize: 16),
                    MyWidgets.robotoFontText(
                        text:
                            "${providerAriza.person.lname} ${providerAriza.person.fname}",
                        textSize: 14),
                  ],
                ),
                const SizedBox(height: 10),
                /// SAQLANGAN VAQT
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4 ,

                      child: MyWidgets.robotoFontText(
                          text: "saveDateTime".tr(), textSize: 16),
                    ),

                    MyWidgets.robotoFontText(
                        text: providerAriza.model.updatedAt
                            .toString()
                            .substring(0, 16),
                        textSize: 14),
                  ],
                ),
                const SizedBox(height: 15),
                /// TO'LOV
                ///

                providerAriza.boolBitiruvchi
                    ? const SizedBox.shrink():
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(
                      text: providerAriza.model.invoice.toString(),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Text(
                          "${"copy".tr()} ${providerAriza.model.invoice}",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        )));
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyWidgets.robotoFontText(
                              text: "numberInvoice".tr(), textSize: 16),

                         Row(children: [
                           const   Icon(Icons.copy, size: 15),
                           MyWidgets.robotoFontText(
                               text: providerAriza.model.serial
                                   .toString()
                                   .toString(),
                               textSize: 14),
                         ],),

                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyWidgets.robotoFontText(
                              text: "holat".tr(), textSize: 16),
                          providerAriza.boolBitiruvchi
                              ? const SizedBox.shrink()
                              : Container(
                                  height: 30,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: providerAriza.model.pay == 0
                                          ? MyColors.appColorRed()
                                          : MyColors.appColorBlue2()),
                                  child: Center(
                                    child: MyWidgets.robotoFontText(
                                            text: providerAriza.model.pay == 0
                                                ? "noPayed".tr()
                                                : "payed".tr(),
                                            textColor:
                                                MyColors.appColorWhite(),
                                            textFontWeight: FontWeight.w600,
                                            textSize: 15)
                                        .animate(
                                            onPlay: (controller) => controller
                                                .repeat(reverse: true))
                                        .scaleXY(
                                            end: 1,
                                            delay: const Duration(
                                                milliseconds: 3000),
                                            curve: Curves.linear)
                                        .shimmer(
                                            color:
                                                providerAriza.model.pay == 0
                                                    ? Colors.red
                                                    : Colors.blue,
                                            delay: const Duration(
                                                milliseconds: 3000))
                                        .elevation(end: 0),
                                  ),
                                ),
                        ],
                      ),
                      // const SizedBox(height: 5),
                      // MyWidgets.robotoFontText(
                      //     text: "editEdu".tr(),
                      //     textColor: MyColors.appColorBlack()),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      pushNewScreen(context,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                          screen: ArizaEnter(providerAriza: providerAriza));
                    },
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyColors.appColorBBA()),
                      child: Center(
                        child: MyWidgets.robotoFontText(
                                text: "viewInformation".tr(),
                                textColor: MyColors.appColorWhite(),
                                textFontWeight: FontWeight.w600,
                                textSize: 15)

                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
