// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/bodys/t0_appbar.dart';
import 'package:mydtm/view/texnikum/bodys/t1_pasport.dart';
import 'package:mydtm/view/texnikum/bodys/t2_address.dart';
import 'package:mydtm/view/texnikum/bodys/t3_educations.dart';
import 'package:mydtm/view/texnikum/bodys/t4_certificate.dart';
import 'package:mydtm/view/texnikum/bodys/t5_privillage.dart';
import 'package:mydtm/view/texnikum/bodys/t6_edu_choose.dart';
import 'package:mydtm/view/texnikum/bodys/t7_button.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class MainTexnikum extends StatefulWidget {
  String serviceName;

  MainTexnikum({Key? key, required this.serviceName}) : super(key: key);

  @override
  State<MainTexnikum> createState() => _MainTexnikumState();
}

class _MainTexnikumState extends State<MainTexnikum> {
  ProviderTexnikum providerTexnikum = ProviderTexnikum();

  @override
  initState() {
    getDataCheck();
    super.initState();
  }

  Future getDataCheck() async {
    await providerTexnikum.checkAllInfoUser();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerTexnikum,
      child: Consumer<ProviderTexnikum>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorGrey100(),
          appBar: appBarTexnikum(context: context),
          body: providerTexnikum.boolDownloadTexnikum ? SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height*0.9,
              margin: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                  MyWidgets.robotoFontText(text: widget.serviceName, textSize: 22),
                  const SizedBox(height: 8),
                  Text(
                    "userService".tr(),
                    style: TextStyle(
                        color: MyColors.appColorGrey600(),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),

                  passportInfoTexnikum(
                      context: context, providerTexnikum: providerTexnikum, function:getDataCheck ),
                  const SizedBox(height: 2),
                  addressInfoTexnikum(
                      context: context, providerTexnikum: providerTexnikum, function:getDataCheck),
                  const SizedBox(height: 2),
                  educationInfoTexnikum(
                      context: context, providerTexnikum: providerTexnikum, function:getDataCheck),
                  const SizedBox(height: 2),
                  certificateTexnikum(
                      context: context, providerTexnikum: providerTexnikum, function:getDataCheck),
                  const SizedBox(height: 2),
                  privillageInfoTexnikum(
                      context: context, providerTexnikum: providerTexnikum, function:getDataCheck),
                  const SizedBox(height: 2),
                  eduChooseInfoTexnikum(
                      context: context, providerTexnikum: providerTexnikum, function:getDataCheck),
                  const SizedBox(height: 20),
                  buttonInfoTexnikum(
                      context: context, providerTexnikum: providerTexnikum, function:getDataCheck),
                ]),
              ),
            ),
          ) :const Center(child: CupertinoActivityIndicator(),),
        ),
      ),
    );
  }
}
