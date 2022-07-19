import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/perevod/pages/old_edu/sheets/uzb_edu_sheet.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget muassasaNomi({required BuildContext context, required ProviderOldEdu providerOldEdu}){
  return          Container(
    decoration: BoxDecoration(
      color: MyColors.appColorWhite(),
    ),
    child: ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyWidgets.robotoFontText(
              text: "oldEduEduName".tr(), textSize: 17),
          providerOldEdu.eduUzbName.length > 4
              ? Icon(
            Icons.check_circle,
            color: MyColors.appColorGreen1(),
          )
              : const SizedBox.shrink()
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(height: 8),
          Icon(Icons.arrow_forward_ios_sharp, size: 16),
        ],
      ),
      subtitle: Text(providerOldEdu.eduUzbName),
      onTap: () {
        modelSheetUzbEduPerevod(
            contexts: context, providerOldEdu: providerOldEdu);
        // sheetLanguageChooseTest(
        //     context: context, providerChooseEdu: providerChooseEdu);
      },
    ),
  );
}