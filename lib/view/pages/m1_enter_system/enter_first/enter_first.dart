import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/app_bar.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/captcha.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_button.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/forgot_pasword.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/inputs.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class EnterFirst extends StatefulWidget {
  const EnterFirst({Key? key}) : super(key: key);

  @override
  State<EnterFirst> createState() => _EnterFirstState();
}

class _EnterFirstState extends State<EnterFirst> {
  ProviderEnterFirst providerEnterFirst = ProviderEnterFirst();
  var box = Hive.box("online");

  @override
  void initState() {
    providerEnterFirst.getCaptcha();
    log(box.get("clothe5Min").toString());
    log(box.get("errorTry").toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerEnterFirst,
      child: Consumer<ProviderEnterFirst>(
          builder: (context, value, child) => WillPopScope(
                child: Scaffold(
                    backgroundColor: MyColors.appColorWhite(),
                    appBar: enterFirstAppBar(
                        context: context,
                        providerEnterFirst: providerEnterFirst),
                    body: (box.get("clothe5Min") != "0" &&
                            box.get("clothe5Min") != null)
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("userBlock5MIn".tr(), textAlign: TextAlign.center),
                            ),
                          )
                        : Form(
                            key: providerEnterFirst.formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: providerEnterFirst.boolAuthorization
                                ? MyWidgets.loaderDownload(context: context)
                                : Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          Image.asset("assets/images/gerb.png",
                                              height: 70),
                                          const SizedBox(height: 10),
                                          const Text(
                                            "BMBA",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 25),
                                          ),
                                          const SizedBox(height: 25),
                                          enterFirstBodyInput(
                                              context: context,
                                              providerEnterFirst:
                                                  providerEnterFirst),
                                          const SizedBox(height: 20),
                                          forgotPassword(
                                              context: context,
                                              providerEnterFirst:
                                                  providerEnterFirst),
                                          const SizedBox(height: 20),
                                          captchaGet(
                                              context: context,
                                              providerEnterFirst:
                                                  providerEnterFirst),
                                          const SizedBox(height: 20),
                                          enterButton(
                                              context: context,
                                              providerEnterFirst:
                                                  providerEnterFirst)
                                        ],
                                      ),
                                    ),
                                  ))),
                onWillPop: () async {
                  box.delete("langLock");
                  box.put("langLock", "1");
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>  MainPages(homeIdMainpage: "0",)),
                      (route) => false);
                  return true;
                },
              )),
    );
  }
}
