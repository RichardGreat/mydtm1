import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/perevod/pages/old_edu/sheets/country_sheet.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget davlat({required BuildContext context, required ProviderOldEdu providerOldEdu}){
  return    Container(
    decoration: BoxDecoration(
        color: MyColors.appColorWhite(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )),
    child: ListTile(
      minVerticalPadding: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 4),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: MyWidgets.robotoFontText(
                      text: "oldEduCountry".tr(), textSize: 17)),
            ],
          ),
          providerOldEdu.restRegionNamePerevod.length > 4
              ? Icon(
            Icons.check_circle,
            color: MyColors.appColorGreen1(),
          )
              : const SizedBox.shrink()
        ],
      ),
      trailing:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Icon(Icons.arrow_forward_ios_sharp, size: 16),
        ],
      ),
      subtitle: Text(
        providerOldEdu.restRegionNamePerevod,
        maxLines: 1,
      ),
      onTap: () {
        modelSheetCountryPerevod(
            contexts: context, providerOldEdu: providerOldEdu);
        // sheetRegionTest(
        //     context: context, providerChooseEdu: providerChooseEdu);
      },
    ),
  );
}



// import 'package:flutter/material.dart';
// import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
// import 'package:mydtm/view/perevod/pages/old_edu/sheets/country_sheet.dart';
// import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
// import 'package:mydtm/view/widgets/colors/app_colors.dart';
// import 'package:easy_localization/easy_localization.dart';

// Widget davlat({required BuildContext context, required ProviderOldEdu providerOldEdu}){
//   return
// }