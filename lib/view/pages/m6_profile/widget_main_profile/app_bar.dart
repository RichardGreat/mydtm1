import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:easy_localization/easy_localization.dart';

PreferredSizeWidget appBarProfile(
    {required BuildContext context, required ProviderProfile providerProfile}) {
  var box = Hive.box("online");
  return AppBar(
    backgroundColor: MyColors.appColorWhite(),
    elevation: 0,
    title:     box.get("token").toString().length  > 30
        ? MyWidgets.robotoFontText(text: "personalInfo".tr(), textSize: 24):Text(""),
    actions: [
      box.get("token").toString().length  > 30
          ?
      IconButton(
          onPressed: () {
            AwesomeDialog(
                context: context,
                dialogType: DialogType.NO_HEADER,
                animType: AnimType.BOTTOMSLIDE,
                title: "DTM",
                desc: "logUot".tr(),

                titleTextStyle: TextStyle(
                    color: MyColors.appColorBlue1(),fontSize: 24, fontWeight: FontWeight.bold),
                descTextStyle: TextStyle(
                    color: MyColors.appColorBlack(), fontSize: 20, fontWeight: FontWeight.bold),
              btnOkOnPress:(){
                box.delete("token");
                pushNewScreenWithRouteSettings(context,
                    screen: EnterFirst(),
                    settings: RouteSettings(),
                    withNavBar: false);
              } ,
              btnOkText: "yes".tr(),
              btnCancelColor: MyColors.appColorGrey600(),
              btnCancelOnPress: () {

                },

                btnCancelText: "no".tr(),

            )
                .show();

          },
          icon: Icon(
            Icons.logout,
            color: MyColors.appColorBlack(),
          )):const SizedBox.shrink()
    ],
  );
}
