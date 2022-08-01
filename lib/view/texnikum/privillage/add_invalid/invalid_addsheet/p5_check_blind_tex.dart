import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/provider_add_invalide.dart';

Widget privilegeCheckBlindTexnikum(
    {required BuildContext context,
    required ProviderAddInvalideTexnikum providerAddInvalideTexnikum}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: CheckboxListTile(
        onChanged: (val) {
          providerAddInvalideTexnikum.getBlind(isBlind: val!);
        },
        value: providerAddInvalideTexnikum.boolInvalidIsBlind,
        title: Text("blind".tr())),
  );
}
