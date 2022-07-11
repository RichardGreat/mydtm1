import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_uzbek/widgets/districts.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_uzbek/widgets/region_sheet.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
bool functionUzbAnother({ required ProviderGraduated providerGradueted}){

  if(!providerGradueted.boolGraduatedType){

    if(providerGradueted.graduatedCountryId == "860"){
      return true;
    }
    else{
      return false;
    }
  }else{
    return true;
  }


}

Widget graduatedForeign(
    {required BuildContext context,
    required ProviderGraduated providerGradueted}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(
          text: "state".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 16),
      const SizedBox(height: 4),
      GestureDetector(
        onTap: () {
          providerGradueted.modelGraduatedInfo.data.graduatedYear.toString() ==
                  "2022"
              ? {}
              : providerGradueted.getCountry(
                  context: context, providerGraduated: providerGradueted);
          // modelSheetStateChoose(
          //     context: context, providerGraduated: providerGraduated);
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
  //             // setGraduatedYear = "";
  // String graduatedCountryId = "";
  // String graduatedCountryName = "";
              MyWidgets.robotoFontText(text: providerGradueted.graduatedCountryName .length < 5?
              "choose".tr():
              providerGradueted.graduatedCountryName
              ),
              const Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
        ),
      ),

      functionUzbAnother(providerGradueted: providerGradueted)?
      const SizedBox(height: 20)
          :const SizedBox.shrink(),
      functionUzbAnother(providerGradueted: providerGradueted)?
      MyWidgets.robotoFontText(
          text: "province".tr(), textColor: MyColors.appColorBlack(), textSize: 16):const SizedBox.shrink(),
      const SizedBox(height: 4),
      functionUzbAnother(providerGradueted: providerGradueted)?
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
                providerGradueted.modelGraduatedInfo.data.graduatedYear
                            .toString() ==
                        "2022"
                    ? {}
                    : providerGradueted.graduatedEduTypeName.length > 4
                        ? modelSheetProvinceGraduated(
                            context: context,
                            providerGraduated: providerGradueted)
                        : {};
              },
      ):const SizedBox.shrink(),
      functionUzbAnother(providerGradueted: providerGradueted)? const SizedBox(height: 20):const SizedBox.shrink(),
      ///
      functionUzbAnother(providerGradueted: providerGradueted)?
      MyWidgets.robotoFontText(
          text:"district".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 16):const SizedBox.shrink(),
      functionUzbAnother(providerGradueted: providerGradueted)?
      const SizedBox(height: 4):const SizedBox.shrink(),
      functionUzbAnother(providerGradueted: providerGradueted)?
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
        onTap: () {
                providerGradueted.modelGraduatedInfo.data.graduatedYear
                            .toString() ==
                        "2022"
                    ? {}
                    : providerGradueted.graduatedRegionName.length > 4
                        ? modelSheetGraduatedDistrict(
                            context: context,
                            providerGraduateds: providerGradueted)
                        : {};
              },

      ):const SizedBox.shrink(),
      functionUzbAnother(providerGradueted: providerGradueted)?
      const SizedBox(height: 10):const SizedBox.shrink(),
      providerGradueted.boolGraduatedType?
      MyWidgets.robotoFontText(
          text: "muassasa".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 16):const SizedBox.shrink(),
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(
          text: "gName".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 16),
      const SizedBox(height: 4),
      TextFormField(
        controller: providerGradueted.txtControllerGraduatedName,
        maxLines: 1,
        maxLength: 30,
        enabled: providerGradueted.modelGraduatedInfo.data.graduatedYear
                    .toString() ==
                "2022"
            ? false
            : true,
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          contentPadding: const EdgeInsets.only(left: 8, right: 8),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: MyColors.appColorGreen2(),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: MyColors.appColorGrey400(),
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: MyColors.appColorBlue1(),
              width: 1.5,
            ),
          ),
          errorStyle: TextStyle(
            color: MyColors.appColorRed(),
            fontWeight: FontWeight.w500,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: MyColors.appColorBlue1(),
              width: 1.5,
            ),
          ),
          // focusedBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: MyColors.appColorBackC4()),
          // ),
        ),
        validator: (value3) {
          if (value3!.isEmpty || value3.length < 4) {
            // providerPersonInfo.boolPsNumber(boolNum: false);
            return "length4".tr();
          } else {
            // providerPersonInfo.boolPsNumber(boolNum: true);
            return null;
          }
        },
      ),
    ],
  );
}
