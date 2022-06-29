import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_received/passport_againperson_received.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
Widget personReceived2(
    {required BuildContext context,
    required ProviderPersonInfo providerPersonInfo,

    }) {
  return Container(

      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: MyColors.appColorWhite()),
                child: Image.memory(
                  base64Decode((providerPersonInfo.image
                      .replaceAll("\n", "")
                      .substring(23).trim())),
                  height: 100,
                  fit: BoxFit.cover,

                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyWidgets.robotoFontText(
                        text: "fish".tr(),
                        textSize: 16,
                        textColor: MyColors.appColorGrey400()),
                    Text(
                      "${providerPersonInfo.fname} ${providerPersonInfo.lname} ${providerPersonInfo.mname}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                          color: MyColors.appColorBlack(),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Medium'),
                    ),
                    const SizedBox(height: 15),
                    MyWidgets.robotoFontText(
                        text: "bDate".tr(),
                        textSize: 16,
                        textColor: MyColors.appColorGrey400()),
                    MyWidgets.robotoFontText(
                      text: providerPersonInfo.bdate.substring(0, 11),
                      textSize: 16,
                    ),
                    const SizedBox(height: 15),
                    MyWidgets.robotoFontText(
                        text: "passport".tr(),
                        textSize: 16,
                        textColor: MyColors.appColorGrey400()),
                    MyWidgets.robotoFontText(
                      text: providerPersonInfo.psser + providerPersonInfo.psnum,
                      textSize: 16,
                    ),
                    const SizedBox(height: 15),
                    MyWidgets.robotoFontText(
                        text: "personCode".tr(),
                        textSize: 16,
                        textColor: MyColors.appColorGrey400()),
                    MyWidgets.robotoFontText(
                      text: providerPersonInfo.imie,
                      textSize: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
          margin: const EdgeInsets.all(15),
              child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            minWidth: double.infinity,
            color: MyColors.appColorBlue1(),
            onPressed: () {

              modelSheetPersonReceived(context: context, providerPersonInfo: providerPersonInfo, imie: providerPersonInfo.imie );
              // providerPersonInfo.getWindow(context: context);
            },
            height: 50,
            child: MyWidgets.robotoFontText(
                text: "passportAgain".tr(), textColor: MyColors.appColorWhite()),
          ),
            ),
          ),

        ],
      ));
}
