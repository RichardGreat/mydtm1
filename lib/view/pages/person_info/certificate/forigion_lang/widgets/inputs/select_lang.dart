import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/sheets_lang/sheets_languages.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
Widget langSelect(
    {required BuildContext context,
    required ProviderCertificate providerCertificate, required Function ff}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(
          text: "Chet tili", textColor: MyColors.appColorBlack(), textSize: 15),
      const SizedBox(height: 6),
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: MyWidgets.robotoFontText(
              text: providerCertificate.certLangName.length < 4
                  ? "choose".tr()
                  : providerCertificate.certLangName),
          onTap: () {
            modelGetLang(
              fff: ff,
                context: context, providerCertificate: providerCertificate);


          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          focusColor: MyColors.appColorWhite(),
          hoverColor: MyColors.appColorWhite(),
          trailing: const Icon(Icons.arrow_drop_down, size: 32),
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
