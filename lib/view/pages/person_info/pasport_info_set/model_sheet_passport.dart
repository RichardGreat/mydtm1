import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

modelSheetPassportIdCard(
    {required BuildContext context,
    required ProviderPersonInfo providerPersonInfo}) {
  showModalBottomSheet<void>(
      isScrollControlled: true,

      enableDrag: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      context: context,
      builder: (BuildContext context) {
        return Container(


          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: BorderRadius.circular(10)
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyWidgets.robotoFontText(
                        text: "howToKnow".tr(), textSize: 22),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                          color: MyColors.appColorBlack(),
                        ))
                  ],
                ),

                const SizedBox(height: 10),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text("Biometrik pasport uchun",
                //       style: TextStyle(
                //           color: MyColors.appColorBlack(),
                //           fontWeight: FontWeight.bold)),
                // ),
                const SizedBox(height: 10),
                Image.asset("assets/images/passport.png", fit: BoxFit.cover),
                const SizedBox(height: 10),
                Divider(color: MyColors.appColorGrey400(), thickness: 10),
                // const SizedBox(height: 10),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text("ID karta uchun",
                //       style: TextStyle(
                //           color: MyColors.appColorBlack(),
                //           fontWeight: FontWeight.bold)),
                // ),
                // const SizedBox(height: 10),
                // Image.asset("assets/images/id_card.png",fit: BoxFit.cover),

              ],
            ),
          ),
        );
      });
}
