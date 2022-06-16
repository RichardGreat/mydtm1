import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/buttom_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/date_select.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/degree_select.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/image_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/select_lang.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/type_select.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/inputs/year_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget inputForeignCertificate(
    {required BuildContext context,
      required Function f,
    required ProviderCertificate providerCertificate}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(
          text: "addCertificate".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 30),
      langSelect(ff:f,context: context, providerCertificate: providerCertificate),
      typeSelect(ff:f,context: context, providerCertificate: providerCertificate),
      degreeSelect(ff:f,context: context, providerCertificate: providerCertificate),
      dateSelect(ff:f,context: context, providerCertificate: providerCertificate),
      certificateGetSerNumber(ff:f,context: context, providerCertificate: providerCertificate),
      imageCertificate(ff:f,context: context, providerCertificate: providerCertificate),
      buttonCertificate(ff:f,context: context, providerCertificate: providerCertificate)
    ],
  );
}
