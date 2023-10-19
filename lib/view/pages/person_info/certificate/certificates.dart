// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/check_information_page.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/widgets/app_bar_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/widgets/body_certificate.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

class Certificates extends StatefulWidget {
  Function funcState;

  Certificates({Key? key, required this.funcState}) : super(key: key);

  @override
  State<Certificates> createState() => _CertificatesState();
}

class _CertificatesState extends State<Certificates> {
  ProviderCertificate providerCertificate = ProviderCertificate();

  @override
  initState() {
    functionCert();
    super.initState();
  }

  functionCert() async {
    await providerCertificate.getForeignCert();
    await providerCertificate.getNationCertInfo();
    setState(() {});
  }

  var box = Hive.box("online");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCertificate,
      child: Consumer<ProviderCertificate>(
          builder: (context, value, child) => WillPopScope(
                onWillPop: () async {
                  widget.funcState();

                  Navigator.push(context, CupertinoPageRoute(builder: (context) => ShowCaseWidget(
                    builder: Builder(
                        builder: (context) => CheckInformation(
                            serviceName: box.get("categoryName").toString())),
                  ),));
                  return true;
                },
                child: Scaffold(
                  backgroundColor: MyColors.appColorGrey100(),
                  appBar: appBarCertificate(
                      context: context,
                      providerCertificate: providerCertificate),
                  body: bodyCertificate(
                      func: functionCert,
                      context: context,
                      providerCertificate: providerCertificate),
                ),
              )),
    );
  }
}
