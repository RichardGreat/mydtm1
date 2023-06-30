import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/check_information_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/texnikum/privillage/provider_privillage_texnika.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:showcaseview/showcaseview.dart';

Widget bodyNoPrivilegeTexnikum(
    {required BuildContext context,
    required ProviderPrivilegeTexnikum providerPrivilegeTexnikum}) {
  var box = Hive.box("online");
  return Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.appColorWhite(),
              boxShadow: [
                BoxShadow(
                    color: MyColors.appColorGrey400(),
                    spreadRadius: 0.5,
                    blurRadius: 0.5)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(CupertinoIcons.info, size: 32),
              Text(
                "noPrivileges".tr(),
                maxLines: 3,
                style: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto-Medium'),
              ),
              const Divider(),
              Text(
                "noPrivilegesText".tr(),
                maxLines: 6,
                softWrap: true,
                style: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto-Medium'),
              )
            ],
          ),
        ),
        const SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              height: 50,
              minWidth: MediaQuery.of(context).size.width * 0.85,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: MyColors.appColorBlue1(),
              child: Text("continue".tr(),
                  style: TextStyle(color: MyColors.appColorWhite())),
              onPressed: () {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.noHeader,
                        animType: AnimType.bottomSlide,
                        dismissOnTouchOutside: false,
                        title: "BMBA",
                        desc: "chooseDirection".tr(),
                        titleTextStyle: TextStyle(
                            color: MyColors.appColorBlue1(),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        descTextStyle: TextStyle(
                            color: MyColors.appColorBlack(),
                            fontWeight: FontWeight.bold),
                        btnCancelOnPress: () {
                          pushNewScreen(context,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                              screen: ShowCaseWidget(
                                builder: Builder(
                                  builder: (context) => CheckInformation(
                                      serviceName:
                                          box.get("categoryName").toString()),
                                ),
                              ));
                        },
                        btnCancelColor: MyColors.appColorBlue1(),
                        btnCancelText: "OK")
                    .show();
              },
            ),
          ],
        ),
      ],
    ),
  );
}
