import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/sertificate_service/service_page_sert/provider_sertificates.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget chooseButtons({required String sername,
  required String serid,
  required BuildContext context,
  required ProviderCertificateService providerCertificateService}) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        color: MyColors.appColorWhite(),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: MyColors.appColorGrey400())),
    child: MaterialButton(
      onPressed: () {
        if (providerCertificateService.certLangName.length > 4 &&
            providerCertificateService.certLangId.isNotEmpty
        ) {
          providerCertificateService.createCert(context: context,serName: sername, subId: serid);
        }

        /// task id ni olib arizaga otish kerak
        ///

        // Navigator.push(context, CupertinoPageRoute(builder: (context) => CertQaydVaraqaView(),));
        // providerCertificateService.createCert();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: MyColors.appColorBlue1(),
      child: Text(
        "access".tr(),
        style: TextStyle(color: MyColors.appColorWhite()),
      ),
    ),
  );
}
