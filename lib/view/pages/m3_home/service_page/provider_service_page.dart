import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/check_information_page.dart';
import 'package:mydtm/view/perevod/check_info_perevod/check_info_perevodga.dart';
// import 'package:mydtm/view/sertificate_service/certifate_serv.dart';
import 'package:mydtm/view/texnikum/main_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProviderServicePage extends ChangeNotifier {
  var box = Hive.box("online");

  ///
  /// Button
  Future checkUserStatus(
      {required BuildContext context,
      required bool status,
      required String categoryName,
      required String categoryId}) async {
    box.delete("categoryName");
    box.delete("categoryNameId");
    box.put("categoryName", categoryName);
    box.put("categoryNameId", categoryId);

    !status
        ? {
            if (box.get("token").toString().length < 30)
              {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.bottomSlide,
                    title: "BMBA",
                    desc: "identification".tr(),
                    titleTextStyle: TextStyle(
                        color: MyColors.appColorBlue1(),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    descTextStyle: TextStyle(
                        color: MyColors.appColorBlack(),
                        fontWeight: FontWeight.bold),
                    btnOkOnPress: () {
                      pushNewScreen(
                        context,
                        screen: const EnterFirst(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    btnOkColor: MyColors.appColorBlue1(),
                    btnOkText: "enter".tr())
                  ..show(),
              }
            else
              {
                if ((int.parse(categoryId) >= 1 &&
                        int.parse(categoryId) <= 10) ||
                    int.parse(categoryId) == 64)
                  {
                    ///
                    pushNewScreen(
                      context,
                      screen: CheckInformation(serviceName: categoryName),
                      withNavBar: false,
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    ),

                    // pushNewScreen(context,
                    //     pageTransitionAnimation:
                    //         PageTransitionAnimation.cupertino,
                    //     screen: SertificateServices(
                    //       serID: categoryId,
                    //       serviceName: categoryName,
                    //     ))
                  }
                else if (categoryId == "42")
                // else if ("42" == "42")
                  {
                    log("42##"),
                    pushNewScreen(
                      context,
                      screen: CheckInformation(serviceName: categoryName),
                      // screen: CheckInformation(serviceName: "42"),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    ),
                    // AwesomeDialog(
                    //         context: context,
                    //         dialogType: DialogType.noHeader,
                    //         animType: AnimType.bottomSlide,
                    //         dismissOnTouchOutside: false,
                    //         title: "BMBA",
                    //         desc: "regEnd".tr(),
                    //         titleTextStyle: TextStyle(
                    //             color: MyColors.appColorBlue1(),
                    //             fontSize: 24,
                    //             fontWeight: FontWeight.bold),
                    //         descTextStyle: TextStyle(
                    //             color: MyColors.appColorBlack(),
                    //             fontWeight: FontWeight.bold),
                    //         btnCancelColor: MyColors.appColorBlue1(),
                    //         btnCancelOnPress: () {},
                    //         btnCancelText: "OK")
                    //     .show(),
                  }
                else if (categoryId == "41")
                  {
                    pushNewScreen(
                      context,
                      screen:
                          CheckInformationPerevodga(serviceName: categoryName),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    )
                  }
                else if (categoryId == "44")
                  {
                    pushNewScreen(
                      context,
                      screen: MainTexnikum(serviceName: categoryName),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    )
                  }
                else if (box.get("token").toString().length > 29)
                  {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.noHeader,
                        animType: AnimType.bottomSlide,
                        title: "BMBA",
                        desc: "serviceWorkSoon".tr(),
                        titleTextStyle: TextStyle(
                            color: MyColors.appColorBlue1(),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        descTextStyle: TextStyle(
                            color: MyColors.appColorBlack(),
                            fontWeight: FontWeight.bold),
                        btnOkOnPress: () {
                          // Navigator.of(context).pop();
                        },
                        btnOkText: "enter".tr(),
                        btnOkColor: MyColors.appColorBlue1())
                      ..show(),
                  }
                else
                  {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.noHeader,
                        animType: AnimType.bottomSlide,
                        title: "BMBA",
                        desc: "identification".tr(),
                        titleTextStyle: TextStyle(
                            color: MyColors.appColorBlue1(),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        descTextStyle: TextStyle(
                            color: MyColors.appColorBlack(),
                            fontWeight: FontWeight.bold),
                        btnOkOnPress: () {
                          pushNewScreen(
                            context,
                            screen: const EnterFirst(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        btnOkColor: MyColors.appColorBlue1(),
                        btnOkText: "enter".tr())
                      ..show(),
                  }
              }
          }
        : {

            if (box.get("token").toString().length > 29)
              {
                MyWidgets.awesomeDialogInfo(
                    context: context, valueText: "serviceNot".tr())
              }
            else
              {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.bottomSlide,
                    title: "BMBA",
                    desc: "identification".tr(),
                    titleTextStyle: TextStyle(
                        color: MyColors.appColorBlue1(),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    descTextStyle: TextStyle(
                        color: MyColors.appColorBlack(),
                        fontWeight: FontWeight.bold),
                    btnOkOnPress: () {
                      pushNewScreen(
                        context,
                        screen: const EnterFirst(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    btnOkColor: MyColors.appColorBlue1(),
                    btnOkText: "enter".tr())
                  ..show(),
              }
          };
  }

  Future getCertificateIfHas() async {
    try {


    } catch (e) {
      log(e.toString());
    }
  }
}
