import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/app_bar_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/body_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
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
    providerChooseEdu.getCheckUseNationCertInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerChooseEdu,
      child: Consumer<ProviderChooseEdu>(
        builder: (contexts, value, child) => Scaffold(
            appBar: appBarEduChoose(
                context: contexts, providerChooseEdu: providerChooseEdu),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height*1.7,
                  margin: const EdgeInsets.all(15),
                  child: 
                  providerChooseEdu.boolCheckUseCertificateData ?
                  bodyChooseEdu(
                      context: context, providerChooseEdu: providerChooseEdu):MyWidgets.loaderDownload(context: context),
                ),
              ),
            )),
      ),
    );
  }
}
