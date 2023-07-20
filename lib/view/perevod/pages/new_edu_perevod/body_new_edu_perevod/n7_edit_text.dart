import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget editInputPerevod(
    {required BuildContext context,
    required ProviderNewEduPerevod providerNewEduPerevod}) {
  return TextFormField(
    controller: providerNewEduPerevod.txtEduIzox,
    maxLines: 1,
    textAlignVertical: TextAlignVertical.center,
    maxLength: 100,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      suffixIcon: GestureDetector(
        child: const Icon(Icons.clear, size: 12),
        onTap: () {
          providerNewEduPerevod.txtEduIzox.clear();
        },
      ),
      fillColor: Colors.white,
      filled: true,
      hintText: "note".tr(),
      enabled: providerNewEduPerevod.dirNames.length > 4,
      focusedBorder: OutlineInputBorder(
        // borderRadius: const BorderRadius.only(
        //     bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
        borderSide: BorderSide(
          color: MyColors.appColorBlue1(),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        // borderRadius: const BorderRadius.only(
        //     bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
        borderSide: BorderSide(
          color: MyColors.appColorGrey100(),
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
        borderSide: BorderSide(
          color: MyColors.appColorGrey100(),
          width: 1.0,
        ),
      ),
      errorMaxLines: 2,
      errorStyle: TextStyle(
        color: MyColors.appColorRed(),
        fontWeight: FontWeight.w500,
      ),
      errorBorder: OutlineInputBorder(
        // borderRadius: const BorderRadius.only(
        //     bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
        borderSide: BorderSide(
          color: MyColors.appColorGrey100(),
          width: 1.0,
        ),
      ),
    ),
  );
}
