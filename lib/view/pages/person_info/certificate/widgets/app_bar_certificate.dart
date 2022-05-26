import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarCertificate(
    {required BuildContext context,
    required ProviderCertificate providerCertificate}) {
  return AppBar(
    elevation: 0,
    backgroundColor: MyColors.appColorWhite(),
    iconTheme: IconThemeData(
      color: MyColors.appColorBlack(),
    ),
  );
}
