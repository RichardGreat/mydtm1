import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_uzbek/widgets/districts.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_uzbek/widgets/graduated_name.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_uzbek/widgets/region_sheet.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/input_pasport.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget graduatedUzbek(
    {required BuildContext context,
    required ProviderGraduated providerGradueted}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(
          text: "province".tr(), textColor: MyColors.appColorBlack(), textSize: 16),
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
                  text: providerGradueted.graduatedRegionName.length < 4
                      ? "choose".tr()
                      : providerGradueted.graduatedRegionName),
              const Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
        ),
        onTap: (){
          // graduatedEduTypeName = name;
          // graduatedEduTypeId = id;
          // graduatedRegionId = "";
          // graduatedRegionName = "";
          // graduatedDistrictName = "";
          // graduatedDistrictId = "";
          // graduatedEduId = "";
          // graduatedEduName = "";
          // graduatedEduYear = "";
          // graduatedEduSerNum = "";
          // textEditingSerNumber.text = "";
          // setGraduatedYear = "";
          providerGradueted.graduatedEduTypeName.length > 4?
          modelSheetProvinceGraduated(context: context, providerGraduated: providerGradueted):{};
        },
      ),
      const SizedBox(height: 10),

      ///
      MyWidgets.robotoFontText(
          text:"district".tr()
             ,
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
              MyWidgets.robotoFontText(text: providerGradueted.graduatedDistrictName.length < 4
                  ?  "choose".tr() : providerGradueted.graduatedDistrictName,),
              const Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
        ),
        onTap: (){
          providerGradueted.graduatedRegionName.length > 4?
          modelSheetGraduatedDistrict(context: context, providerGraduateds: providerGradueted):{};
        },

      ),
      const SizedBox(height: 10),

      ///
      MyWidgets.robotoFontText(
          text: "Muassasa",
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
              Flexible(
                child: Text(
                  providerGradueted.graduatedEduName.length < 4
                      ? "choose".tr()
                      : providerGradueted.graduatedEduName,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color:  MyColors.appColorBlack(),
                      fontSize:  16,
                      fontWeight:  FontWeight.normal,
                      fontFamily: 'Roboto-Medium'),
                ),
              ),

              const Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
        ),
        onTap: (){
          providerGradueted.graduatedDistrictName.length > 5?
          modelSheetGraduatedName(context: context, providerGraduated: providerGradueted):{};
        },
      ),
    ],
  );
}
