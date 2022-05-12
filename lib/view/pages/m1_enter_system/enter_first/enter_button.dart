import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

Widget enterButton(
    {required BuildContext context,
    required ProviderEnterFirst providerEnterFirst}) {
  return Column(
    children: [
      MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {}, child: MyWidgets.robotoFontText(text: "Kirish")),
      const SizedBox(height: 20),
      MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {}, child: MyWidgets.robotoFontText(text: "reg")),
    ],
  );
}
