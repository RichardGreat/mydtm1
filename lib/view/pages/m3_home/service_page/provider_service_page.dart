import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/certificate_nation/get_regLang.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/sign_up.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/check_information_page.dart';
import 'package:mydtm/view/texnikum/main_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:showcaseview/showcaseview.dart';

class ProviderServicePage extends ChangeNotifier {
  var box = Hive.box("online");

  ///
  /// Button
  Future checkUserStatus({required BuildContext context,
    required bool status,
    required String categoryName,
    required String categoryId}) async {
    box.delete("categoryName");
    box.delete("categoryNameId");
    box.put("categoryName", categoryName);
    box.put("categoryNameId", categoryId);

    status
        ? {
      if (box
          .get("token")
          .toString()
          .length < 30)
        {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.noHeader,
              // title: "iTest",
              // titleTextStyle: TextStyle(color: Colors.black),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Text(
                    //   "Assalomu aleykum",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontFamily: "Inter-Medium",
                    //       color: MyColors.appColorBackC4(),
                    //       fontSize: 18),
                    // ),

                    // Divider(),
                    // SizedBox(height: 10),
                    Text(
                      "BBA",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter-Medium",
                          color: MyColors.appColorBBA(),
                          fontSize: 18),
                    ),
                    const SizedBox(height: 15),
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
                      color: MyColors.appColorBBA(),
                      height: 40,
                      minWidth: double.infinity,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  EnterFirst(windowIdEnterFirst: "1"),
                            ));
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
                      style: TextStyle(
                          color: MyColors.appColorBBA(),
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
                          side: BorderSide(
                              color: MyColors.appColorBBA(), width: 1)),
                      onPressed: () {
                        // Navigator.of(context).push(CupertinoPageRoute(
                        //   builder: (context) =>  SignUps(),
                        // ));
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const SignUp(),
                            ));
                      },
                      child: Text(
                        "enterRegistration".tr(),
                        style: TextStyle(
                            color: MyColors.appColorBBA(),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter-Medium"),
                      ),
                    )
                  ],
                ),
              )).show(),
        }
      else
        if(box.get("faceId").toString() != "1"){

          if (box
              .get("imie")
              .toString()
              .length > 12 && box
              .get("psnum")
              .toString()
              .length > 4 && box
              .get("psser")
              .toString()
              .length > 1) {
            MyWidgets.dialogCheckFaceId(
                context: context,
                valueText: "Yuzingizni tasdiqlang",
                imie: box.get("imie").toString(),
                psnum: box.get("psnum").toString(),
                psser: box.get("psser").toString()),
          }


        } else
          {
            {
              if ((int.parse(categoryId) >= 1 &&
                  int.parse(categoryId) <= 10) ||
                  int.parse(categoryId) == 64)
                {
                  ///
                  // pushNewScreen(
                  //   context,
                  //   screen: CheckInformation(serviceName: categoryName),
                  //   withNavBar: false,
                  //   pageTransitionAnimation:
                  //   PageTransitionAnimation.cupertino,
                  // ),
                  // boolGetSerRegion?
                  // pushNewScreen(context,
                  //     pageTransitionAnimation:
                  //         PageTransitionAnimation.cupertino,
                  //     screen: SertificateServices(
                  //       serID: categoryId,
                  //       serviceName: categoryName,
                  //     ))
                  // :
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.noHeader,
                      animType: AnimType.bottomSlide,
                      title: "BBA",
                      desc: "serviceNot".tr(),
                      titleTextStyle: TextStyle(
                          color: MyColors.appColorBlue1(),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      descTextStyle: TextStyle(
                          color: MyColors.appColorBlack(),
                          fontWeight: FontWeight.bold),
                      btnOkOnPress: () {
                        // pushNewScreen(
                        //   context,
                        //   screen:  EnterFirst(windowIdEnterFirst: "0"),
                        //   withNavBar: false,
                        //   pageTransitionAnimation:
                        //   PageTransitionAnimation.cupertino,
                        // );
                      },
                      btnOkColor: MyColors.appColorBlue1(),
                      btnOkText: "accepted".tr())
                      .show(),
                }
              else
                if (categoryId == "42")
                // else if ("42" == "42")
                  {
                    log("42##"),
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              ShowCaseWidget(
                                builder: Builder(
                                  builder: (context) =>
                                      CheckInformation(
                                          serviceName: categoryName),
                                ),
                              ),
                        )),
                    // AwesomeDialog(
                    //         context: context,
                    //         dialogType: DialogType.noHeader,
                    //         animType: AnimType.bottomSlide,
                    //         dismissOnTouchOutside: false,
                    //         title: "BBA",
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

                /// Perevod page
                // else if (categoryId == "41")
                //   {
                // pushNewScreen(
                //   context,
                //   screen:
                //       CheckInformationPerevodga(serviceName: categoryName),
                //   withNavBar: false,
                //   pageTransitionAnimation:
                //       PageTransitionAnimation.cupertino,
                // )
                // }
                else
                  if (categoryId == "44")
                    {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) =>
                            MainTexnikum(serviceName: categoryName),))
                    }
                  else
                    if (box
                        .get("token")
                        .toString()
                        .length > 29)
                      {
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.noHeader,
                            animType: AnimType.bottomSlide,
                            title: "BBA",
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
                            title: "BBA",
                            desc: "identification".tr(),
                            titleTextStyle: TextStyle(
                                color: MyColors.appColorBlue1(),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            descTextStyle: TextStyle(
                                color: MyColors.appColorBlack(),
                                fontWeight: FontWeight.bold),
                            btnOkOnPress: () {
                              Navigator.push(context, CupertinoPageRoute(
                                builder: (context) =>
                                    EnterFirst(windowIdEnterFirst: "0"),));
                            },
                            btnOkColor: MyColors.appColorBlue1(),
                            btnOkText: "enter".tr())
                          ..show(),

                      }
            }
          }
    }
        : {
      if (box
          .get("token")
          .toString()
          .length > 29)
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
              title: "BBA",
              desc: "identification".tr(),
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(),
                  fontWeight: FontWeight.bold),
              btnOkOnPress: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) => EnterFirst(windowIdEnterFirst: "0"),));
              },
              btnOkColor: MyColors.appColorBlue1(),
              btnOkText: "enter".tr())
            ..show(),
        }
    };
  }

  Map<String, String> mapReg = {};
  Map<String, String> mapLang = {};
  String globNatCert = "";
  NetworkGetRegionCertNation getRegionCertNation = NetworkGetRegionCertNation();
  bool boolGetSerRegion = false;

  Future getCertificateIfHas({required String natCertIds}) async {
    try {
      boolGetSerRegion = false;
      // mapReg = await getRegionCertNation.getRegion(natCerId: natCertIds);
      // boolGetSerRegion = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
