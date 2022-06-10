import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget infoAriza({required BuildContext context, required ProviderAriza providerAriza}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    MyWidgets.robotoFontText(
        text: "Ariza to'g'risida ma'lumot"),
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
              title:const Text("Ariza raqami"),
              onTap: () {},
              trailing:Text(providerAriza.person.psnum.toString())),
          ListTile(
            title: Text("Arizachi"),
            onTap: () {},
            trailing: Text(
                "${providerAriza.person.lname}.${providerAriza.person.fname.substring(0, 1)}.${providerAriza.person.mname.substring(0, 1)}"),
          ),
          ListTile(
              title: Text("Holati"),
              onTap: () {},
              trailing: Text(providerAriza.model.status == 1
                  ? "Tasdiqlandi"
                  : "Kutulmoqda")),
          ListTile(
            title:
            Text("Oxirgi o'zgartirish kiritilgan sana"),
            onTap: () {},
            trailing: Text(providerAriza.model.createdAt
                .toString()
                .substring(0, 11)),
          ),


          ListTile(
            title:
            Text("Test topshirish hududi"),
            onTap: () {},
            trailing: Text(providerAriza.model.tregion.toString()
            ),
          ),

          // MyWidgets.robotoFontText(text: "Oliy ta'lim muassasalariga qabul"),
          // MyWidgets.robotoFontText(text: providerAriza.model.imie.toString()),
          // MyWidgets.robotoFontText(text: providerAriza.model.invoice.toString()),
          // MyWidgets.robotoFontText(text: providerAriza.model.status.toString()),
        ],
      ),
    ),
  ],);
}