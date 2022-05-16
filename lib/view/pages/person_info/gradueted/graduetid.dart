import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/app_bar_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/button_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/const_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_forgione/g_forgione.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_uzbek/graduated_uzbek.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class Graduated extends StatefulWidget {
  const Graduated({Key? key}) : super(key: key);

  @override
  State<Graduated> createState() => _GraduatedState();
}

class _GraduatedState extends State<Graduated> {
  ProviderGradueted providerGradueted = ProviderGradueted();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerGradueted,
      child: Consumer<ProviderGradueted>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          appBar: appBarGradueted(
              context: context, providerGradueted: providerGradueted),
          body: Form(
              key: providerGradueted.formKeyGradueted,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// header
                      constGraduated(context: context, providerGradueted: providerGradueted),
                      /// uzbek
                      Visibility(
                          child: graduatedUzbek(
                              context: context,
                              providerGradueted: providerGradueted)),
                      /// foreign
                      Visibility(
                          child: graduatedForeign(
                              context: context,
                              providerGradueted: providerGradueted)),
                     /// button
                      buttonGradueted(context: context, providerGradueted: providerGradueted)
                    ],
                  ),
                  margin: const EdgeInsets.all(15),
                ),
              )),
        ),
      ),
    );
  }
}
