import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget graduatedForeign(
    {required BuildContext context,
    required ProviderGraduated providerGraduated}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(
          text: "state".tr(),
          textColor: MyColors.appColorGrey400(),
          textSize: 16),
      const SizedBox(height: 4),
      GestureDetector(
        onTap: () {
          providerGraduated.getCountry(
              context: context, providerGraduated: providerGraduated);
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
              MyWidgets.robotoFontText(text: providerGraduated.graduatedCountryName .length < 5?
              "choose".tr():
              providerGraduated.graduatedCountryName
              ),
              const Icon(Icons.arrow_drop_down_outlined)
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(
          text: "gName".tr(),
          textColor: MyColors.appColorGrey400(),
          textSize: 16),
      const SizedBox(height: 4),
      TextFormField(
        controller: providerGraduated.txtControllerGraduatedName,
        maxLines: 1,
        maxLength: 30,

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
            return "Uzunlik 4 dan ko'p bo'lishi kerak";
          } else {
            // providerPersonInfo.boolPsNumber(boolNum: true);
            return null;
          }
        },
      ),
    ],
  );
}
