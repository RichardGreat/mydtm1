import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget infoAriza(
    {required BuildContext context, required ProviderAriza providerAriza}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(text: "aboutApplication".tr()),
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
                  color: Colors.teal.withOpacity(0.5))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: Text("numberApplication".tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: MyColors.appColorBlack())),
                onTap: () {},
                trailing: Text(
                  providerAriza.person.id.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                )),
            ListTile(
              title: Text("applicent".tr()),
              onTap: () {},
              trailing: Text(
                  "${providerAriza.person.lname}.${providerAriza.person.fname.substring(0, 1)}.${providerAriza.person.mname.substring(0, 1)}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: MyColors.appColorBlack())),
            ),
            ListTile(
                title: Text("holat".tr()),
                onTap: () {},
                trailing: Text(
                  providerAriza.model.status == 1
                      ? "accessed".tr()
                      : "waiting".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                )),
            ListTile(
              title:
               Text("lastChange".tr()),
              onTap: () {},
              trailing: Text(
                providerAriza.model.createdAt.toString().substring(0, 11),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),

            ListTile(
              title: Text("testRegion".tr()),
              onTap: () {},
              trailing: Text(
                providerAriza.model.tregion.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),

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
