import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/foreigion_lang_add.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bodyCertificate(
    {required BuildContext context,
    required ProviderCertificate providerCertificate,
    required Function func
    }) {
  return providerCertificate.boolCheckForeignLang
      ? providerCertificate.boolCheckCertificateData
          ? Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(color: MyColors.appColorWhite()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  MyWidgets.robotoFontText(text: "certificate".tr(), textSize: 25),
                  const SizedBox(height: 20),
                  providerCertificate.dataCheckForeignCertificate.status ==
                      1?const SizedBox.shrink():

                  GestureDetector(
                    onTap: () {
                      providerCertificate.dataCheckForeignCertificate.status ==
                              0 || providerCertificate.dataCheckForeignCertificate.status ==
                          1
                          ?{}
                          :  pushNewScreen(context, screen: ForeignLanguageAdd(providerCertificate: providerCertificate, function: func,));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: MyColors.appColorWhite(),
                          borderRadius: BorderRadius.circular(10),

                      ),
                      child: Center(
                          child: MyWidgets.robotoFontText(
                              text: "addCertificate".tr(),
                              textColor:
                              providerCertificate.dataCheckForeignCertificate.status ==
                                  0 || providerCertificate.dataCheckForeignCertificate.status ==
                                  1
                                  ? MyColors.appColorGrey400():
                              MyColors.appColorBlue1(),
                              textSize: 15)),
                    ),
                  ),
                  providerCertificate.boolCheckForeignLangNot?SizedBox(height: 20):
                  const SizedBox(height: 10),
                  providerCertificate.boolCheckForeignLangNot?SizedBox(height: 20):
                  MyWidgets.robotoFontText(text:"foreignLang".tr()),
                  const SizedBox(height: 10),
                  providerCertificate.boolCheckForeignLangNot?SizedBox.shrink():
                  Container(

                    margin: const EdgeInsets.all(4),

                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: MyColors.appColorWhite(),
                       boxShadow: [BoxShadow(
                            color: MyColors.appColorGrey400(),
                            blurRadius: 1,
                            spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      title: MyWidgets.robotoFontText(
                              text: providerCertificate
                                  .dataCheckForeignCertificate.flangCertName),
                    subtitle: MyWidgets.robotoFontText(
                              text: providerCertificate
                                  .dataCheckForeignCertificate.serNum),

                      onTap: (){

                      },
                    )
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const SizedBox(height: 10),
                    //     MyWidgets.robotoFontText(
                    //         text: providerCertificate
                    //             .dataCheckForeignCertificate.flangCertName),
                    //     MyWidgets.robotoFontText(
                    //         text: providerCertificate
                    //             .dataCheckForeignCertificate.flangLevelName),
                    //     MyWidgets.robotoFontText(
                    //         text: providerCertificate
                    //             .dataCheckForeignCertificate.serNum.toString()),
                    //     MyWidgets.robotoFontText(
                    //         text: providerCertificate
                    //             .dataCheckForeignCertificate.flangName.toString()),
                    //     MyWidgets.robotoFontText(
                    //         text: providerCertificate
                    //             .dataCheckForeignCertificate.statusName??""),
                    //     const SizedBox(height: 10),
                    //   ],
                    // ),
                  ),
                  const SizedBox(height: 10),
                  providerCertificate.boolCheckCertificateDataNot?const SizedBox.shrink():MyWidgets.robotoFontText(text:"nationalCert".tr()),
                  providerCertificate.boolCheckCertificateDataNot?const SizedBox.shrink():const Divider(),
                  providerCertificate.boolCheckCertificateDataNot?const SizedBox.shrink():
                  Expanded(
                      child: ListView.builder(
                    itemCount: providerCertificate.listCheckCertificate.length,
                    itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(top: 2, bottom: 2),

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.appColorWhite(),
                            boxShadow: [
                              BoxShadow(
                                  color: MyColors.appColorGrey400(),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                        child:

                        ListTile(
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                            title: MyWidgets.robotoFontText(
                                text: providerCertificate
                                .listCheckCertificate[index].name??""),
                            subtitle: MyWidgets.robotoFontText(
                                text:  providerCertificate
                                           .listCheckCertificate[index].certSernum??""),
                            onTap: (){
                            }),
                    ),
                  ))
                ],
              ),
            )
          : MyWidgets.loaderDownload(context: context)
      : MyWidgets.loaderDownload(context: context);
}
