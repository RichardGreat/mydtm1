import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/billing_money.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/downloads.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/info_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bodyAriza(
    {required BuildContext context, required ProviderAriza providerAriza}) {
  return providerAriza.boolQaydVaraqaDownload
      ? Container(
          margin: const EdgeInsets.all(10),
          child: providerAriza.boolQaydVaraqaDownloadNot
              ? notInfoPerson(context: context, providerAriza: providerAriza)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              downloads(
                                  context: context,
                                  providerAriza: providerAriza),
                              const SizedBox(height: 20),
                              infoAriza(
                                  context: context,
                                  providerAriza: providerAriza),
                              const SizedBox(height: 20),
                              infoMoneyBilling(
                                  context: context,
                                  providerAriza: providerAriza)
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
        )
      : MyWidgets.loaderDownload(context: context);
}

Widget notInfoPerson(
    {required BuildContext context, required ProviderAriza providerAriza}) {
  return SafeArea(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [MyWidgets.robotoFontText(text: "arizaNo".tr())],
          )
        ]),
  );
}

class ArizaEnter extends StatefulWidget {
  ProviderAriza providerAriza;

  ArizaEnter({Key? key, required this.providerAriza}) : super(key: key);

  @override
  State<ArizaEnter> createState() => _ArizaEnterState();
}

class _ArizaEnterState extends State<ArizaEnter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(
          title: MyWidgets.robotoFontText(
              text: "otmQabul".tr()),
          elevation: 0,
          backgroundColor: MyColors.appColorWhite(),
          iconTheme: IconThemeData(color: MyColors.appColorBlack())),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: widget.providerAriza.boolQaydVaraqaDownloadNot
            ? notInfoPerson(
                context: context, providerAriza: widget.providerAriza)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            downloads(
                                context: context,
                                providerAriza: widget.providerAriza),
                            const SizedBox(height: 20),
                            infoAriza(
                                context: context,
                                providerAriza: widget.providerAriza),
                            const SizedBox(height: 20),
                            infoMoneyBilling(
                                context: context,
                                providerAriza: widget.providerAriza)
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
      )),
    );
  }
}
