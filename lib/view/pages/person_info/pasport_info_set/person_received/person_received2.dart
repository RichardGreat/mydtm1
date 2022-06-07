import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget personReceived2(
    {required BuildContext context,
    required ProviderPersonInfo providerPersonInfo}) {
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
                      .substring(23))),
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyWidgets.robotoFontText(
                        text: "F.I.SH",
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
                        text: "Tug'ulgan sana",
                        textSize: 16,
                        textColor: MyColors.appColorGrey400()),
                    MyWidgets.robotoFontText(
                      text: providerPersonInfo.bdate.substring(0, 11),
                      textSize: 16,
                    ),
                    const SizedBox(height: 15),
                    MyWidgets.robotoFontText(
                        text: "Pasport seriya va raqam",
                        textSize: 16,
                        textColor: MyColors.appColorGrey400()),
                    MyWidgets.robotoFontText(
                      text: providerPersonInfo.psser + providerPersonInfo.psnum,
                      textSize: 16,
                    ),
                    const SizedBox(height: 15),
                    MyWidgets.robotoFontText(
                        text: "JShShIR",
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
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(15),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minWidth: double.infinity,
                color: MyColors.appColorBlue1(),
                onPressed: () {
                  log("123");
                      Navigator.of(context).pop();
                  // providerPersonInfo.getWindow(context: context);
                },
                height: 50,
                child: MyWidgets.robotoFontText(
                    text: "Tasdiqlash", textColor: MyColors.appColorWhite()),
              ),
            ),
          ))
        ],
      ));
}