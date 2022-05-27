import 'package:mydtm/view/pages/m3_home/check_information_page/provider_check_information.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bottomCheckInfo(
    {required ProviderCheckInformation providerCheckInformation,
      required BuildContext context
    }) {
  return Column(
    children: [
      const SizedBox(height: 20),
      MaterialButton(
        height: 50,
        minWidth: double.infinity,
        onPressed: () {
          for (var element in providerCheckInformation.myList) {
            if(element.status == 0){

             MyWidgets.awesomeDialogError(context: context, valueText: "noInfoCheck".tr());
             break;
            }
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color:  MyColors.appColorBlue1(),
        child: MyWidgets.robotoFontText(
            text: "Yuborish", textColor: MyColors.appColorWhite()),
      ),
      const SizedBox(height: 20),
    ],
  );
}