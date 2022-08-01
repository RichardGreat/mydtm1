import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/invalid_addsheet/sheet_add_type_texnikum.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/provider_add_invalide.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget privilegeTypeTexnikum({required BuildContext context,  required ProviderAddInvalideTexnikum providerAddInvalideTexnikum}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    const SizedBox(height: 20),
    Text(
      "invalidGroup".tr(),
      style: TextStyle(
          color: MyColors.appColorGrey600(),
          fontSize: 16),
    ),
    const SizedBox(height: 5),
    Card(
      child: ListTile(
        trailing: const Icon(
            Icons.arrow_forward_ios_sharp,
            size: 17),
        onTap: () {
          modelInvalidTypeTexnikum(
              context: context,
              providerAddInvalideTexnikum:
              providerAddInvalideTexnikum);
          // setState(() {});
        },
        title: Text(providerAddInvalideTexnikum
            .invalidType ==
            "1"
            ? "invalid1".tr()
            : providerAddInvalideTexnikum.invalidType ==
            "2"
            ? "invalid2".tr()
            : "invalidChooseGroup".tr(), ),
      ),
    ),
    const SizedBox(height: 20),
  ],);

}

// import 'package:flutter/material.dart';
// import 'package:mydtm/view/texnikum/privillage/invalid_addsheet/sheet_add_type_texnikum.dart';
// import 'package:mydtm/view/texnikum/privillage/provider_add_invalide.dart';
// import 'package:mydtm/view/widgets/colors/app_colors.dart';
// import 'package:easy_localization/easy_localization.dart';

// Widget privilegeTypeTexnikum({required BuildContext context,  required ProviderAddInvalideTexnikum providerAddInvalideTexnikum}){
//   return
//
// }