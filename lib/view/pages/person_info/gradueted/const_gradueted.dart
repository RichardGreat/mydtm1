import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
Widget constGraduated(
    {required BuildContext context,
    required ProviderGraduated providerGraduated}) {
  return StatefulBuilder(builder: (context, setState) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(
          text: "graduated".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 32),
      MyWidgets.robotoFontText(
          text: "fillAll".tr(),
          textColor: MyColors.appColorGrey400(),
          textSize: 16),
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(
          text: "gType".tr(),
          textColor: MyColors.appColorBlack(),
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
              SizedBox(

                child: MyWidgets.robotoFontText(
                    text: providerGraduated.graduatedEduTypeName.length < 4
                        ? "choose".tr()
                        : providerGraduated.graduatedEduTypeName ,
                    textColor: providerGraduated.graduatedEduTypeName .length < 4
                        ? MyColors.appColorGrey400()
                        : MyColors.appColorBlack()),
                width: MediaQuery.of(context).size.width*0.7,
              ),
              const Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
        ),
        onTap: () {
          setState((){});
          providerGraduated.modelGraduatedInfo.data.graduatedYear.toString()=="2022"?{}:
          providerGraduated.getGraduatedType(
              context: context, providerGraduated: providerGraduated);
        },
      ),

    ],
  ),)

    ;
}
