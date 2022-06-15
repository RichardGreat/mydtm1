import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget infoMoneyBilling(
    {required BuildContext context, required ProviderAriza providerAriza}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(text: "To'lov hoati bo'yicha"),
      const SizedBox(height: 20),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.appColorWhite(),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 1,
                  color: MyColors.appColorGrey400())
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: const Text("Invoys raqami"),
                onTap: () {},
                trailing: Text(providerAriza.model.invoice.toString())),
            ListTile(
              title: Text("Holati"),
              onTap: () {},
              trailing: Container(
                padding: const EdgeInsets.only(bottom: 4, top: 4, right: 8, left: 8),
                margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: providerAriza.model.pay == 0
                          ? MyColors.appColorRed()
                          : MyColors.appColorGreen2(),
                  borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text(providerAriza.model.pay == 0
                      ? "To'lanmagan"
                      : "To'langan".toString(),
                  style: TextStyle(color: MyColors.appColorWhite(), fontWeight: FontWeight.bold),
                  ), ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  "Eslatma! Test sinovlari uchun o’rnatilgan tartibda to’lovni amalga oshirmagan abituriyent test sinovlariga qo’yilmaydi."),
            ),
            MaterialButton(
              onPressed: () {},
              minWidth: double.infinity,
              child: MyWidgets.robotoFontText(
                  text: "To'lov haqida batafsil",
                  textSize: 15,
                  textColor: MyColors.appColorBlue1()),
            )

            // MyWidgets.robotoFontText(text: "Oliy ta'lim muassasalariga qabul"),
            // MyWidgets.robotoFontText(text: providerAriza.model.imie.toString()),
            // MyWidgets.robotoFontText(text: providerAriza.model.invoice.toString()),
            // MyWidgets.robotoFontText(text: providerAriza.model.status.toString()),
          ],
        ),
      ),
    ],
  );
}
