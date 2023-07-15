import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/sign_up.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyNoProfileInfo({required BuildContext context, required ProviderProfile providerProfile}){
  return Padding(
    padding: const EdgeInsets.all(25),
    child: SingleChildScrollView(
      child: Container(
        padding:const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height*0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Image.asset("assets/images/gerb.png", height: 100),
            const SizedBox(height: 15),
            Text(
              "BBA",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter-Medium",
                  color: MyColors.appColorBBA(),
                  fontSize: 18),
            ),

            Expanded(
              child:Padding(
                padding: const EdgeInsets.all(25.0),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: const Color.fromRGBO(51,110,100,1),

                        height: 45,
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
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "or".tr(),
                      style:  TextStyle(
                          color: MyColors.appColorBBA(),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter-Medium"),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.white,
                        height: 45,
                        minWidth: double.infinity,
                        textColor: MyColors.appColorBackC4(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color:MyColors.appColorBBA(), width: 1)),
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
                          style:  TextStyle(
                              color: MyColors.appColorBBA(),
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter-Medium"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    ),
  );

}