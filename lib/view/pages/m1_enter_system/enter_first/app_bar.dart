import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/model_sheet.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget enterFirstAppBar(
    {required BuildContext context,
    required ProviderEnterFirst providerEnterFirst}) {
  return AppBar(
    elevation: 0,
    backgroundColor: MyColors.appColorWhite(),
    actions: [
      GestureDetector(
        onTap: (){
          modelSheet(context: context, providerEnterFirst: providerEnterFirst);
        },
        child: Container(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
          margin: const EdgeInsets.only(left: 5, right: 4, bottom: 5, top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: MyColors.appColorGrey400())),
          child: Row(children: [
            Icon(
              Icons.language,
              color: MyColors.appColorBlue2(),
            ),
            MyWidgets.robotoFontText(text: "UZ")
          ]),
        ),
      )
    ],
  );
}
