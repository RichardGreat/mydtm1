import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
Widget dateSelectTexnikum({required BuildContext context, required Function ff,required ProviderCertificateTexnikum providerCertificateTexnikum}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [      const SizedBox(height: 25),
      MyWidgets.robotoFontText(
          text: "documentDate".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 16),
      const SizedBox(height: 6),
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            boxShadow: [BoxShadow(spreadRadius: 0.1, blurRadius: 0.1, color: MyColors.appColorGrey600())],
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: MyWidgets.robotoFontText(text: providerCertificateTexnikum.dateYearMonthDayTexnikum.length < 2 ? "choose".tr():providerCertificateTexnikum.dateYearMonthDayTexnikum),
          onTap: () async{
          providerCertificateTexnikum.selectDate(context: context, fff: ff);
          },
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          focusColor: MyColors.appColorWhite(),
          hoverColor: MyColors.appColorWhite(),
          trailing: const Icon(Icons.arrow_drop_down, size: 32),
        ),
      ),


    ],);
}