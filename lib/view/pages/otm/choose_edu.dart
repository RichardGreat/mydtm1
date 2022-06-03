import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/app_bar_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/body_choose_edu.dart';
import 'package:provider/provider.dart';

class ChooseEdu extends StatefulWidget {
  const ChooseEdu({Key? key}) : super(key: key);

  @override
  State<ChooseEdu> createState() => _ChooseEduState();
}

class _ChooseEduState extends State<ChooseEdu> {
  ProviderChooseEdu providerChooseEdu = ProviderChooseEdu();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerChooseEdu,
      child: Consumer(
        builder: (context, value, child) => Scaffold(
            appBar: appBarEduChoose(
                context: context, providerChooseEdu: providerChooseEdu),
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(15),
                child: bodyChooseEdu(
                    context: context, providerChooseEdu: providerChooseEdu),
              ),
            )),
      ),
    );
  }
}
