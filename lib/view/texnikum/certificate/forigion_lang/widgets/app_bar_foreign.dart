import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarForeignLangTexnikum(
    {required BuildContext context,
    required ProviderCertificateTexnikum providerCertificateTexnikum}) {
  return AppBar(
    elevation: 0,
    backgroundColor: MyColors.appColorGrey100(),
    iconTheme: IconThemeData(color: MyColors.appColorBlack()),
  );
}
