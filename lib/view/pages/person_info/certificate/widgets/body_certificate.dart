import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/foreigion_lang_add.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/widgets/photo/image_choose.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyCertificate(
    {required BuildContext context,
    required ProviderCertificate providerCertificate}) {
  return providerCertificate.boolCheckForeignLang
      ? providerCertificate.boolCheckCertificateData
          ? Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(color: MyColors.appColorGrey100()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  MyWidgets.robotoFontText(text: "Sertifikatlar", textSize: 25),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      pushNewScreen(context, screen: ForeignLanguageAdd());
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: MyColors.appColorWhite(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: MyWidgets.robotoFontText(
                              text: "Chet tili sertifiati qo'shish",
                              textColor: MyColors.appColorBlue1(),
                              textSize: 15)),
                    ),
                  ),
                  Text("Chet tili"),
                  Container(
                    height: 200,
                     width: double.infinity,
                    color: MyColors.appColorBlue1(),
                    child: Column(
                      children: [
                        MyWidgets.robotoFontText(
                            text: providerCertificate
                                .dataCheckForeignCertificate.flangCertName),
                        MyWidgets.robotoFontText(
                            text: providerCertificate
                                .dataCheckForeignCertificate.statusName)
                      ],
                    ),
                  ),
                  Text("Milliy sertifikat"),
                  Divider(),
                  Expanded(
                      child: ListView.builder(
                    itemCount: providerCertificate.listCheckCertificate.length,
                    itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.appColorWhite(),
                            boxShadow: [
                              BoxShadow(
                                  color: MyColors.appColorGrey400(),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyWidgets.robotoFontText(
                                text: providerCertificate
                                    .listCheckCertificate[index].name),
                            Text(
                              "${providerCertificate
                                .listCheckCertificate[index].percent.toString()} %",
                              style: TextStyle(
                                  color: MyColors.appColorBlack(),
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Medium'),
                            ),
                            Text(
                              providerCertificate
                                  .listCheckCertificate[index].startAt,
                              style: TextStyle(
                                  color: MyColors.appColorBlack(),
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Medium'),
                            ),
                            Text(
                              providerCertificate
                                  .listCheckCertificate[index].endAt,
                              style: TextStyle(
                                  color: MyColors.appColorBlack(),
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Medium'),
                            )
                          ],
                        )),
                  ))
                ],
              ),
            )
          : MyWidgets.loaderDownload(context: context)
      : MyWidgets.loaderDownload(context: context);
}
