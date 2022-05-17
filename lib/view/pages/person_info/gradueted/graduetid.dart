import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/app_bar_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/button_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/const_gradueted.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_forgione/g_forgione.dart';
import 'package:mydtm/view/pages/person_info/gradueted/g_uzbek/graduated_uzbek.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class Graduated extends StatefulWidget {
  const Graduated({Key? key}) : super(key: key);

  @override
  State<Graduated> createState() => _GraduatedState();
}

class _GraduatedState extends State<Graduated> {
  ProviderGraduated providerGraduated = ProviderGraduated();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerGraduated,
      child: Consumer<ProviderGraduated>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          appBar: appBarGradueted(
              context: context, providerGradueted: providerGraduated),
          body: Form(
              key: providerGraduated.formKeyGraduated,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// header
                      constGraduated(context: context, providerGraduated: providerGraduated),
                      /// uzbek
                      Visibility(
                        visible: providerGraduated.boolGraduatedType,
                          child: graduatedUzbek(
                              context: context,
                              providerGradueted: providerGraduated)),
                      /// foreign
                      Visibility(
                        visible: !providerGraduated.boolGraduatedType,
                          child: graduatedForeign(
                              context: context,
                              providerGraduated: providerGraduated)),
                     /// button
                      buttonGradueted(context: context, providerGradueted: providerGraduated)
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
