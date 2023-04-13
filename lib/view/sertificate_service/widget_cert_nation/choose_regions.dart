import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/view/sertificate_service/service_page_sert/provider_sertificates.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'dart:developer';

Widget chooseRegions(
    {required ProviderCertificateService providerCertificateService,
    required BuildContext context,
    required String natCerId
    }) {
  var box = Hive.box("online");
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        color: MyColors.appColorWhite(),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: MyColors.appColorGrey400())),
    child: ListTile(
      onTap: () {
        log(box.get("token"));
        log("12312");
        providerCertificateService.getDateServiceCertificate(
            context: context,
            providerCertificateService: providerCertificateService,
          natCertId: natCerId
        );
      },
      leading: Text(providerCertificateService.regName.isEmpty? "province".tr():providerCertificateService.regName),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      horizontalTitleGap: 1,
    ),
  );
}
