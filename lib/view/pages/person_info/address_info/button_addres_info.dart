import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'dart:developer';

Widget buttonAddressInfo(
    {required BuildContext context,
    required ProviderAddressInfo providerAddressInfo}) {
  // log((providerAddressInfo.boolAddressText &&
  //         providerAddressInfo.districtName.length > 4 &&
  //         providerAddressInfo.provinceName.length > 4)
  //     .toString());
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
        margin: const EdgeInsets.all(10),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context,CupertinoPageRoute(builder: (context) => const Graduated(),));

          },
          minWidth: double.infinity,
          color: providerAddressInfo.boolAddressText &&
                  providerAddressInfo.districtName.length > 4 &&
                  providerAddressInfo.provinceName.length > 4
              ? MyColors.appColorBlue1()
              : MyColors.appColorGrey400(),
          height: 50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: MyWidgets.robotoFontText(
              text: "Tasdiqlash", textColor: MyColors.appColorWhite()),
        )),
  );
}
