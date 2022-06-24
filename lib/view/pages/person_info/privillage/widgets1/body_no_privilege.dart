import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/privillage/provider_privilege.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyNoPrivilege({required BuildContext context, required ProviderPrivilege providerPrivilege}){
  return Container(
    margin:const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(text: "privileges".tr(), textSize: 28),
      const SizedBox(height: 15),
      Container(
        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        color: MyColors.appColorWhite(),
          boxShadow: [BoxShadow(color: MyColors.appColorGrey400(), spreadRadius: 0.5, blurRadius: 0.5)]
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const Icon(CupertinoIcons.info, size: 32),
        Text(
          "noPrivileges".tr(),
        maxLines: 3,
        style: TextStyle(
            color: MyColors.appColorBlack(),
            fontSize:  17,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto-Medium'),
      ),
        const Divider(),
        Text(
            "noPrivilegesText".tr(),
          maxLines: 6,
          softWrap: true,

          style: TextStyle(
              color: MyColors.appColorBlack(),
              fontSize:  17,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto-Medium'),
        )


      ],),)
    ],),
  );
}