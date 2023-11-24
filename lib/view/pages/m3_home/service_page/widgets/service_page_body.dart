import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m3_home/service_page/provider_service_page.dart';
import 'package:mydtm/view/pages/m3_home/service_page/widgets/service_page_bottonsheet.dart';
import 'package:mydtm/view/pages/m4_arizalar/main_my_statement.dart';
import 'package:mydtm/view/sertificate_service/service_pages/sertificate_view.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';


Widget servicePageBody(
    {required BuildContext context,
    required ServiceMainList serviceMainList,
    required ProviderServicePage providerServicePage,
    // required GlobalKey twoServicePageGlobalKey,
    // required GlobalKey threeServicePageGlobalKey

    }) {
  List<String> myList = [
    "aboutService".tr(),
    "serviceArizlar".tr(),
  ];
  var box = Hive.box("online");
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.all(10),
        child: MyWidgets.robotoFontText(
            text: "addInfo".tr(),
            textSize: 15,
            textColor: MyColors.appColorGrey600()),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.appColorWhite()),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) =>
              // index == 0 ?
              // Showcase(
              //   key: twoServicePageGlobalKey,
              //   description: "infoService".tr(),
              //   child:
                ListTile(
                onTap: () {
                  log(serviceMainList.id.toString());
                  if (index == 0) {
                    serviceSheetBottomSheet(
                        serviceMainList: serviceMainList,
                        context: context,
                        providerServicePage: providerServicePage);
                  } else if (index == 1) {
                    if (box.get("token").toString().length > 29) {
                      if ((int.parse(serviceMainList.id.toString()) >= 1 &&
                          int.parse(serviceMainList.id.toString()) <= 10) ||
                          serviceMainList.id.toString().trim() == "64") {
                        ///
                        log(serviceMainList.id.toString());
                        if(serviceMainList.status.toString() == "true"){


                          Navigator.push(context, CupertinoPageRoute(builder: (context) => CertificateApplication(
                            serviceId: serviceMainList.id.toString(),
                            certName: box.get("language") == "1"
                                ? serviceMainList.serviceName
                                : box.get("language") == "2"
                                ? serviceMainList.serviceNameQQ
                                : serviceMainList.serviceNameRu,
                          )));


                        }else{}

                      } else if (serviceMainList.id.toString().trim() == "42") {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => MainMyStatement(numberParam: "0")));
                      } else {
                        MyWidgets.awesomeDialogError(
                            context: context, valueText: "arizaNo".tr());
                      }
                    } else {
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
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => EnterFirst(windowIdEnterFirst: "0"),));
                          },
                          btnOkColor: MyColors.appColorBlue1(),
                          btnOkText: "enter".tr())
                          .show();
                    }
                  }
                },
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: MyColors.appColorGrey100(),
                      width: 1,
                    )),
                leading: MyWidgets.robotoFontText(
                    text: myList[index], textColor: MyColors.appColorBlack()),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
              // ):

              // Showcase(
              //   key: threeServicePageGlobalKey,
              //   description: "userServiceInfo".tr(),
              //   child:
              //   ListTile(
              //     onTap: () {
              //       log(serviceMainList.id.toString());
              //       if (index == 0) {
              //         serviceSheetBottomSheet(
              //             serviceMainList: serviceMainList,
              //             context: context,
              //             providerServicePage: providerServicePage);
              //       } else if (index == 1) {
              //         if (box.get("token").toString().length > 29) {
              //           if ((int.parse(serviceMainList.id.toString()) >= 1 &&
              //               int.parse(serviceMainList.id.toString()) <= 10) ||
              //               serviceMainList.id.toString().trim() == "64") {
              //             ///
              //             log(serviceMainList.id.toString());
              //             if(serviceMainList.status.toString() == "true"){
              //               Navigator.push(context, CupertinoPageRoute(builder: (context) =>  CertificateApplication(
              //                 serviceId: serviceMainList.id.toString(),
              //                 certName: box.get("language") == "1"
              //                     ? serviceMainList.serviceName
              //                     : box.get("language") == "2"
              //                     ? serviceMainList.serviceNameQQ
              //                     : serviceMainList.serviceNameRu,
              //               )));
              //
              //             }else{}
              //
              //           } else if (serviceMainList.id.toString().trim() == "42") {
              //             Navigator.push(context, CupertinoPageRoute(builder: (context) =>  MainMyStatement(numberParam: "0")));
              //
              //           } else {
              //             MyWidgets.awesomeDialogError(
              //                 context: context, valueText: "arizaNo".tr());
              //           }
              //         } else {
              //           AwesomeDialog(
              //               context: context,
              //               dialogType: DialogType.noHeader,
              //               // title: "iTest",
              //               // titleTextStyle: TextStyle(color: Colors.black),
              //               body: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   children: [
              //                     // Text(
              //                     //   "Assalomu aleykum",
              //                     //   style: TextStyle(
              //                     //       fontWeight: FontWeight.bold,
              //                     //       fontFamily: "Inter-Medium",
              //                     //       color: MyColors.appColorBackC4(),
              //                     //       fontSize: 18),
              //                     // ),
              //
              //                     // Divider(),
              //                     // SizedBox(height: 10),
              //                     Text(
              //                       "BBA",
              //                       style:  TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontFamily: "Inter-Medium",
              //                           color: MyColors.appColorBBA(),
              //                           fontSize: 18),
              //                     ),
              //                     const SizedBox(height: 15),
              //                     RichText(
              //                       textAlign: TextAlign.justify,
              //                       text: TextSpan(
              //                         text: "fillSigInOrSigUp".tr(),
              //                         style: const TextStyle(
              //                             color: Colors.black,
              //                             fontFamily: "Inter-Medium",
              //                             fontWeight: FontWeight.bold),
              //                       ),
              //                     ),
              //                     const SizedBox(height: 20),
              //                     MaterialButton(
              //                       color: MyColors.appColorBBA(),
              //                       height: 40,
              //                       minWidth: double.infinity,
              //                       textColor: Colors.white,
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(8)),
              //                       onPressed: () {
              //
              //                         Navigator.push(context, CupertinoPageRoute(builder: (context) =>  EnterFirst(windowIdEnterFirst: "1")));
              //
              //                       },
              //                       child: Text(
              //                         "enterLogPassword".tr(),
              //                         style: const TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.bold,
              //                             fontFamily: "Inter-Medium"),
              //                       ),
              //                     ),
              //                     const SizedBox(height: 10),
              //                     Text(
              //                       "or".tr(),
              //                       style: TextStyle(
              //                           color:  MyColors.appColorBBA(),
              //                           fontWeight: FontWeight.bold,
              //                           fontFamily: "Inter-Medium"),
              //                     ),
              //                     const SizedBox(height: 10),
              //                     MaterialButton(
              //                       color: Colors.white,
              //                       height: 40,
              //                       minWidth: double.infinity,
              //                       textColor: MyColors.appColorBackC4(),
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(8),
              //                           side: BorderSide(
              //                               color:  MyColors.appColorBBA(), width: 1)),
              //                       onPressed: () {
              //                         // Navigator.of(context).push(CupertinoPageRoute(
              //                         //   builder: (context) =>  SignUps(),
              //                         // ));
              //                         Navigator.push(context, CupertinoPageRoute(builder: (context) =>  SignUp()));
              //                       },
              //                       child: Text(
              //                         "enterRegistration".tr(),
              //                         style:  TextStyle(
              //                             color:  MyColors.appColorBBA(),
              //                             fontWeight: FontWeight.bold,
              //                             fontFamily: "Inter-Medium"),
              //                       ),
              //                     )
              //                   ],
              //                 ),
              //               )).show();
              //         }
              //       }
              //     },
              //     shape: RoundedRectangleBorder(
              //         side: BorderSide(
              //           color: MyColors.appColorGrey100(),
              //           width: 1,
              //         )),
              //     leading: MyWidgets.robotoFontText(
              //         text: myList[index], textColor: MyColors.appColorBlack()),
              //     trailing: const Icon(Icons.arrow_forward_ios_outlined),
              //   ),
              // )
        ),
      )
    ],
  );
}
