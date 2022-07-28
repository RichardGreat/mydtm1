import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/bodys/t1_pasport.dart';
import 'package:mydtm/view/texnikum/bodys/t2_address.dart';
import 'package:mydtm/view/texnikum/bodys/t3_educations.dart';
import 'package:mydtm/view/texnikum/bodys/t4_certificate.dart';
import 'package:mydtm/view/texnikum/bodys/t5_privillage.dart';
import 'package:mydtm/view/texnikum/bodys/t6_edu_choose.dart';
import 'package:mydtm/view/texnikum/bodys/t7_button.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class MainTexnikum extends StatefulWidget {
  const MainTexnikum({Key? key}) : super(key: key);

  @override
  State<MainTexnikum> createState() => _MainTexnikumState();
}

class _MainTexnikumState extends State<MainTexnikum> {
  ProviderTexnikum providerTexnikum = ProviderTexnikum();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerTexnikum,
      child: Consumer<ProviderTexnikum>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          body: Column(children: [
            passportInfoTexnikum(context: context, providerTexnikum: providerTexnikum),
            const SizedBox(height: 5),
            addressInfoTexnikum(context: context, providerTexnikum: providerTexnikum),
            const SizedBox(height: 5),
            educationInfoTexnikum(context: context, providerTexnikum: providerTexnikum),
            const SizedBox(height: 5),
            certificateTexnikum(context: context, providerTexnikum: providerTexnikum),
            const SizedBox(height: 5),
            privillageInfoTexnikum(context: context, providerTexnikum: providerTexnikum),
            const SizedBox(height: 5),
            eduChooseInfoTexnikum(context: context, providerTexnikum: providerTexnikum),
            const SizedBox(height: 5),
            buttonInfoTexnikum(context: context, providerTexnikum: providerTexnikum),
          ]),
        ),
      ),
    );
  }
}
