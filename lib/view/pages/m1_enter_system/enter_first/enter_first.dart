import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/app_bar.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/captcha.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_button.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/inputs.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class EnterFirst extends StatefulWidget {
  const EnterFirst({Key? key}) : super(key: key);

  @override
  State<EnterFirst> createState() => _EnterFirstState();
}

class _EnterFirstState extends State<EnterFirst> {
  ProviderEnterFirst providerEnterFirst = ProviderEnterFirst();

  @override
  void initState() {
    providerEnterFirst.getCaptcha();
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
                    body: Form(
                        key: providerEnterFirst.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: providerEnterFirst.boolAuthorization
                            ? MyWidgets.loaderDownload(context: context)
                            : Padding(
                                padding: const EdgeInsets.all(10),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      const Icon(Icons.star, size: 70),
                                      enterFirstBodyInput(
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const MainPages()),
                      (route) => false);
                  return true;
                },
              )),
    );
  }
}
