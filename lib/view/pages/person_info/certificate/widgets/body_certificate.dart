import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyCertificate(
    {required BuildContext context,
    required ProviderCertificate providerCertificate}) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(color: MyColors.appColorGrey100()),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        MyWidgets.robotoFontText(text: "Sertifikatlar", textSize: 25),
        const SizedBox(height: 20),
        GestureDetector(
            onTap: (){
                /// choose image
            },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: MyColors.appColorWhite(),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: MyWidgets.robotoFontText(
                    text: "Chet tili sertifiati qo'shish",
                    textColor: MyColors.appColorBlue1(),
                    textSize: 15)),
          ),
        )
      ],
    ),
  );
}
