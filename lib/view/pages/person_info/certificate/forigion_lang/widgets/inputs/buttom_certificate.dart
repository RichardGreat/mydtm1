import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget buttonCertificate({required BuildContext context, required ProviderCertificate providerCertificate}){
  return MaterialButton(
    height: 50,
    minWidth: double.infinity,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: MyColors.appColorBlue1(),
    onPressed: () {},
    child: MyWidgets.robotoFontText(
        text: "add".tr(), textColor: MyColors.appColorWhite()),
  );
}