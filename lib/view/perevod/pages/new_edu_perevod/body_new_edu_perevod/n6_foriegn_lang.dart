import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/new_edu_sheet/n6_foriegn_lang_sheet.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget eduTestForeignLangNewPerevod({required BuildContext context, required ProviderNewEduPerevod providerNewEduPerevod}){

  return  Container(
    decoration: BoxDecoration(
      color: MyColors.appColorWhite(),
    ),
    child: ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyWidgets.robotoFontText(
              text: "chooseLangEmode".tr(), textSize: 17),
          providerNewEduPerevod.langNames.length > 4
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
      subtitle: Text(providerNewEduPerevod.langNames),
      onTap: () {
        modelSheetForeignLangPerevod(contexts: context, providerNewEduPerevod: providerNewEduPerevod);
        // sheetLanguageChooseTest(
        //     context: context, providerChooseEdu: providerChooseEdu);
      },
    ),
  );
}