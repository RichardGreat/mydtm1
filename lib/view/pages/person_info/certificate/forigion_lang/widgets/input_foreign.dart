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
    required ProviderCertificate providerCertificate}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(
          text: "addCertificate".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 30),
      langSelect(context: context, providerCertificate: providerCertificate),
      typeSelect(context: context, providerCertificate: providerCertificate),
      degreeSelect(context: context, providerCertificate: providerCertificate),
      dateSelect(context: context, providerCertificate: providerCertificate),
      certificateGetYear(context: context, providerCertificate: providerCertificate),
      imageCertificate(context: context, providerCertificate: providerCertificate),
      buttonCertificate(context: context, providerCertificate: providerCertificate)
    ],
  );
}
