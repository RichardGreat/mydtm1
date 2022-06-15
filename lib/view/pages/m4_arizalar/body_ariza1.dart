import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/body_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyAriza1(
    {required BuildContext context, required ProviderAriza providerAriza}) {
  return GestureDetector(
    child: Container(
      height: 150,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyColors.appColorWhite(),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: MyColors.appColorGrey400(), spreadRadius: 1, blurRadius: 1)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child:  Image.asset("assets/images/icon_person.png", height: 60,
                width: 30,
                fit:BoxFit.fitHeight,
                  ),),
          const SizedBox(width: 20),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyWidgets.robotoFontText(text: "Oliy ta'lim muassasalariga qabul"),
                const SizedBox(height: 10),
                MyWidgets.robotoFontText(text: "№ ${providerAriza.person.id}"),
                const SizedBox(height: 10),
                MyWidgets.robotoFontText(
                    text: providerAriza.model.updatedAt.toString().substring(0, 16),
                    textSize: 14),
                const SizedBox(height: 10),
                Container(


                  padding:const EdgeInsets.fromLTRB(10,5,10,5),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: providerAriza.model.pay == 0
                          ? MyColors.appColorRed()
                          : MyColors.appColorGreen2()),
                  child: Center(
                    child: MyWidgets.robotoFontText(
                        text: providerAriza.model.pay == 0
                            ? "To'lanmagan"
                            : "To'langan",
                        textColor: MyColors.appColorWhite(),
                    textSize: 14
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
    onTap: (){
      pushNewScreen(context, screen: ArizaEnter(providerAriza: providerAriza));
    },
  );
}
