import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/provider_add_invalide.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget privilegeImageChooseTexnikum(
    {required BuildContext context,
    required ProviderAddInvalideTexnikum providerAddInvalideTexnikum,
    required Function fffState
    }) {

  var box = Hive.box("online");

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
      const SizedBox(height: 30),
      Container(
        color: MyColors.appColorGrey100(),
        height: 80,
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            providerAddInvalideTexnikum.addImageForeign(
                context: context,
                providerAddInvalideTexnikum: providerAddInvalideTexnikum,
                fff: fffState);
          },
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.appColorWhite()),
            child: Align(
              alignment: Alignment.topCenter,
              child: providerAddInvalideTexnikum.boolForeignImage
                  ? Image.memory(
                      base64Decode(
                          box.get("imageTexnikum").replaceAll("\n", "").toString()),
                      fit: BoxFit.cover,
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 10),
                        const Icon(Icons.image_search),
                        MyWidgets.robotoFontText(
                            text: "imageDoc".tr(), textSize: 14),
                        MyWidgets.robotoFontText(
                            text: "imageTypes".tr(),
                            textColor: MyColors.appColorGrey600(),
                            textSize: 14),
                      ],
                    ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 30),
    ],
  );
}
