import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/new_edu_sheet/n4_edu_sheet.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget eduNewPerevod(
    {required BuildContext context,
    required ProviderNewEduPerevod providerNewEduPerevod}) {
  return Container(
    decoration: BoxDecoration(
      color: MyColors.appColorWhite(),
    ),
    child: ListTile(
      minVerticalPadding: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 4),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyWidgets.robotoFontText(
                      text: "oliytalim".tr(),
                      textSize: 17,
                      textColor: providerNewEduPerevod.langNames.length > 4
                          ? MyColors.appColorBlack()
                          : MyColors.appColorGrey400())),
            ],
          ),
          providerNewEduPerevod.eduNames.length > 4
              ? Icon(
                  Icons.check_circle,
                  color: MyColors.appColorGreen1(),
                )
              : const SizedBox.shrink()
        ],
      ),
      trailing: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          SizedBox(height: 8),
          Icon(Icons.arrow_forward_ios_sharp, size: 16),
        ],
      ),
      subtitle: Text(providerNewEduPerevod.eduNames, maxLines: 1),
      onTap: () {
        providerNewEduPerevod.langNames.length > 4
            ? modelSheetEduPerevod(
                contexts: context, providerNewEduPerevod: providerNewEduPerevod)
            : {};
        // sheetRegionTest(
        //     context: context, providerChooseEdu: providerChooseEdu);
      },
    ),
  );
}
