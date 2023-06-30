import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/m4_qayd_var/model_qayd_varaqa.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/sign_up.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyNoProfileInfo({required BuildContext context, required ProviderProfile providerProfile}){
  return Container(
    margin: const EdgeInsets.all(10),
    child: Center(child:  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Image.asset("assets/images/gerb.png", height: 70),
        const SizedBox(height: 15),
         Text(
          "BMBA",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Inter-Medium",
              color: Colors.blue.shade900,
              fontSize: 16),
        ),

        Expanded(
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: "fillSigInOrSigUp".tr(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter-Medium",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  color: Colors.blueAccent,
                  height: 40,
                  minWidth: double.infinity,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: EnterFirst(windowIdEnterFirst: "1"),
                      withNavBar: false,
                      // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Text(
                    "enterLogPassword".tr(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter-Medium"),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "or".tr(),
                  style: const TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter-Medium"),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  color: Colors.white,
                  height: 40,
                  minWidth: double.infinity,
                  textColor: MyColors.appColorBackC4(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.blueAccent, width: 1)),
                  onPressed: () {
                    // Navigator.of(context).push(CupertinoPageRoute(
                    //   builder: (context) =>  SignUps(),
                    // ));
                    pushNewScreen(
                      context,
                      screen: SignUp(),
                      withNavBar: false,
                      // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Text(
                    "enterRegistration".tr(),
                    style: const TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter-Medium"),
                  ),
                )
              ],
            ),
          ),
        )

      ],
    )),);

}