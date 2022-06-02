import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/provider_foriegn_lang.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/buttom_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/image_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/year_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/date_select.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/degree_select.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/select_lang.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/type_select.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget inputForeignCertificate(
    {required BuildContext context,
    required ProviderForeignLang providerForeignLang}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(
          text: "addCertificate".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 30),
      langSelect(context: context, providerForeignLang: providerForeignLang),
      typeSelect(context: context, providerForeignLang: providerForeignLang),
      degreeSelect(context: context, providerForeignLang: providerForeignLang),
      dateSelect(context: context, providerForeignLang: providerForeignLang),
      certificateGetYear(context: context, providerForeignLang: providerForeignLang),
      imageCertificate(context: context, providerForeignLang: providerForeignLang),
      buttonCertificate(context: context, providerForeignLang: providerForeignLang)
    ],
  );
}
