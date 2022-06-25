import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/downloads/accessPapaer.dart';
import 'package:mydtm/view/pages/m4_arizalar/downloads/answerSheet.dart';
import 'package:mydtm/view/pages/m4_arizalar/downloads/qayd_varaqa.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:easy_localization/easy_localization.dart';

Widget downloads({required BuildContext context, required ProviderAriza providerAriza}){
  return    Container(
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
          title: Text("notePaper".tr(), style: TextStyle(color: MyColors.appColorBlack(),),),
          onTap: () {
            pushNewScreen(
              context,
              screen:   QaydVaraqaDownload(providerAriza: providerAriza),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          trailing:const  Icon(Icons.arrow_forward_ios_sharp, size: 16),
        ),
        ListTile(
          title: Text("accessPaper".tr(),style: TextStyle(color: MyColors.appColorBlack(),)),
          onTap: () {
            pushNewScreen(
              context,
              screen:    AccessPaperDownload(providerAriza: providerAriza),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          trailing: const  Icon(Icons.arrow_forward_ios_sharp, size: 16),
        ),
        ListTile(
          title: Text("answerSheet".tr(),style: TextStyle(color: MyColors.appColorBlack(), )),
          onTap: () {
            pushNewScreen(
              context,
              screen:  AnswerSheetDownload(providerAriza: providerAriza),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );

          },
          trailing:const   Icon(Icons.arrow_forward_ios_sharp, size: 16),
        )
      ],
    ),
  );
}