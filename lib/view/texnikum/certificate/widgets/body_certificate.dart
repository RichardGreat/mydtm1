import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/foreigion_lang_add.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/texnikum/privillage/privillage_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bodyCertificateTexnikuim(
    {required BuildContext context,
    required ProviderCertificateTexnikum providerCertificateTexnikum,
    required Function func}) {
  return providerCertificateTexnikum.boolCheckCertificateData
          ? Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(color: MyColors.appColorGrey100()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  MyWidgets.robotoFontText(
                      text: "certificate".tr(), textSize: 28),
                  const SizedBox(height: 15),
                  providerCertificateTexnikum
                      .modeFLangTexnikum.data.flangCertName
                      .toString() == "null" ?
                  providerCertificateTexnikum.dataCheckForeignCertificate.status == 1
                      ? const SizedBox.shrink()
                      : GestureDetector(
                          onTap: () {
                            providerCertificateTexnikum
                                        .dataCheckForeignCertificate.status ==
                                    1
                                ? {}
                                :
                            Navigator.push(context,CupertinoPageRoute(builder: (context) => ForeignLanguageAddTexnikum(
                              providerCertificateTexnikum: providerCertificateTexnikum,
                              function: func,
                            )));

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
                        ):const SizedBox.shrink(),
                  providerCertificateTexnikum.boolCheckForeignLangNot
                      ? const SizedBox(height: 10)
                      :  SizedBox(height: providerCertificateTexnikum
                      .modeFLangTexnikum.data.flangCertName
                      .toString() == "null" ? 1:20),
                  providerCertificateTexnikum.boolCheckForeignLangNot
                      ? const SizedBox(height: 20)
                      : MyWidgets.robotoFontText(
                          text: "foreignLang".tr(), textSize: 24),
                  const SizedBox(height: 10),

                  providerCertificateTexnikum.boolCheckCertificateDataNot
                      ? const SizedBox.shrink()
                      : MyWidgets.robotoFontText(
                          text: "nationalCert".tr(), textSize: 16, textColor: MyColors.appColorGrey600()),
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

                                }),
                          ),
                        )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {

                          Navigator.push(context,CupertinoPageRoute(builder: (context) =>  PrivilegeTexnikum(funcState: func, windowId: "0"),));

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
          : MyWidgets.loaderDownload(context: context);

}
