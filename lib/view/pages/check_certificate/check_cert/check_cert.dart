// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:date_count_down/date_count_down.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/check_certificate/check_cert/certificate_view.dart';
import 'package:mydtm/view/pages/check_certificate/check_cert/check_provider.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/body_no_profile_info.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CheckCertificate extends StatefulWidget {
  int actionAnimationValue;

  CheckCertificate({super.key, required this.actionAnimationValue});

  @override
  State<CheckCertificate> createState() => _CheckCertificateState();
}

class _CheckCertificateState extends State<CheckCertificate>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller123;
  ProviderCheckCertificate providerCheckCertificate =
      ProviderCheckCertificate();

  @override
  initState() {
    controller123 = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    animation = Tween<double>(begin: 0, end: 600).animate(controller123)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object's value.
        });
      });
    controller123.forward();
    getData();
    super.initState();
  }

  @override
  void dispose() {
    controller123.dispose();
    super.dispose();
  }

  Future getData() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      await providerCheckCertificate.checkDataCertificate();
    } catch (e) {
      log(e.toString());
    }
  }

  var box = Hive.box("online");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCheckCertificate,
      child: Consumer<ProviderCheckCertificate>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text("checkCertificate".tr(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              centerTitle: true,
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
            body: AnimatedBuilder(
                animation: controller123,
                builder: (context, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(box.get("animationWindowValue") ?? 1, 0),
                      end: const Offset(0, 0),
                    ).animate(controller123),
                    child: Form(
                        key: providerCheckCertificate.formKey1234,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: box.get("token").toString().length > 30
                            ? Container(
                                margin: const EdgeInsets.all(8),
                                child: providerCheckCertificate.boolGetCertInfo
                                    ? SafeArea(
                                        child:
                                            providerCheckCertificate
                                                    .modelCheckCert.isNotEmpty
                                                ? ListView.builder(
                                                    itemCount:
                                                        providerCheckCertificate
                                                            .modelCheckCert[0]
                                                            .data
                                                            .length,
                                                    itemBuilder:
                                                        (context, index2) =>
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(8),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        blurRadius:
                                                                            1,
                                                                        spreadRadius:
                                                                            0.07,
                                                                        color: Colors
                                                                            .teal
                                                                            .shade700)
                                                                  ]),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  ListTile(
                                                                    leading: Image
                                                                        .asset(
                                                                      "assets/images/logobba.png",
                                                                      height:
                                                                          30,
                                                                    ),
                                                                    trailing:
                                                                        Text(
                                                                      "BBA",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          color: Colors
                                                                              .teal
                                                                              .shade800,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          child: ListTile(
                                                                              // minVerticalPadding: 1,
                                                                              //         horizontalTitleGap: -10,
                                                                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
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
                                                                          leading: Text(
                                                                              "muddat".tr(),
                                                                              style: const TextStyle(fontWeight: FontWeight.bold)),
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
                                                                                  daysTextLong: "dayHave".tr(),
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
                                                                                  daysTextLong: "dayHave".tr(),
                                                                                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                                ),
                                                                        ),
                                                                        ListTile(
                                                                            leading:
                                                                                Text("fish".tr(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                                                            trailing: Text(
                                                                              providerCheckCertificate.modelCheckCert[0].data[index2].fname.toString(),
                                                                              maxLines: 2,
                                                                              style: const TextStyle(fontWeight: FontWeight.bold),
                                                                            )),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            QrImageView(
                                                                              data: providerCheckCertificate.modelCheckCert[0].data[index2].url.toString(),
                                                                              version: QrVersions.auto,
                                                                              size: 150.0,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                20),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left: 10,
                                                                              right: 10,
                                                                              bottom: 8),
                                                                          child:
                                                                              Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              MaterialButton(
                                                                                onPressed: () {
                                                                                  // log(providerCheckCertificate.modelCheckCert[0].data[index2].url.toString());

                                                                                  Navigator.push(
                                                                                      context,
                                                                                      CupertinoPageRoute(
                                                                                        builder: (context) => CertificateView(linkCert: providerCheckCertificate.modelCheckCert[0].data[index2].url.toString()),
                                                                                      ));
                                                                                },
                                                                                height: 50,
                                                                                color: Colors.teal.shade700,
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                child: Text("certView".tr(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                      )
                                    : providerCheckCertificate.boolNotCertInfo
                                        ? Center(
                                            child: Text(
                                            "noCertificate".tr(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ))
                                        : const Center(
                                            child:
                                                CupertinoActivityIndicator()),
                              )
                            : bodyNoProfileInfo(
                                context: context,
                              )),
                    // PageAnimationTransition(child: PageTwo(), pageAnimationType: LeftToRightFadedTransition(), page: null);

                    //
                  );
                })),
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
