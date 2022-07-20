import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/image_to_pdf/image_to_pdf.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget hujjatRasm(
    {required BuildContext context, required ProviderOldEdu providerOldEdu}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
      color: MyColors.appColorWhite(),
    ),
    child: ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyWidgets.robotoFontText(text: "imageDoc".tr(), textSize: 17, textColor: providerOldEdu.graduatedYearNames.length > 4?MyColors.appColorBlack():MyColors.appColorGrey400()),
    providerOldEdu.boolConvertImageToPdf
              ? Icon(
                  Icons.check_circle,
                  color: MyColors.appColorGreen1(),
                )
              : const SizedBox.shrink()
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 16),
      onTap: () {

        providerOldEdu.graduatedYearNames.length > 4 ?
        pushNewScreen(context, screen: ImageToPdf(providerOldEdu: providerOldEdu), withNavBar: false):{};
// sheetLanguageChooseTest(
//     context: context, providerChooseEdu: providerChooseEdu);
      },
    ),
  );
}
