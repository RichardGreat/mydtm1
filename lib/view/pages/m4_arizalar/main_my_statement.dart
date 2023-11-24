// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/main.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/body_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza1.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class MainMyStatement extends StatefulWidget {
  String numberParam;

  MainMyStatement({Key? key, required this.numberParam}) : super(key: key);

  @override
  State<MainMyStatement> createState() => _MainMyStatementState();
}

class _MainMyStatementState extends State<MainMyStatement>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  ProviderAriza providerAriza = ProviderAriza();

  @override
  initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    animation = Tween<double>(begin: 0, end: 600).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object's value.
        });
      });
    controller.forward();
    getAriza();

    super.initState();
  }

  @override
   dispose() {
    controller.dispose();
    super.dispose();
  }
  Future getAriza() async {
    try {
      await providerAriza.getQaydVaraqa();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerAriza,
      child: Consumer<ProviderAriza>(
        builder: (context, value, child) => WillPopScope(
          onWillPop: () async {
            if (widget.numberParam == "2") {
              box.delete("langLock");
              box.put("langLock", "1");
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>  const MyApp(),
                  ),
                  (route) => false);
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: MyColors.appColorBlack()),
              // backgroundColor: MyColors.appColorBBA(),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.teal,
                        Colors.teal,
                        Colors.teal.withOpacity(0.8),
                      ]),
                ),
              ),
              elevation: 0,
              title: box.get("token").toString().length > 30
                  ? MyWidgets.robotoFontText(
                      text: "applications".tr(),
                      textSize: 24,
                      textColor: Colors.white)
                  : const SizedBox.shrink(),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                      onPressed: () {
                        getAriza();
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            body: SlideTransition(
              position: Tween<Offset>(
                // X, Y - Origin (0, 0) is in the upper left corner.
                begin:  Offset(box.get("animationWindowValue")??1, 0),
                end: const Offset(0, 0),
              ).animate(controller),
              child: providerAriza.boolQaydVaraqaDownload
                  ? providerAriza.boolQaydVaraqaDownloadNot
                      ? notInfoPerson(
                          context: context, providerAriza: providerAriza)
                      : SafeArea(
                          child: bodyAriza1(
                              context: context, providerAriza: providerAriza))
                  : MyWidgets.loaderDownload(context: context),
            ),
          ),
        ),
      ),
    );
  }
}
