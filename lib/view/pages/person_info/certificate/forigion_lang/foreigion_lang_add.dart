import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/app_bar_foreign.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/input_foreign.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

// ignore: must_be_immutable
class ForeignLanguageAdd extends StatefulWidget {
  ProviderCertificate providerCertificate;
  Function function;
   ForeignLanguageAdd({Key? key, required this.providerCertificate, required  this.function}) : super(key: key);

  @override
  State<ForeignLanguageAdd> createState() => _ForeignLanguageAddState();
}

class _ForeignLanguageAddState extends State<ForeignLanguageAdd> {

  myState(){
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarForeignLang(context: context, providerCertificate: widget.providerCertificate),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction ,
            child: widget.providerCertificate.boolSentServerCertificate ? 
          Center(child:  MyWidgets.loaderDownload(context: context))
                :
            Container(
                margin: const EdgeInsets.all(10),
                child: inputForeignCertificate(f: myState,context: context, providerCertificate: widget.providerCertificate)),
          ),
        ),
      ),
    );
  }
}
