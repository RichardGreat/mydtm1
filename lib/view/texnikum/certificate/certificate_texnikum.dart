// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/texnikum/certificate/widgets/app_bar_certificate.dart';
import 'package:mydtm/view/texnikum/certificate/widgets/body_certificate.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class CertificateTexnikum extends StatefulWidget {
  Function funcState;

  CertificateTexnikum({Key? key, required this.funcState}) : super(key: key);

  @override
  State<CertificateTexnikum> createState() => _CertificateTexnikumState();
}

class _CertificateTexnikumState extends State<CertificateTexnikum> {
  ProviderCertificateTexnikum providerCertificateTexnikum =
      ProviderCertificateTexnikum();

  @override
  initState() {
    functionCert();
    super.initState();
  }

  functionCert() async {
    // await providerCertificateTexnikum.getForeignCertTexnikum();
    await providerCertificateTexnikum.getNationCertInfo();
    setState(() {});
  }

  var box = Hive.box("online");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCertificateTexnikum,
      child: Consumer<ProviderCertificateTexnikum>(
          builder: (context, value, child) => WillPopScope(
                onWillPop: () async {
                  widget.funcState();
                  Navigator.of(context).pop();
                  // pushNewScreen(context,
                  //     pageTransitionAnimation:
                  //         PageTransitionAnimation.cupertino,
                  //     screen: CheckInformation(
                  //         serviceName: box.get("categoryName").toString()));
                  return true;
                },
                child: Scaffold(
                  backgroundColor: MyColors.appColorGrey100(),
                  appBar: appBarCertificateTexnikuim(
                      context: context,
                      providerCertificateTexnikum: providerCertificateTexnikum),
                  body: bodyCertificateTexnikuim(
                      func: functionCert,
                      context: context,
                      providerCertificateTexnikum: providerCertificateTexnikum),
                ),
              )),
    );
  }
}
