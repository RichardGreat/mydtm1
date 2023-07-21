import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget editMuassasa (
    {required BuildContext context, required ProviderOldEdu providerOldEdu}) {
  return Container(
    decoration: BoxDecoration(
      color: MyColors.appColorWhite(),
    ),
    child: Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: TextFormField(
          controller: providerOldEdu.textEditingEducation,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          maxLength: 100,
          keyboardType: TextInputType.text,
          enabled: providerOldEdu.getDirectionBool(),
          decoration: InputDecoration(
            hintText: "oldEduEduName".tr(),
            hintStyle: TextStyle(
                color: MyColors.appColorGrey400(),
                fontWeight: FontWeight.w500,
                fontSize: 17),
            suffixIcon: GestureDetector(
              child: const Icon(Icons.clear, size: 12),
              onTap: () {
                providerOldEdu.textEditingEducation.clear();
              },
            ),
            contentPadding: const EdgeInsets.all(8),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: MyColors.appColorBlue1(),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: MyColors.appColorGrey100(),
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: MyColors.appColorGrey100(),
                width: 2.0,
              ),
            ),
            errorMaxLines: 2,
            errorStyle: TextStyle(
              color: MyColors.appColorRed(),
              fontWeight: FontWeight.w500,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: MyColors.appColorGrey100(),
                width: 2.0,
              ),
            ),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: MyColors.appColorBackC4()),
            // ),
          ),
          validator: (value) {
            if (value.toString().length > 8) {}
            return null;
          },
      ),
    ),
  );
}
