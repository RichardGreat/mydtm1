import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget certificateGetSerNumberTexnikum(
    {required BuildContext context,
    required Function ff,
    required ProviderCertificateTexnikum providerCertificateTexnikum}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 25),
      MyWidgets.robotoFontText(
          text: "documentSerNum".tr(),
          textColor: MyColors.appColorBlack(),
          textSize: 16),
      const SizedBox(height: 4),
      TextFormField(
        controller: providerCertificateTexnikum.textForeignSertNumber,
        maxLines: 1,
        maxLength: 25,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 8, right: 8),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: MyColors.appColorWhite(),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: MyColors.appColorGrey400(),
              width: 1,
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
          errorMaxLines: 2,
        ),
        validator: (value3) {
          if (value3!.isEmpty || value3.length < 7) {
            // providerPersonInfo.boolPsNumber(boolNum: false);
            return "docLength7".tr();
          } else {
            // providerPersonInfo.boolPsNumber(boolNum: true);
            return null;
          }
        },
      ),

    ],
  );
}
