import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/downloads.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/info_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bodyAriza(
    {required BuildContext context, required ProviderAriza providerAriza}) {
  return providerAriza.boolQaydVaraqaDownload
      ? Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              MyWidgets.robotoFontText(text: "applications".tr(), textSize: 24),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        downloads(context: context, providerAriza: providerAriza),
                        const SizedBox(height: 20),
                        infoAriza(context: context, providerAriza: providerAriza),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        )
      : MyWidgets.loaderDownload(context: context);
}
