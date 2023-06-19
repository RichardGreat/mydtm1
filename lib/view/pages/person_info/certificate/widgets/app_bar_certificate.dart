import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

PreferredSizeWidget appBarCertificate(
    {required BuildContext context,
    required ProviderCertificate providerCertificate}) {
  return AppBar(
    elevation: 0,
    title:    MyWidgets.robotoFontText(
        text: "certificate".tr(), textSize: 28),
    backgroundColor: MyColors.appColorGrey100(),
    iconTheme: IconThemeData(
      color: MyColors.appColorBlack(),
    ),
  );
}
