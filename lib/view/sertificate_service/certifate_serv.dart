import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

import 'service_page_sert/provider_sertificates.dart';
import 'widget_cert_nation/buttons_press.dart';
import 'widget_cert_nation/choose_lang.dart';
import 'widget_cert_nation/choose_regions.dart';
import 'widget_cert_nation/widgets.dart';

class SertificateServices extends StatefulWidget {
  String serID, serviceName;

  SertificateServices(
      {Key? key, required this.serID, required this.serviceName})
      : super(key: key);

  @override
  State<SertificateServices> createState() => _SertificateServicesState();
}

class _SertificateServicesState extends State<SertificateServices> {

  ProviderCertificateService providerCertificateService =
      ProviderCertificateService();
  var box = Hive.box("online");

  @override
  Widget build(BuildContext context) {
    // log(box.get("token"));
    return ChangeNotifierProvider(
      create: (context) => providerCertificateService,
      child: Consumer<ProviderCertificateService>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: MyColors.appColorWhite(),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    headTitle(nameService: widget.serviceName),
                    const SizedBox(height: 50),
                    chooseRegions(
                        providerCertificateService: providerCertificateService,
                        natCerId: widget.serID,
                        context: context),
                    const SizedBox(height: 30),
                    chooseLanguages(
                        providerCertificateService: providerCertificateService,
                        natCerId: widget.serID,
                        context: context),
                    const SizedBox(height: 30),
                    chooseButtons(
                      serid: widget.serID,sername: widget.serviceName,
                      context: context,
                        providerCertificateService: providerCertificateService),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
