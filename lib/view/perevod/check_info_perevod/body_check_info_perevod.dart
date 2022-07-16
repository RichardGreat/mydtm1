import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/check_info_perevod/provider_check_perevod.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bodyCheckInfoPerevod(
    {required BuildContext context,
      required Function functions,
      required ProviderCheckInfoPerevod providerCheckInfoPerevod,
      required String serviceName}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(text: serviceName, textSize: 22),
      const SizedBox(height: 8),
      Text(
        "userService".tr(),
        style: TextStyle(
            color: MyColors.appColorGrey600(),
            fontSize: 17,
            fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 20),
      Container(
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInfoPerevod.checkInfo(
                providerCheckInfoPerevod: providerCheckInfoPerevod,
                index: 0,
                context: context,
                func: functions);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 14),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInfoPerevod.myList[0].name, textSize: 16),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInfoPerevod.modelCheckUserInfo.person
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : const SizedBox.shrink(),
              ]),
        ),
      ),
      const SizedBox(height: 2),
      Container(
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInfoPerevod.checkInfo(
                providerCheckInfoPerevod: providerCheckInfoPerevod,
                index: 1,
                context: context,
                func: functions);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 14),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  providerCheckInfoPerevod.myList[1].name,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: TextStyle(
                      color: MyColors.appColorBlack(),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto-Medium'),
                ),
              ),
            ],
          ),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInfoPerevod.modelCheckUserInfo.personAddress
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : const SizedBox.shrink(),
              ]),
        ),
      ),
      const SizedBox(height: 2),
      Container(
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInfoPerevod.checkInfo(
                providerCheckInfoPerevod: providerCheckInfoPerevod,
                index: 2,
                context: context,
                func: functions);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 14),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInfoPerevod.myList[2].name, textSize: 16),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInfoPerevod.modelCheckUserInfo.personGeneralEdu
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : const SizedBox.shrink(),
              ]),
        ),
      ),
      const SizedBox(height: 2),
      Container(
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInfoPerevod.checkInfo(
                providerCheckInfoPerevod: providerCheckInfoPerevod,
                index: 3,
                context: context,
                func: functions);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 14),
          leading: SizedBox(
            width: MediaQuery.of(context).size.width*0.6,
            child: MyWidgets.robotoFontText(
                text:  providerCheckInfoPerevod.myList[3].name, textSize: 16),
          ),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInfoPerevod.modelCheckUserInfo.certificate
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : const SizedBox.shrink(),
              ]),
        ),
      ),
      const SizedBox(height: 2),

      Container(
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInfoPerevod.checkInfo(
                providerCheckInfoPerevod: providerCheckInfoPerevod,
                index: 4,
                context: context,
                func: functions);
          },
          trailing: const Icon(
            Icons.arrow_forward_ios_sharp,
            size: 14,
          ),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInfoPerevod.myList[4].name, textSize: 16),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInfoPerevod.modelCheckUserInfo.bakalavr
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : const SizedBox.shrink(),
              ]),
        ),
      ),
      // providerCheckInfoPerevod.modelCheckUserInfo.person &&
      //     providerCheckInfoPerevod.modelCheckUserInfo.personAddress &&
      //     providerCheckInfoPerevod.modelCheckUserInfo.personGeneralEdu
      //     ?
      // bottomCheckInfo(
      //     providerCheckInformation: providerCheckInfoPerevod,
      //     context: context,
      //     functions1: functions
      // )
      //     : const SizedBox.shrink()
    ],
  );
}
