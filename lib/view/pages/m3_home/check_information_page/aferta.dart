// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/edu_choose/region/choose_region.dart';
import 'package:mydtm/data/model_parse/edu_choose/region.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/provider_check_information.dart';
import 'package:mydtm/view/pages/m3_home/qayd_varaqa/qayd_varaqa2.dart';
import 'package:mydtm/view/pages/otm/choose_edu.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Aferta extends StatefulWidget {
  Function function;
  ProviderCheckInformation providerCheckInformation;

  Aferta(
      {Key? key,
      required this.function,
      required this.providerCheckInformation})
      : super(key: key);

  @override
  State<Aferta> createState() => _AfertaState();
}

class _AfertaState extends State<Aferta> {
  List<String> myAfertaList = [
    "aferta".tr(),
  ];
  bool boolAfertaButton = false;

  Future getAction({required bool myBools}) async {
    await widget.providerCheckInformation.getButtonColor(myBool: myBools);
    setState(() {});
  }

  @override
  void initState() {
    widget.providerCheckInformation.getTestRegionForCheck(getActionState);
    setState(() {

    });
    super.initState();
  }
  getActionState(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),

      body:  widget.providerCheckInformation. boolGetTestRegionCheck
          ? Column(children: [

              Expanded(
                // height: MediaQuery.of(context).size.height*0.7,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        getAction(myBools: false);
                        return Text(myAfertaList[index],
                        textAlign: TextAlign.justify,
                        );
                      } else if (index == 1) {
                        getAction(myBools: true);
                        return const SizedBox.shrink();
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                height: 40,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: widget.providerCheckInformation.boolAfertaButton
                    ? MyColors.appColorBlue1()
                    : Colors.blue.withOpacity(0.3),
                child: Text("afertaAccept".tr(),
                    style: TextStyle(color: MyColors.appColorWhite())),
                onPressed: () {
                  widget.providerCheckInformation.boolAfertaButton
                      ? {
                          Navigator.of(context).pop(),
                          widget.providerCheckInformation.modelCheckUserInfo
                                  .bakalavr
                              ? pushNewScreen(
                                  context,
                                  screen: QaydVaraqaEdit(
                                      providerCheckInformation:
                                          widget.providerCheckInformation),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                )
                              : pushNewScreen(
                                  context,
                                  screen: ChooseEdu(funcState: widget.function),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                ),
                        }
                      : {};
                },
              ),
            ])
          :   widget.providerCheckInformation.boolGetTestRegionCheckError
              ? Center(
                  child: Text("regEnd".tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                )
              :const Center(
                  child: CupertinoActivityIndicator(),
                ),
    );
  }
}
