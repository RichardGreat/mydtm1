import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget imageCertificateTexnikum({required BuildContext context, required Function ff, required ProviderCertificateTexnikum providerCertificateTexnikum}){
  var box = Hive.box("online");
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [      const SizedBox(height: 10),
      GestureDetector(
        onTap: () {
          providerCertificateTexnikum.addImageForeign(
              context: context, providerCertificateTexnikum: providerCertificateTexnikum, fff: ff);
        },
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.appColorWhite()),
          child: Align(

            alignment: Alignment.topCenter,
            child: providerCertificateTexnikum.boolForeignImage? Image.memory(
              base64Decode(
                  box.get("image").replaceAll("\n", "").toString()),
              fit: BoxFit.cover,
            ): Column(
              children: [
                const SizedBox(height: 10),
                const Icon(Icons.image_search),
                MyWidgets.robotoFontText(text: "imageDoc".tr(), textSize: 14),
                MyWidgets.robotoFontText(
                    text: "imageTypes".tr(),
                    textColor: MyColors.appColorGrey600(),
                    textSize: 14),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),

    ],);
}