import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/provider_add_invalide.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget privilegeDateBeginTexnikum({required BuildContext context,  required ProviderAddInvalideTexnikum providerAddInvalideTexnikum, required Function fffState}){
  return Column(mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const SizedBox(height: 5),
    Text(
      "documentDate".tr(),
      style: TextStyle(
          color: MyColors.appColorGrey600(),
          fontSize: 16),
    ),
    const SizedBox(height: 5),
    Card(
        child: ListTile(
          title: Text(providerAddInvalideTexnikum
              .invalidDate1.length >
              5
              ? providerAddInvalideTexnikum.invalidDate1
              : "documentDate".tr()),
          trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 17),
          onTap: () {
            providerAddInvalideTexnikum.selectDate(
                context: context, fff: fffState);
          },
        )),
    const SizedBox(height: 20),

  ],
  );

}