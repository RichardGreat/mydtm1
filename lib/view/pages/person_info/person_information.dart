import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/input_pasport.dart';
import 'package:mydtm/view/pages/person_info/provider_person_info.dart';
import 'package:provider/provider.dart';

class PersonInformation extends StatefulWidget {
  const PersonInformation({Key? key}) : super(key: key);

  @override
  State<PersonInformation> createState() => _PersonInformationState();
}

class _PersonInformationState extends State<PersonInformation> {

  ProviderPersonInfo providerPersonInfo = ProviderPersonInfo();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)
    =>
    providerPersonInfo
    ,
    child: Consumer<ProviderPersonInfo>(
    builder: (context, value, child) => Scaffold(body:Form(
    key: providerPersonInfo.formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child:SafeArea(child:SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            inputPassportInfo(context: context, providerPersonInfo: providerPersonInfo)
          ],
        ),
      ),
    ) )

    )),),
    );
    }
}
