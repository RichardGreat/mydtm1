import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/model_sheet/graduated_type.dart';
import 'package:mydtm/view/pages/person_info/gradueted/model_sheet/state_choose.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget constGraduated(
    {required BuildContext context,
    required ProviderGraduated providerGraduated}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(
          text: "Umumta'lim muassasi",
          textColor: MyColors.appColorBlack(),
          textSize: 32),
      MyWidgets.robotoFontText(
          text: "Barcha qatorlarni to'ldiring",
          textColor: MyColors.appColorGrey400(),
          textSize: 16),
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(
          text: "Mussasa turi",
          textColor: MyColors.appColorGrey400(),
          textSize: 16),
      const SizedBox(height: 4),
      GestureDetector(
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: MyColors.appColorGrey400()),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyWidgets.robotoFontText(
                  text: providerGraduated.graduatedName.length < 4
                      ? "Tanlang..."
                      : providerGraduated.graduatedName,

              textColor: providerGraduated.graduatedName.length < 4
                  ? MyColors.appColorGrey400()
                  : MyColors.appColorBlack()
              ),
              const Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
        ),
        onTap: () {
          modelSheetGraduatedType(
              context: context, providerGraduated: providerGraduated);
        },
      ),
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(
          text: "Davlat", textColor: MyColors.appColorGrey400(), textSize: 16),
      const SizedBox(height: 4),
      GestureDetector(
        onTap: (){
          modelSheetStateChoose(context: context, providerGraduated: providerGraduated);
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: MyColors.appColorGrey400()),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyWidgets.robotoFontText(text: "Tanlang..."),
              const Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
