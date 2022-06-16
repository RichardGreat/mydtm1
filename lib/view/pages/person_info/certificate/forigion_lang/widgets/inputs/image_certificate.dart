import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget imageCertificate({required BuildContext context, required Function ff, required ProviderCertificate providerCertificate}){
  var box = Hive.box("online");
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [      const SizedBox(height: 10),
      GestureDetector(
        onTap: () {
          providerCertificate.addImageForeign(
              context: context, providerCertificate: providerCertificate, fff: ff);
        },
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.appColorWhite()),
          child: Align(
            alignment: Alignment.topCenter,
            child: providerCertificate.boolForeignImage? Image.memory(
              base64Decode(
                  box.get("image").replaceAll("\n", "").toString()),
              fit: BoxFit.cover,
            ): Column(
              children: [
                const SizedBox(height: 10),
                const Icon(Icons.image),
                MyWidgets.robotoFontText(text: "Hujjat rasmi", textSize: 14),
                MyWidgets.robotoFontText(
                    text: "jpg, png, 2 MBdan oshmasligi zarur",
                    textColor: MyColors.appColorGrey400(),
                    textSize: 14),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),

    ],);
}