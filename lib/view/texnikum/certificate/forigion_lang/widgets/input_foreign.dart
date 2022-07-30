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
import 'package:mydtm/view/texnikum/certificate/forigion_lang/widgets/inputs/buttom_certificate.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/widgets/inputs/date_select.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/widgets/inputs/degree_select.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/widgets/inputs/image_certificate.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/widgets/inputs/select_lang.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/widgets/inputs/type_select.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/widgets/inputs/year_certificate.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget inputForeignCertificateTexnikum(
    {required BuildContext context,
      required Function f,
      required Function f2,
    required ProviderCertificateTexnikum providerCertificateTexnikum}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(
          text: "addCertificate".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 30),
      langSelectTexnikum(ff:f,context: context, providerCertificateTexnikum: providerCertificateTexnikum),
      typeSelectTexnikum(ff:f,context: context, providerCertificateTexnikum: providerCertificateTexnikum),
      degreeSelectTexnikum(ff:f,context: context, providerCertificateTexnikum: providerCertificateTexnikum),
      dateSelectTexnikum(ff:f,context: context, providerCertificateTexnikum: providerCertificateTexnikum),
      certificateGetSerNumberTexnikum(ff:f,context: context, providerCertificateTexnikum: providerCertificateTexnikum),
      imageCertificateTexnikum(ff:f,context: context, providerCertificateTexnikum: providerCertificateTexnikum),
      buttonCertificateTexnikum(ff:f,
          ff2: f2,
          context: context, providerCertificateTexnikum: providerCertificateTexnikum)
    ],
  );
}
