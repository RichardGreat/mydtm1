import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/provider_check_information.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/pages/person_info/certificate/certificates.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/foreigion_lang_add.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyCheckInformation(
    {required BuildContext context,
    required ProviderCheckInformation providerCheckInformation,
    required String serviceName}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(text: serviceName, textSize: 22),
      const SizedBox(height: 20),
      Expanded(
        // height: MediaQuery.of(context).size.height * 0.4,
        // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        // decoration: BoxDecoration(
        //     color: MyColors.appColorWhite(),
        //     borderRadius: BorderRadius.circular(10)),
        child: ListView.builder(
          itemCount: providerCheckInformation.myList.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
                color: MyColors.appColorWhite(),
                borderRadius: BorderRadius.circular(5)),
            child: ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: 0),
              onTap: () {
                if (index == 0) {

                  pushNewScreen(
                    context,
                    screen: PersonInformation(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );


                  // Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //       builder: (context) => PersonInformation(),
                  //     ));
                }
                else if(index == 1){

                  pushNewScreen(
                    context,
                    screen: AddressInfo(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );


                  // Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //       builder: (context) => AddressInfo(),
                  //     ));
                }

                else if(index == 2){

                  pushNewScreen(
                    context,
                    screen: Graduated(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                  // Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //       builder: (context) => Graduated(),
                  //     ));
                } else if(index == 3){
                  pushNewScreen(
                    context,
                    screen: Certificates(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                  // Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //       builder: (context) => Certificates(),
                  //     ));
                }
                else if(index == 4){
                  pushNewScreen(
                    context,
                    screen: ForeignLanguageAdd(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                // Navigator.push(
                // context,
                // CupertinoPageRoute(
                // builder: (context) => ForeignLanguageAdd(),
                // ));
                }

              },
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              leading: MyWidgets.robotoFontText(
                  text: providerCheckInformation.myList[index].name),
              title: Icon(Icons.check_circle, color: MyColors.appColorGreen1()),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      MaterialButton(
        height: 50,
        minWidth: double.infinity,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: MyColors.appColorBlue1(),
        child: MyWidgets.robotoFontText(
            text: "Yuborish", textColor: MyColors.appColorWhite()),
      ),
      const SizedBox(height: 20),
    ],
  );
}
