import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:showcaseview/showcaseview.dart';

Widget servicePageBody(
    {required BuildContext context,
    required ServiceMainList serviceMainList,
    required ProviderServicePage providerServicePage,
    required GlobalKey twoServicePageGlobalKey,
    required GlobalKey threeServicePageGlobalKey

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
              index == 0 ?
              Showcase(
                key: twoServicePageGlobalKey,
                description: "Xizmat xaqida ma'lumot bilan tanishishingiz mumkin",
                child: ListTile(
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
                          pushNewScreen(context,
                              pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                              screen: CertificateApplication(
                                serviceId: serviceMainList.id.toString(),
                                certName: box.get("language") == "1"
                                    ? serviceMainList.serviceName
                                    : box.get("language") == "2"
                                    ? serviceMainList.serviceNameQQ
                                    : serviceMainList.serviceNameRu,
                              ));
                        }else{}

                      } else if (serviceMainList.id.toString().trim() == "42") {
                        pushNewScreen(context,
                            pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                            screen: MainMyStatement(numberParam: "0"));
                      } else {
                        MyWidgets.awesomeDialogError(
                            context: context, valueText: "arizaNo".tr());
                      }
                    } else {
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
                              screen:  EnterFirst(windowIdEnterFirst: "0"),
                              withNavBar: false,
                              pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                            );
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
              ),):

              Showcase(
                key: threeServicePageGlobalKey,
                description: "Ariza xaqida ma'lumot olish. Agar xizmat bo'yicha ariza topshirgan bo'lsangiz ma'lumotlaringiz bilan tanishishingiz mumkin",
                child: ListTile(
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
                            pushNewScreen(context,
                                pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                                screen: CertificateApplication(
                                  serviceId: serviceMainList.id.toString(),
                                  certName: box.get("language") == "1"
                                      ? serviceMainList.serviceName
                                      : box.get("language") == "2"
                                      ? serviceMainList.serviceNameQQ
                                      : serviceMainList.serviceNameRu,
                                ));
                          }else{}

                        } else if (serviceMainList.id.toString().trim() == "42") {
                          pushNewScreen(context,
                              pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                              screen: MainMyStatement(numberParam: "0"));
                        } else {
                          MyWidgets.awesomeDialogError(
                              context: context, valueText: "arizaNo".tr());
                        }
                      } else {
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
                                screen:  EnterFirst(windowIdEnterFirst: "0"),
                                withNavBar: false,
                                pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                              );
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
                ),)
        ),
      )
    ],
  );
}
