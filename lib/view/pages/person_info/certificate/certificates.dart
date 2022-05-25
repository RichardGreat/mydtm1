import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCertificate,
      child: Consumer<ProviderCertificate>(
        builder: (context, value, child) => Scaffold(
          body: bodyCertificate(context: context, providerCertificate: providerCertificate),
        ),
      ),
    );
  }
}
