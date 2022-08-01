import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/foreigion_lang_add.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/pages/person_info/privillage/privillage.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/foreigion_lang_add.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bodyCertificateTexnikuim(
    {required BuildContext context,
    required ProviderCertificateTexnikum providerCertificateTexnikum,
    required Function func}) {
  return providerCertificateTexnikum.boolCheckForeignLang
      ? providerCertificateTexnikum.boolCheckCertificateData
          ? Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(color: MyColors.appColorGrey100()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  MyWidgets.robotoFontText(
                      text: "certificate".tr(), textSize: 28),
                  const SizedBox(height: 20),
                  providerCertificateTexnikum.dataCheckForeignCertificate.status == 1
                      ? const SizedBox.shrink()
                      : GestureDetector(
                          onTap: () {
                            providerCertificateTexnikum
                                        .dataCheckForeignCertificate.status ==
                                    1
                                ? {}
                                : pushNewScreen(context,
                                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    screen: ForeignLanguageAddTexnikum(
                                      providerCertificateTexnikum: providerCertificateTexnikum,
                                      function: func,
                                    ));
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // border: Border.all(color: MyColors.appColorGrey600(), width: 1),
                              boxShadow: [
                                BoxShadow(
                                    color: MyColors.appColorGrey600(),
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1)
                              ],
                              color: MyColors.appColorWhite(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.add_circle,
                                    color: MyColors.appColorBlue1()),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.74,
                                  child: MyWidgets.robotoFontText(
                                      text: "addCertificate".tr(),
                                      textColor: providerCertificateTexnikum
                                                  .dataCheckForeignCertificate
                                                  .status ==
                                              1
                                          ? MyColors.appColorGrey400()
                                          : MyColors.appColorBlue1(),
                                      textSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                  providerCertificateTexnikum.boolCheckForeignLangNot
                      ? const SizedBox(height: 20)
                      : const SizedBox(height: 30),
                  providerCertificateTexnikum.boolCheckForeignLangNot
                      ? const SizedBox(height: 20)
                      : MyWidgets.robotoFontText(
                          text: "foreignLang".tr(), textSize: 24),
                  const SizedBox(height: 10),
                  providerCertificateTexnikum.boolCheckForeignLangNot
                      ? const SizedBox.shrink()
                      : Container(
                          margin: const EdgeInsets.only(
                              right: 3, bottom: 2, top: 2, left: 2),
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: MyColors.appColorWhite(),
                              boxShadow: [
                                BoxShadow(
                                    color: MyColors.appColorGrey400(),
                                    blurRadius: 0.5,
                                    spreadRadius: 0.5)
                              ],
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyWidgets.robotoFontText(
                                  text: providerCertificateTexnikum
                                      .dataCheckForeignCertificate.flangName.toString()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyWidgets.robotoFontText(
                                      text: providerCertificateTexnikum
                                          .dataCheckForeignCertificate
                                          .flangCertName),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(
                                        left: 1, right: 2, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: providerCertificateTexnikum
                                                  .dataCheckForeignCertificate
                                                  .status ==
                                              1
                                          ? MyColors.appColorGreen2()
                                          : providerCertificateTexnikum
                                                      .dataCheckForeignCertificate
                                                      .status ==
                                                  0
                                              ? MyColors.appColorBlue1()
                                              : MyColors.appColorRed(),
                                    ),
                                    child: Row(
                                      children: [
                                        providerCertificateTexnikum
                                                    .dataCheckForeignCertificate
                                                    .status ==
                                                0
                                            ? Icon(
                                                Icons.watch_later_outlined,
                                                color: MyColors.appColorWhite(),
                                              )
                                            : providerCertificateTexnikum
                                                        .dataCheckForeignCertificate
                                                        .status ==
                                                    1
                                                ? Icon(
                                                    Icons.check_circle,
                                                    color: MyColors
                                                        .appColorWhite(),
                                                  )
                                                : Icon(
                                                    Icons.close,
                                                    color: MyColors
                                                        .appColorWhite(),
                                                  ),
                                        const SizedBox(width: 3),
                                        MyWidgets.robotoFontText(
                                            text: providerCertificateTexnikum
                                                .dataCheckForeignCertificate
                                                .statusName.toString(),
                                            textColor:
                                                MyColors.appColorWhite()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                          // ListTile(
                          //   trailing: Icon(Icons.arrow_forward_ios_rounded),
                          //   title: MyWidgets.robotoFontText(
                          //           text: providerCertificateTexnikum
                          //               .dataCheckForeignCertificate.flangCertName),
                          // subtitle: MyWidgets.robotoFontText(
                          //           text: providerCertificateTexnikum
                          //               .dataCheckForeignCertificate.serNum),
                          //
                          //   onTap: (){
                          //
                          //   },
                          // )
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     const SizedBox(height: 10),
                          //     MyWidgets.robotoFontText(
                          //         text: providerCertificateTexnikum
                          //             .dataCheckForeignCertificate.flangCertName),
                          //     MyWidgets.robotoFontText(
                          //         text: providerCertificateTexnikum
                          //             .dataCheckForeignCertificate.flangLevelName),
                          //     MyWidgets.robotoFontText(
                          //         text: providerCertificateTexnikum
                          //             .dataCheckForeignCertificate.serNum.toString()),
                          //     MyWidgets.robotoFontText(
                          //         text: providerCertificateTexnikum
                          //             .dataCheckForeignCertificate.flangName.toString()),
                          //     MyWidgets.robotoFontText(
                          //         text: providerCertificateTexnikum
                          //             .dataCheckForeignCertificate.statusName??""),
                          //     const SizedBox(height: 10),
                          //   ],
                          // ),
                          ),
                  const SizedBox(height: 30),
                  providerCertificateTexnikum.boolCheckCertificateDataNot
                      ? const SizedBox.shrink()
                      : MyWidgets.robotoFontText(
                          text: "nationalCert".tr(), textSize: 22),
                  const SizedBox(height: 10),
                  providerCertificateTexnikum.boolCheckCertificateDataNot
                      ? const SizedBox.shrink()
                      : Expanded(
                          child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(top: 4, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: MyColors.appColorWhite(),
                                boxShadow: [
                                  BoxShadow(
                                      color: MyColors.appColorGrey400(),
                                      blurRadius: 0.1,
                                      spreadRadius: 0.1)
                                ]),
                            child: ListTile(
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                                title: MyWidgets.robotoFontText(
                                    text: providerCertificateTexnikum
                                        .modeFLangTexnikum.data.flangCertName
                                        .toString()),
                                subtitle: MyWidgets.robotoFontText(
                                    text:
                                        providerCertificateTexnikum.modeFLangTexnikum.data.flangLevelName),
                                onTap: () {
                                  AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.NO_HEADER,
                                          animType: AnimType.BOTTOMSLIDE,
                                          title: "DTM",
                                          desc: "certSubjectName".tr(args: [
                                            providerCertificateTexnikum
                                                .modeFLangTexnikum.data.flangCertName
                                                .toString()
                                          ]),
                                          titleTextStyle: TextStyle(
                                              color: MyColors.appColorBlue1(),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                          descTextStyle: TextStyle(
                                              color: MyColors.appColorBlack(),
                                              fontWeight: FontWeight.bold),
                                          btnCancelOnPress: () {},
                                          btnCancelText: "OK",
                                          btnCancelColor:
                                              MyColors.appColorBlue1())
                                      .show();
                                }),
                          ),
                        )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          pushNewScreen(context,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                              screen: Privilege(funcState: func),
                              withNavBar: false);
                        },
                        height: 50,
                        color: MyColors.appColorBlue1(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minWidth: MediaQuery.of(context).size.width * 0.8,
                        child: Text("continue".tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: MyColors.appColorWhite())),
                      ),
                    ],
                  )
                ],
              ),
            )
          : MyWidgets.loaderDownload(context: context)
      : MyWidgets.loaderDownload(context: context);
}