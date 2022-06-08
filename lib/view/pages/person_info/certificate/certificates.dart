import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/widgets/app_bar_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/widgets/body_certificate.dart';
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
    // {
    //   "status": 0,
    // "error_code": 400,
    // "errors": "Ma`lumot topilmadi."
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCertificate,
      child: Consumer<ProviderCertificate>(
        builder: (context, value, child) => Scaffold(
          appBar: appBarCertificate(
              context: context, providerCertificate: providerCertificate),
          body: bodyCertificate(
              context: context, providerCertificate: providerCertificate),
        ),
      ),
    );
  }
}
