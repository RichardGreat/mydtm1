import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/pages/person_info/address_info/sheet_district.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget districtChoose(
    {required BuildContext context,
    required ProviderAddressInfo providerAddressInfo}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(height: 10),
        MyWidgets.robotoFontText(text: "district".tr(), textSize: 15),
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
                            ? "choose".tr()
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
    ],);
}
