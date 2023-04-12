import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mydtm/view/sertificate_service/qayd_varaqa/view_qayd_varaqa.dart';
import 'package:mydtm/view/sertificate_service/service_page_sert/provider_sertificates.dart';
import 'package:mydtm/view/sertificate_service/service_pages/sertificate_view.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget chooseButtons({
  required String sername,
  required String serid,
  required BuildContext context,
  required ProviderCertificateService providerCertificateService
}) {
  var box = Hive.box("online");
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        color: MyColors.appColorWhite(),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: MyColors.appColorGrey400())),
    child: MaterialButton(
      onPressed: () {
        pushNewScreen(context,
            pageTransitionAnimation:
            PageTransitionAnimation.cupertino,
            screen: CertificateApplication(
              serviceId: serid.toString(),
              certName: box.get("language") == "1"
                  ? sername
                  : box.get("language") == "2"
                  ? sername
                  : sername,
            ));
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
