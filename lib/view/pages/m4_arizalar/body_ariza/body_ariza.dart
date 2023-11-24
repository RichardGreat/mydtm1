// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/sign_up.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/billing_money.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/body_info_not_pay.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/downloads.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/info_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

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
    child: SingleChildScrollView(
      child: Container(
        padding:const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height*0.9,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(15),
        child: (box.get("token").toString().length < 29)
            ?  Container(
          padding:const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height*0.9,
          child: Center(child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Image.asset("assets/images/gerb.png", height: 100),
              const SizedBox(height: 15),
              Text(
                "BBA",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter-Medium",
                    color: MyColors.appColorBBA(),
                    fontSize: 18),
              ),

              Expanded(
                child:Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          color: const Color.fromRGBO(51,110,100,1),

                          height: 45,
                          minWidth: double.infinity,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            Navigator.push(context,CupertinoPageRoute(builder: (context) =>  EnterFirst(windowIdEnterFirst: "1"),));

                          },
                          child: Text(
                            "enterLogPassword".tr(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Inter-Medium"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "or".tr(),
                        style:  TextStyle(
                            color: MyColors.appColorBBA(),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter-Medium"),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          color: Colors.white,
                          height: 45,
                          minWidth: double.infinity,
                          textColor: MyColors.appColorBackC4(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color:MyColors.appColorBBA(), width: 1)),
                          onPressed: () {
                            // Navigator.of(context).push(CupertinoPageRoute(
                            //   builder: (context) =>  SignUps(),
                            // ));
                            Navigator.push(context,CupertinoPageRoute(builder: (context) =>  const SignUp(),));
                          },
                          child: Text(
                            "enterRegistration".tr(),
                            style:  TextStyle(
                                color: MyColors.appColorBBA(),
                                fontWeight: FontWeight.bold,
                                fontFamily: "Inter-Medium"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )

            ],
          )),
        )
            :  Center(child:  MyWidgets.robotoFontText(
            text: "arizaNo".tr(),
            textColor: MyColors.appColorGrey400()),),
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
    widget.providerAriza.model.invoice.toString() == "null"?
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      box.get("notShowAgain1").toString() != "1"
          ? showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
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
                    content: SizedBox(
                        height: MediaQuery.of(context).size.height*0.8,
                        child: const InfoNotPay()));
              },
            )
          : {};
    }):{};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(
          elevation: 0,
          title:
          box.get("token").toString().length > 30?
          MyWidgets.robotoFontText(text: "otmQabul".tr(), textSize: 22)
              :const SizedBox.shrink(),
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
                // const SizedBox(height: 10),
                // MyWidgets.robotoFontText(text: "otmQabul".tr(), textSize: 22),
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
