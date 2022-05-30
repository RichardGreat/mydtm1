import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/pages/person_info/address_info/region_set_info/province.dart';
import 'package:mydtm/view/pages/person_info/address_info/region_set_info/district_choose.dart';
import 'package:mydtm/view/pages/person_info/address_info/sheet_district.dart';
import 'package:mydtm/view/pages/person_info/address_info/sheet_province.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
Widget regionSetInputs(
    {required BuildContext context,
    required ProviderAddressInfo providerAddressInfo}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      const SizedBox(height: 20),
      MyWidgets.robotoFontText(text: "state".tr(), textSize: 15),
      const SizedBox(height: 8),

      GestureDetector(
        onTap: () {
          providerAddressInfo.getRegion(
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
            Flexible(
              child: Text(
                providerAddressInfo.provinceName.length < 2
                    ? "Tanlang..."
                    : providerAddressInfo.provinceName,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 1,
                style: TextStyle(
                    color: providerAddressInfo.provinceName.length < 5
                        ? MyColors.appColorGrey400()
                        : MyColors.appColorBlack(),
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto-Medium'),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: MyColors.appColorBlack(),
              size: 32,
            )
          ]),
        ),
      ),

      Visibility(
          visible: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              province(context: context, providerAddressInfo: providerAddressInfo),
              districtChoose(
                  context: context, providerAddressInfo: providerAddressInfo),
            ],
          )),
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(text: "address".tr(), textSize: 15),
      const SizedBox(height: 8),
      TextFormField(
          controller: providerAddressInfo.txtEditControllerAddress,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          maxLines: 1,
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
            } else {
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
