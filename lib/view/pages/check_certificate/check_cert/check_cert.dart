import 'package:date_count_down/date_count_down.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/check_certificate/check_cert/certificate_view.dart';
import 'package:mydtm/view/pages/check_certificate/check_cert/check_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class CheckCertificate extends StatefulWidget {
  const CheckCertificate({super.key});

  @override
  State<CheckCertificate> createState() => _CheckCertificateState();
}

class _CheckCertificateState extends State<CheckCertificate> {
  ProviderCheckCertificate providerCheckCertificate =
      ProviderCheckCertificate();

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    await providerCheckCertificate.checkDataCertificate();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCheckCertificate,
      child: Consumer<ProviderCheckCertificate>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text("checkCertificate".tr()),
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.teal,
                        Colors.teal,
                        Colors.teal.withOpacity(0.8),
                        Colors.teal.withOpacity(0.7),
                      ]),
                ),
              ),
            ),
            body: Form(
                key: providerCheckCertificate.formKey123,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  margin:const EdgeInsets.all(8),
                  child: providerCheckCertificate.boolGetCertInfo
                      ? SafeArea(
                          child:
                              providerCheckCertificate
                                      .modelCheckCert.isNotEmpty
                                  ?ListView.builder(
                                  itemCount: providerCheckCertificate
                                      .modelCheckCert[0].data.length,
                                  itemBuilder:
                                      (context,
                                      index2) =>
                                      Container(

                                        margin: const EdgeInsets.all(5),
                                        padding:const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              
                                              BoxShadow(
                                                blurRadius: 1, spreadRadius: 0.07,
                                                color: Colors.teal.shade700)]),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            ListTile(
                                              leading:
                                              Image.asset(
                                                "assets/images/logobba.png",
                                                height:
                                                30,
                                              ),
                                              trailing:
                                              Text(
                                                "BBA",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.teal.shade800,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              child:
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.zero,
                                                    child: ListTile(
                                                      // minVerticalPadding: 1,
                                                      //         horizontalTitleGap: -10,
                                                        visualDensity: const  VisualDensity(horizontal: -4, vertical: -4),
                                                        leading: Text(
                                                          providerCheckCertificate.modelCheckCert[0].data[index2].subjectName.toString(),
                                                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                                                        ),
                                                        trailing: Text(
                                                          getBallFormat(providerCheckCertificate.modelCheckCert[0].data[index2].ball.toString()),
                                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                                        )),
                                                  ),
                                                  ListTile(
                                                    leading: const Text("Muddat", style: TextStyle(fontWeight: FontWeight.bold)),
                                                    trailing: providerCheckCertificate.modelCheckCert[0].data[index2].endDate.toString().length > 8
                                                        ? CountDownText(
                                                      due: DateTime.parse("${providerCheckCertificate.modelCheckCert[0].data[index2].endDate.toString().substring(
                                                        6,
                                                      )}-${providerCheckCertificate.modelCheckCert[0].data[index2].endDate.toString().substring(6, 8)}-${providerCheckCertificate.modelCheckCert[0].data[index2].endDate.toString().substring(8)}"),
                                                      finishedText: "Done",
                                                      collapsing: true,
                                                      showLabel: true,
                                                      longDateName: true,
                                                      hoursTextLong: "",
                                                      secondsTextLong: "",
                                                      secondsTextShort: "",
                                                      hoursTextShort: "",
                                                      minutesTextShort: "",
                                                      daysTextShort: "",
                                                      endingText: "",
                                                      minutesTextLong: "",
                                                      daysTextLong: " kun qoldi",
                                                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    )
                                                        : CountDownText(
                                                      due: DateTime.parse(providerCheckCertificate.modelCheckCert[0].data[index2].endAt.toString()),
                                                      finishedText: "Done",
                                                      collapsing: true,
                                                      showLabel: true,
                                                      longDateName: true,
                                                      hoursTextLong: "",
                                                      secondsTextLong: "",
                                                      secondsTextShort: "",
                                                      hoursTextShort: "",
                                                      minutesTextShort: "",
                                                      daysTextShort: "",
                                                      endingText: "",
                                                      minutesTextLong: "",
                                                      daysTextLong: " kun qoldi",
                                                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  ListTile(
                                                      leading: const Text("F.I.Sh", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                                      trailing: Text(
                                                        providerCheckCertificate.modelCheckCert[0].data[index2].fname,
                                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                                      )),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        MaterialButton(
                                                          onPressed: () {
                                                            pushNewScreen(context, screen: CertificateView(linkCert: providerCheckCertificate.modelCheckCert[0].data[index2].certLink));
                                                          },
                                                          height: 50,
                                                          color: Colors.teal.shade700,
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                          child:const Text("Sertifikat ko'rish", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                  : Center(
                                      child: Text(
                                      "noCertificate".tr(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                        )
                      : const CupertinoActivityIndicator(),
                ))),
      ),
    );
  }

  String getBallFormat(String s) {
    if (s.length <= 5) {
      s = "${s.toString()}00000";
    }
    return "${s.substring(0, 5)} ball";
  }
}
