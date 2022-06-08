import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/provider_check_information.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/widgets/button_check_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyCheckInformation(
    {required BuildContext context,
    required ProviderCheckInformation providerCheckInformation,
    required String serviceName}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(text: serviceName, textSize: 20),
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
            providerCheckInformation.checkInfo(index: 0, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[0].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInformation.modelCheckUserInfo.person
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : Icon(Icons.error, color: MyColors.appColorRed()),
              ]),
        ),
      ),
      const SizedBox(height: 2),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(index: 1, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[1].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInformation.modelCheckUserInfo.personAddress
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : Icon(Icons.error, color: MyColors.appColorRed()),
              ]),
        ),
      ),
      const SizedBox(height: 2),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(index: 2, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[2].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInformation.modelCheckUserInfo.personGeneralEdu
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : Icon(Icons.error, color: MyColors.appColorRed()),
              ]),
        ),
      ),
      const SizedBox(height: 2),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(index: 3, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[3].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInformation.modelCheckUserInfo.certificate
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : Icon(Icons.error, color: MyColors.appColorRed()),
              ]),
        ),
      ),
      const SizedBox(height: 2),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(index: 4, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[4].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInformation.modelCheckUserInfo.imtiyoz
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : Icon(Icons.error, color: MyColors.appColorRed()),
              ]),
        ),
      ),
      const SizedBox(height: 2),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 0),
          onTap: () {
            providerCheckInformation.checkInfo(index: 5, context: context);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          leading: MyWidgets.robotoFontText(
              text: providerCheckInformation.myList[5].name),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                providerCheckInformation.modelCheckUserInfo.bakalavr
                    ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                    : Icon(Icons.error, color: MyColors.appColorRed()),
              ]),
        ),
      ),
      bottomCheckInfo(
          providerCheckInformation: providerCheckInformation, context: context)
    ],
  );
}
