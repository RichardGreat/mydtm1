import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/model_cert_application.dart';
import 'package:mydtm/view/sertificate_service/qayd_varaqa/ruxsatnoma.dart';
import 'package:mydtm/view/sertificate_service/qayd_varaqa/view_qayd_varaqa.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class CertAllInformation extends StatefulWidget {
  DataCertApplications dataCertApplications;

  CertAllInformation({Key? key, required this.dataCertApplications})
      : super(key: key);

  @override
  State<CertAllInformation> createState() => _CertAllInformationState();
}

class _CertAllInformationState extends State<CertAllInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("aboutApplication".tr(),
            style: const TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.appColorWhite(),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 1,
                          color: MyColors.appColorGrey400())
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        "notePaper".tr(),
                        style: TextStyle(
                          color: MyColors.appColorBlack(),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => CertQaydVaraqaView(
                                  certQaytVaraqaId: widget
                                      .dataCertApplications.id
                                      .toString()),
                            ));

                      },
                      trailing:
                          const Icon(Icons.arrow_forward_ios_sharp, size: 16),
                    ),
                    ListTile(
                      title: Text("certRuxsatnoma".tr(),
                          style: TextStyle(
                            color: MyColors.appColorBlack(),
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => CertRuxsatnomaView(
                                  certRuxsatnomaVaraqaId: widget
                                      .dataCertApplications.id
                                      .toString()),
                            ));

                      },
                      trailing:
                          const Icon(Icons.arrow_forward_ios_sharp, size: 16),
                    ),
                    ListTile(
                      title: Text("certificateNatja".tr(),
                          style: TextStyle(
                            color: MyColors.appColorBlack(),
                          )),
                      onTap: () {
                        // pushNewScreen(
                        //   context,
                        //   screen:  AnswerSheetDownload(providerAriza: providerAriza),
                        //   withNavBar: false,
                        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        // );
                      },
                      trailing:
                          const Icon(Icons.arrow_forward_ios_sharp, size: 16),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.appColorWhite(),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 1,
                          color: MyColors.appColorGrey400())
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        title: Text("numberApplication".tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: MyColors.appColorBlack())),
                        onTap: () {},
                        trailing: Text(
                          widget.dataCertApplications.id.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )),
                    ListTile(
                        title: Text("holat".tr()),
                        onTap: () {},
                        trailing: Text(
                          widget.dataCertApplications.pay == 1
                              ? "accessed".tr()
                              : "waiting".tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )),
                    ListTile(
                      title: Text("testRegion".tr()),
                      onTap: () {},
                      trailing: Text(
                        widget.dataCertApplications.testRegionName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    ListTile(
                      leading: Text("certDayNatExam".tr(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: const TextStyle(fontSize: 16)),
                      trailing: Text(
                        widget.dataCertApplications.testDay,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ),
                    ListTile(
                      title: Text("lastChange".tr()),
                      onTap: () {},
                      trailing: Text(
                        widget.dataCertApplications.createdAt
                            .toString()
                            .substring(0, 19),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.appColorWhite(),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 1,
                          color: MyColors.appColorGrey400())
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///
                    ListTile(
                      title: GestureDetector(
                          child: SelectableText(
                            textAlign: TextAlign.end,
                            widget.dataCertApplications.invoice.toString(),
                            style: TextStyle(
                                color: MyColors.appColorBlack(),
                                fontWeight: FontWeight.w700),
                          ),
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                              text: widget.dataCertApplications.invoice
                                  .toString(),
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 1),
                                content: Text(
                                  widget.dataCertApplications.invoice
                                      .toString(),
                                )));
                          }),
                      trailing: GestureDetector(
                          child: const Icon(Icons.copy_all),
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                              text: widget.dataCertApplications.invoice
                                  .toString(),
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: MyColors.appColorWhite(),
                                duration: const Duration(seconds: 1),
                                content: Row(
                                  children: [
                                    Icon(Icons.copy_all,
                                        color: MyColors.appColorBlue1()),
                                    const SizedBox(width: 5),
                                    SizedBox(
                                      child: FittedBox(
                                        child: Text(
                                          widget.dataCertApplications.invoice
                                              .toString(),
                                          style: TextStyle(
                                              color: MyColors.appColorBlue1(),
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                )));
                          }),
                      leading: Text(
                        "numberInvoice".tr(),
                        style: TextStyle(color: MyColors.appColorBlack()),
                      ),
                    ),

                    ListTile(
                      title: Text("holat".tr()),
                      onTap: () {},
                      trailing: Container(
                        padding: const EdgeInsets.only(
                            bottom: 4, top: 4, right: 8, left: 8),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: 0 == 0
                                ? MyColors.appColorRed()
                                : MyColors.appColorGreen2(),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          0 == 0 ? "noPayed".tr() : "payed".tr().toString(),
                          style: TextStyle(
                              color: MyColors.appColorWhite(),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
