import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/sheet_certificate/sheet_lang_type.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget typeSelect({required BuildContext context,
  required Function ff,
  required ProviderCertificate providerCertificate}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [      const SizedBox(height: 25),

      MyWidgets.robotoFontText(
          text: "certType".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 15),
      const SizedBox(height: 6),
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            boxShadow: [BoxShadow(spreadRadius: 0.1, blurRadius: 0.1, color: MyColors.appColorGrey600())],
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: MyWidgets.robotoFontText(text:providerCertificate.langTypeNames.length < 2 ?"choose".tr():providerCertificate.langTypeNames),
          onTap: (){
            modelGetLangType( f: ff,context: context, providerCertificate: providerCertificate);
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