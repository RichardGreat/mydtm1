import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

PreferredSizeWidget appBarProfile(
    {required BuildContext context, required ProviderProfile providerProfile}) {
  var box = Hive.box("online");
  return AppBar(
    backgroundColor: MyColors.appColorGrey100(),
    elevation: 0,
    actions: [
      box.get("token").toString().length  > 30
          ?
      IconButton(
          onPressed: () {

            box.delete("token");

            pushNewScreenWithRouteSettings(context,
                screen: EnterFirst(),
                settings: RouteSettings(),
                withNavBar: false);

          },
          icon: Icon(
            Icons.logout,
            color: MyColors.appColorBlack(),
          )):const SizedBox.shrink()
    ],
  );
}
