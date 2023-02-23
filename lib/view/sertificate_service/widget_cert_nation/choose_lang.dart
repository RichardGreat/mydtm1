import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/sertificate_service/service_page_sert/provider_sertificates.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget chooseLanguages(
    {required ProviderCertificateService providerCertificateService,
    required BuildContext context,
    required String natCerId}) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        color: MyColors.appColorWhite(),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: MyColors.appColorGrey400())),
    child: ListTile(
      onTap: () {
        providerCertificateService.getLangCertificate(
            context: context,
            providerCertificateService: providerCertificateService,
            certId: natCerId
        );
      },
      leading: Text("chooseLangTest".tr()),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      horizontalTitleGap: 0,
    ),
  );
}
