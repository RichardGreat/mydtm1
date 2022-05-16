import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/pages/person_info/address_info/sheet_district.dart';
import 'package:mydtm/view/pages/person_info/address_info/sheet_province.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget regionSetInputs(
    {required BuildContext context,
    required ProviderAddressInfo providerAddressInfo}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(text: "Viloyat", textSize: 15),
      const SizedBox(height: 8),
      GestureDetector(
        onTap: () {
          modelSheetProvince(
              context: context, providerAddressInfo: providerAddressInfo);
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: MyColors.appColorGrey400())),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
               MyWidgets.robotoFontText(
                text: providerAddressInfo.provinceName.length < 2
                    ? "Tanlang..."
                    : providerAddressInfo.provinceName,
                textSize: 16,
                textColor: providerAddressInfo.provinceName.length < 5
                    ? MyColors.appColorGrey400()
                    : MyColors.appColorBlack()),
                Icon(
              Icons.arrow_drop_down,
              color: MyColors.appColorBlack(),
              size: 32,
            )
          ]),
        ),
      ),
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(text: "Tuman", textSize: 15),
      const SizedBox(height: 8),
      GestureDetector(
        onTap: () {
          modelSheetDistrict(
              context: context, providerAddressInfo: providerAddressInfo);
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: MyColors.appColorGrey400())),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            MyWidgets.robotoFontText(
                text: providerAddressInfo.districtName.length < 5
                    ? "Tanlang..."
                    : providerAddressInfo.districtName,
                textSize: 16,
                textColor: providerAddressInfo.districtName.length < 5
                    ? MyColors.appColorGrey400()
                    : MyColors.appColorBlack()),
            Icon(
              Icons.arrow_drop_down,
              color: MyColors.appColorBlack(),
              size: 32,
            )
          ]),
        ),
      ),
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(text: "Manzil", textSize: 15),
      const SizedBox(height: 8),
      TextFormField(
          controller: providerAddressInfo.txtEditControllerAddress,
          keyboardType: TextInputType.multiline,
          autofocus: false,
          maxLines: 3,
          textAlignVertical: TextAlignVertical.center,
          maxLength: 100,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
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
          validator: (value) {
            if (value!.length < 5) {
              log("value!.length < 5");
              log("false");
              providerAddressInfo.boolAddress(boolAd: false);
              return "Manzilni kiriting";
            }else{
              log("value!.length > 5");
              log("true");
              providerAddressInfo.boolAddress(boolAd: true);
              return null;
            }
          }),
      const SizedBox(height: 20),

    ],
  );
}
