import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/sertificate_service/all_info_application/cert_all_information.dart';
import 'package:mydtm/view/sertificate_service/service_pages/provider_service_page.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class CertificateApplication extends StatefulWidget {
  String certName, serviceId;

  CertificateApplication(
      {Key? key, required this.serviceId, required this.certName})
      : super(key: key);

  @override
  State<CertificateApplication> createState() => _CertificateApplicationState();
}

class _CertificateApplicationState extends State<CertificateApplication> {
  @override
  void initState() {
    getDataIfHas();
    super.initState();
  }

  getDataIfHas() async {
    // log(widget.serviceId);
    log(widget.certName);
    await providerServicePage.getCertificateService(
        serviceIds: widget.serviceId);
  }

  ProviderServiceApplicationPage providerServicePage =
      ProviderServiceApplicationPage();



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerServicePage,
      child: Consumer<ProviderServiceApplicationPage>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: Text("applications".tr(),
                style: const TextStyle(color: Colors.black)),
            actions: [
              CupertinoSwitch(
                value: providerServicePage.boolGetPay,
                onChanged: (value) {
                  providerServicePage.getPayForCheck();
                },
                activeColor: Colors.blue,
              )
            ],
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: providerServicePage.boolDownloadData
              ? SafeArea(
                  child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.certName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Expanded(
                        child: ListView.builder(
                          itemCount: providerServicePage.listCertApp.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              CertAllInformation(
                                                boolCertPay: providerServicePage.boolGetPay,
                                            serId: widget.serviceId,
                                            serName: widget.certName,
                                            dataCertApplications:
                                                providerServicePage
                                                    .listCertApp[index],
                                          ),
                                        ));
                                  },
                                  child: Card(
                                    color: Colors.grey.shade100,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            leading: Text(
                                              "testRegion".tr(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            trailing: Text(
                                              providerServicePage
                                                  .listCertApp[index]
                                                  .testRegionName,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "certDayNatExam".tr(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            trailing: Text(
                                              providerServicePage
                                                  .listCertApp[index].testDay,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "certLangExam".tr(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            trailing: Text(
                                              providerServicePage
                                                  .listCertApp[index]
                                                  .testLangName,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "aboutPay".tr(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            trailing: Text(
                                                providerServicePage.boolGetPay ?
                                                    "payed".tr():
                                              providerServicePage
                                                          .listCertApp[index]
                                                          .pay
                                                          .toString() ==
                                                      "0"
                                                  ? "noPayed".tr()
                                                  : "payed".tr(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: TextStyle(
                                                  color:
                                                  providerServicePage.boolGetPay ?Colors.black:
                                                  providerServicePage
                                                              .listCertApp[
                                                                  index]
                                                              .pay
                                                              .toString() ==
                                                          "0"
                                                      ? MyColors.appColorRed()
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                          ),
                                          // aboutPay
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              : providerServicePage.boolDownloadDataError
                  ? Center(
                      child: Text("arizaNo".tr()),
                    )
                  : const Center(
                      child: CupertinoActivityIndicator(),
                    ),
        ),
      ),
    );
  }
}
