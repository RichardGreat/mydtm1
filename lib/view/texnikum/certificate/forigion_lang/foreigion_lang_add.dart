import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/widgets/app_bar_foreign.dart';
import 'package:mydtm/view/texnikum/certificate/forigion_lang/widgets/input_foreign.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

// ignore: must_be_immutable
class ForeignLanguageAddTexnikum extends StatefulWidget {
  ProviderCertificateTexnikum providerCertificateTexnikum;
  Function function;
   ForeignLanguageAddTexnikum({Key? key, required this.providerCertificateTexnikum, required  this.function}) : super(key: key);

  @override
  State<ForeignLanguageAddTexnikum> createState() => _ForeignLanguageAddTexnikumState();
}

class _ForeignLanguageAddTexnikumState extends State<ForeignLanguageAddTexnikum> {

  myState(){
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          widget.function();
          return true;
        },
      child: Scaffold(
        backgroundColor: MyColors.appColorGrey100(),
      appBar: appBarForeignLangTexnikum(context: context, providerCertificateTexnikum: widget.providerCertificateTexnikum),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction ,
            child: widget.providerCertificateTexnikum.boolSentServerCertificate ?
            Center(child:  MyWidgets.loaderDownload(context: context))
                :
            Container(
                margin: const EdgeInsets.all(10),
                child: inputForeignCertificateTexnikum(f: myState,context: context,
                    f2: widget.function,
                    providerCertificateTexnikum: widget.providerCertificateTexnikum)),
          ),
        ),
      ),
    ),);
  }
}
