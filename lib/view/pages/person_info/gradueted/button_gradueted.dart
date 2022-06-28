import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/person_info/check_user_info.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';

Widget buttonGraduated(
    {required BuildContext context,
      required Function function,
      required ModelCheckUserInfo modelCheckUserInfo,
    required ProviderGraduated providerGradueted}) {
  return MaterialButton(
    minWidth: double.infinity,
    height: 50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: MyColors.appColorBlue1(),
    onPressed: () {

      providerGradueted.formKeyGraduated.currentState!.validate();
      log(providerGradueted.graduatedEduTypeId);
      log(providerGradueted.textEditingSerNumber.text);
      log(providerGradueted.setGraduatedYear.length.toString());
      if (providerGradueted.graduatedEduTypeId == "4" &&
          providerGradueted.textEditingSerNumber.text.length >= 6) {
        if(providerGradueted.txtControllerGraduatedName.text.length >= 4){
          /// Chet el
          log("Chet el server");
          providerGradueted.sentServerGraduatedAll(
            functions: function,
            modelCheckUserInfo: modelCheckUserInfo,
              context: context,
              eduType: providerGradueted.graduatedEduTypeId,
              regionId: providerGradueted.graduatedRegionId,
              districtId: providerGradueted.graduatedDistrictId,
              eduListId:  providerGradueted.graduatedEduId,
              graduatedYear: providerGradueted.setGraduatedYear,
              docSerNum: providerGradueted.textEditingSerNumber.text,
              eduName: providerGradueted.txtControllerGraduatedName.text,
              countryId: providerGradueted.graduatedCountryId);
        }

      } else {
        /// o'zbek
        if(providerGradueted.setGraduatedYear.length >= 3 &&
            providerGradueted.textEditingSerNumber.text.length >= 5){
  log("o'zbek server");
  providerGradueted.sentServerGraduatedAll(
      // graduatedEduId
      // graduatedEduName
    modelCheckUserInfo: modelCheckUserInfo,
      functions: function,
      context: context,
      eduType: providerGradueted.graduatedEduTypeId,
      regionId: providerGradueted.graduatedRegionId,
      districtId: providerGradueted.graduatedDistrictId,
      eduListId:  providerGradueted.graduatedEduId,
      graduatedYear: providerGradueted.setGraduatedYear,
      docSerNum: providerGradueted.textEditingSerNumber.text,
      eduName: providerGradueted.graduatedEduName,
      countryId: "860");
        }
      }
      // Navigator.push(
      //     context,
      //     CupertinoPageRoute(
      //       builder: (context) => const MainPages(),
      //     ));
    },
    child: MyWidgets.robotoFontText(
        text: "access".tr(), textColor: MyColors.appColorWhite()),
  );
}
