import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
Widget dateSelect({required BuildContext context, required Function ff,required ProviderCertificate providerCertificate}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [      const SizedBox(height: 10),
      MyWidgets.robotoFontText(
          text: "Hujjat berilgan sana",
          textColor: MyColors.appColorBlack(),
          textSize: 16),
      const SizedBox(height: 10),
      Container(
        height: 50,
        decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: MyWidgets.robotoFontText(text: providerCertificate.dateYearMonthDay.length < 2? "choose".tr():providerCertificate.dateYearMonthDay),
          onTap: () async{
          providerCertificate.selectDate(context);
          },
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          focusColor: MyColors.appColorWhite(),
          hoverColor: MyColors.appColorWhite(),
          trailing: const Icon(Icons.arrow_drop_down, size: 32),
        ),
      ),
      const SizedBox(height: 10),

    ],);
}