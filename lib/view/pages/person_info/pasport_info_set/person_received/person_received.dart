import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetPersonReceived(
    {required BuildContext context,
    required ProviderPersonInfo providerPersonInfo}) {
  showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                AppBar(
                  backgroundColor: MyColors.appColorWhite(),
                  elevation: 0,
                  iconTheme: IconThemeData(color: MyColors.appColorBlack()),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: MyColors.appColorRed2()),
                      child: Image.memory(
                        base64Decode((providerPersonInfo.image.replaceAll("n\'", "").substring(0,24))),
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyWidgets.robotoFontText(
                            text: "FISH",
                            textSize: 16,
                            textColor: MyColors.appColorGrey400()),
                        MyWidgets.robotoFontText(
                          text: "${providerPersonInfo.fname} ${providerPersonInfo.lname} ${providerPersonInfo.mname}",
                          textSize: 16,
                        ),
                        const SizedBox(height: 5),
                        MyWidgets.robotoFontText(
                            text: "Tug'ulgan sana",
                            textSize: 16,
                            textColor: MyColors.appColorGrey400()),
                        MyWidgets.robotoFontText(
                          text: providerPersonInfo.bdate,
                          textSize: 16,
                        ),
                        const SizedBox(height: 5),
                        MyWidgets.robotoFontText(
                            text: "Pasport seriya va raqam",
                            textSize: 16,
                            textColor: MyColors.appColorGrey400()),
                        MyWidgets.robotoFontText(
                          text: providerPersonInfo.psser +
                              providerPersonInfo.psnum,
                          textSize: 16,
                        ),
                        const SizedBox(height: 5),
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

                        providerPersonInfo.getWindow(context: context);

                      },
                      height: 50,
                      child: MyWidgets.robotoFontText(
                          text: "Tasdiqlash",
                          textColor: MyColors.appColorWhite()),
                    ),
                  ),
                ))
              ],
            ));
      });
}
