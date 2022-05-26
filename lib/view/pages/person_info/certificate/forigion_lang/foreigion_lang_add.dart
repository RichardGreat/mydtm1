import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/provider_foriegn_lang.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/app_bar_foreign.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/input_foreign.dart';

class ForeignLanguageAdd extends StatefulWidget {
  const ForeignLanguageAdd({Key? key}) : super(key: key);

  @override
  State<ForeignLanguageAdd> createState() => _ForeignLanguageAddState();
}

class _ForeignLanguageAddState extends State<ForeignLanguageAdd> {
  ProviderForeignLang providerForeignLang = ProviderForeignLang();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarForeignLang(context: context, providerForeignLang: providerForeignLang),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(10),
            child: inputForeignCertificate(context: context, providerForeignLang: providerForeignLang)),
      ),
    );
  }
}
