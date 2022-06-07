import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/provider_check_information.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/widgets/button_check_info.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/pages/person_info/certificate/certificates.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/foreigion_lang_add.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyCheckInformation(
    {required BuildContext context,
    required ProviderCheckInformation providerCheckInformation,
    required String serviceName}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(text: serviceName, textSize: 22),
      const SizedBox(height: 20),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(
                index: 0, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[0].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ providerCheckInformation.modelCheckUserInfo.person ?

          Icon(Icons.check_circle, color: MyColors.appColorGreen1())
              :
          Icon(Icons.error, color: MyColors.appColorRed()),]),

        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(
                index: 1, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[1].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ providerCheckInformation.modelCheckUserInfo.personAddress ?

              Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                  :
              Icon(Icons.error, color: MyColors.appColorRed()),]),

        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(
                index: 2, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[2].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ providerCheckInformation.modelCheckUserInfo.personGeneralEdu ?

              Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                  :
              Icon(Icons.error, color: MyColors.appColorRed()),]),

        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(
                index: 3, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[3].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ providerCheckInformation.modelCheckUserInfo.certificate ?

              Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                  :
              Icon(Icons.error, color: MyColors.appColorRed()),]),

        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(
                index: 4, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[4].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ providerCheckInformation.modelCheckUserInfo.imtiyoz ?

              Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                  :
              Icon(Icons.error, color: MyColors.appColorRed()),]),

        ),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(
                index: 5, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[5].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ providerCheckInformation.modelCheckUserInfo.bakalavr ?

              Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                  :
              Icon(Icons.error, color: MyColors.appColorRed()),]),

        ),
      ),
      bottomCheckInfo(providerCheckInformation: providerCheckInformation, context: context)
    ],
  );
}
