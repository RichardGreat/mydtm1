import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/widgets/app_bar_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/widgets/body_certificate.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class Certificates extends StatefulWidget {
  const Certificates({Key? key}) : super(key: key);

  @override
  State<Certificates> createState() => _CertificatesState();
}

class _CertificatesState extends State<Certificates> {
  ProviderCertificate providerCertificate = ProviderCertificate();
  @override
  initState(){
    providerCertificate.getForeignCert();
    providerCertificate.getNationCertInfo();
    super.initState();
  }

  function(){
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCertificate,
      child: Consumer<ProviderCertificate>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          appBar: appBarCertificate(
              context: context, providerCertificate: providerCertificate),
          body: bodyCertificate(
            func: function,
              context: context, providerCertificate: providerCertificate),
        ),
      ),
    );
  }
}
