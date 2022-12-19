import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'service_page_sert/provider_sertificates.dart';
import 'widget_cert_nation/widgets.dart';

class SertificateServices extends StatefulWidget {
  const SertificateServices({Key? key}) : super(key: key);

  @override
  State<SertificateServices> createState() => _SertificateServicesState();
}

class _SertificateServicesState extends State<SertificateServices> {
  ProviderCertificateService providerCertificateService =
      ProviderCertificateService();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCertificateService,
      child: Consumer<ProviderCertificateService>(
        builder: (context, value, child) => Scaffold(body: Column(
          children: [
            const SizedBox(height: 20),
            headTitle(),
          ],
        )),
      ),
    );
  }
}
