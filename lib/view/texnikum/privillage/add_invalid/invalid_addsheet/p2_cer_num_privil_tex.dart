import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/provider_add_invalide.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget privilegeCerNumTexnikum({required BuildContext context,  required ProviderAddInvalideTexnikum providerAddInvalideTexnikum}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("document".tr(),
          style: TextStyle(
              color: MyColors.appColorGrey600(),
              fontSize: 16)),
      const SizedBox(height: 5),
      TextFormField(
        controller: providerAddInvalideTexnikum
            .textEditingController,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        maxLength: 20,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefix: const SizedBox(width: 5),
          suffixIcon: GestureDetector(
            child: const Icon(Icons.clear, size: 12),
            onTap: () {
              providerAddInvalideTexnikum
                  .textEditingController
                  .clear();
            },
          ),
          contentPadding: const EdgeInsets.all(8),
          fillColor: Colors.white,
          filled: true,
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
          errorMaxLines: 2,
        ),
        validator: (validate) {
          if (validate.toString().length < 7) {
            return "docLength7".tr();
          } else {
            return "";
          }
        },
      ),
    ],
  );

}