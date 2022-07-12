import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/billing_money.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/body_info_not_pay.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/downloads.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/info_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
Widget bodyAriza({required BuildContext context, required ProviderAriza providerAriza}) {
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

var box = Hive.box("online");

Widget notInfoPerson({required BuildContext context, required ProviderAriza providerAriza}) {
  return SafeArea(
    child: Center(
      child: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SelectableText("998489900", autofocus: true, ),

                  MyWidgets.robotoFontText(
                      text: "arizaNo".tr(),
                      textColor: MyColors.appColorGrey400()),
                  const SizedBox(height: 40),
                  (box.get("token").toString().length < 29)
                      ? MaterialButton(
                      onPressed: () {
                        pushNewScreen(context,
                            pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                            screen: EnterFirst(),
                            withNavBar: false);
                      },
                      height: 50,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: MyColors.appColorBlue1(),
                      child: MyWidgets.robotoFontText(
                        text: "enterSystem".tr(),
                        textColor: MyColors.appColorWhite(),
                      ))
                      : const SizedBox.shrink()
                ]),
          ),
        ),
      ),
    ),
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
  void initState() {
    getInfoPul();
    super.initState();
  }

  getInfoPul() {
    log(box.get("token"));
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      box.get("notShowAgain1").toString() != "1"
          ? showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                    backgroundColor: Colors.white,
                    insetPadding: const EdgeInsets.all(10),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    title: Column(children:  [
                      const SizedBox(height: 10),
                      Text(
                          "infoNotPayTitle".tr(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          )),
                    ]),
                    content: InfoNotPay());
              },
            )
          : {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(
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
                MyWidgets.robotoFontText(text: "otmQabul".tr(), textSize: 22),
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
                          widget.  providerAriza.boolBitiruvchi ? const SizedBox.shrink():
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
