import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/app_bar.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/body_no_profile_info.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/body_profile.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  ProviderProfile providerProfile = ProviderProfile();
  var box = Hive.box("online");
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerProfile,
      child: Consumer<ProviderProfile>(
        builder: (context, value, child) => Scaffold(
          appBar: appBarProfile(context: context, providerProfile: providerProfile),
            backgroundColor: MyColors.appColorWhite(),
            body: SafeArea(
                child:box.get("token").toString().length  > 30
                    ?
                bodyProfile(
                    context: context, providerProfile: providerProfile)
            :
                bodyNoProfileInfo(context: context, providerProfile: providerProfile)
            )),
      ),
    );
  }
}
