import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

import 'service_page_sert/provider_sertificates.dart';
import 'widget_cert_nation/buttons_press.dart';
import 'widget_cert_nation/choose_lang.dart';
import 'widget_cert_nation/choose_regions.dart';
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
        builder: (context, value, child) => Scaffold(
            backgroundColor: MyColors.appColorWhite(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    headTitle(),
                    const SizedBox(height: 50),
                    chooseRegions(
                        providerCertificateService: providerCertificateService,
                        context: context),
                    const SizedBox(height: 30),
                    chooseLanguages(),
                    const SizedBox(height: 30),
                    chooseButtons(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
