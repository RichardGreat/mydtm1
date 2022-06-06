import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
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
  var box = Hive.box("online");

  @override
  initState(){
    print("token ");
    print(box.get("token"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerChooseEdu,
      child: Consumer(
        builder: (contexts, value, child) => Scaffold(
            appBar: appBarEduChoose(
                context: contexts, providerChooseEdu: providerChooseEdu),
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
