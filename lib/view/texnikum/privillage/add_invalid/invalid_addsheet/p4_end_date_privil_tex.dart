import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/provider_add_invalide.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget privilegeEndDateTexnikum(
    {required BuildContext context,
    required ProviderAddInvalideTexnikum providerAddInvalideTexnikum,
    required Function fffState}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("dateInvalid".tr(),
          style: TextStyle(color: MyColors.appColorGrey600())),
      const SizedBox(height: 5),
      Card(
          child: ListTile(
        title: Text(providerAddInvalideTexnikum.invalidDate2.length > 5
            ? providerAddInvalideTexnikum.invalidDate2
            : "dateInvalid".tr()),
        trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 17),
        onTap: () {
          providerAddInvalideTexnikum.selectDate2(
              context: context, fff: fffState);
        },
      )),
      const SizedBox(height: 20),
    ],
  );
}
