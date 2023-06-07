import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/model_natija.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class CertificateResultsView extends StatefulWidget {
  String certId;

  // bool boolGetNatija;

  CertificateResultsView({
    Key? key,
    required this.certId,
    // required this.boolGetNatija,
  }) : super(key: key);

  @override
  State<CertificateResultsView> createState() => _CertificateResultsViewState();
}

class _CertificateResultsViewState extends State<CertificateResultsView> {
  var box = Hive.box("online");

  @override
  void initState() {
    getAllowLink();
    // log(widget.boolGetNatija.toString());
    super.initState();
  }

  late PDFDocument doc;
  bool isLoading = false;

  bool boolGetAllowLink = false;
  bool boolGetAllowLinkError = true;
  var dio = Dio();
  String link = "";
  String maxBall = "";
  late ModelCertificateResults modelCertificateResults;

  getAllowLink() async {
    try {
      log(widget.certId);

      Response response = await dio.get(
          // widget.boolGetNatija
          //     ? boolNotCertificate
          //         ? "${MainUrl.mainUrls}/v1/national/answer/40"
          //         : "${MainUrl.mainUrls}/v1/national/answer/3001"
          //     :
          "${MainUrl.mainUrls}/v1/national/answer/${widget.certId}",
          options: Options(headers: {
            "X-Access-Token":
                // widget.boolGetNatija
                //     ? boolNotCertificate
                //         ? "b90beeaac6416018196aeae417fefc96"
                //         : "18a30681c1f502f1e84f5418a72e1aca"
                //     :
                box.get("token")
          }));

      modelCertificateResults = ModelCertificateResults.fromJson(response.data);
      log(jsonEncode(response.data).toString());
      link = modelCertificateResults.data.answer.link.toString();
      maxBall = modelCertificateResults.data.answer.commonBall.toString();
      setState(() => isLoading = false);
      try {
        doc = await PDFDocument.fromURL(link, headers: {
          "X-Access-Token":
              // widget.boolGetNatija
              //     ? "b90beeaac6416018196aeae417fefc96"
              //     :
              box.get("token")
        });
      } catch (e) {
        log(e.toString());
      }
      setState(() => isLoading = true);
      boolGetAllowLink = true;
      boolGetAllowLinkError = false;
      setState(() {});
    } catch (e) {
      log("777");
      log(e.toString());
      boolGetAllowLinkError = false;
      boolGetAllowLink = false;
      setState(() {});
    }
  }

  bool boolNotCertificate = true;

  getResult() {
    setState(() {
      boolNotCertificate = !boolNotCertificate;
      boolNotCertificate ? {getAllowLink()} : {getAllowLink()};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MyWidgets.robotoFontText(
              text: "certificateNatja".tr(), textSize: 22),
          // actions: [
          //   widget.boolGetNatija
          //       ? CupertinoSwitch(
          //           activeColor: Colors.blue,
          //           value: boolNotCertificate,
          //           onChanged: (value) {
          //             getResult();
          //             log(boolNotCertificate.toString());
          //           },
          //         )
          //       : SizedBox.shrink()
          // ],
          centerTitle: true,
          backgroundColor: MyColors.appColorWhite(),
          iconTheme: IconThemeData(color: MyColors.appColorBlack()),
          elevation: 0,
        ),
        body: boolGetAllowLink
            ? SafeArea(
                child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      !boolNotCertificate
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  boolNotCertificate
                                      ? "getCertificate".tr()
                                      : "getCertificateFalse".tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: boolNotCertificate
                                          ? Colors.blue.shade900
                                          : Colors.red,
                                      fontSize: boolNotCertificate ? 17 : 20,
                                      fontWeight: FontWeight.w500)),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Center(
                            child: !isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : boolNotCertificate
                                    ? PDFViewer(
                                        document: doc,
                                        lazyLoad: false,
                                        // showPicker: false,
                                        // showNavigation: false,

                                        zoomSteps: 1,
                                        progressIndicator: const Center(
                                            child: CircularProgressIndicator()),
                                        showIndicator: false,
                                        backgroundColor: Colors.white,
                                      )
                                    : ListView.builder(
                                        itemCount: modelCertificateResults
                                            .data.answer.ans.length,
                                        itemBuilder: (context, index) =>
                                            ListTile(
                                          leading: Text(
                                              modelCertificateResults
                                                  .data.answer.ans[index].name,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              )),
                                          trailing: Text(
                                              modelCertificateResults
                                                  .data.answer.ans[index].ball
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ),
                                      ),
                          )),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(children: [
                          ListTile(
                            subtitle: Text(
                                "${"allBallCert".tr()} $maxBall ${"ball".tr()}",
                                style: TextStyle(
                                    fontSize: boolNotCertificate ? 17 : 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            title: boolNotCertificate
                                ? Text(
                                    boolNotCertificate
                                        ? "getCertificate".tr()
                                        : "getCertificateFalse".tr(),
                                    style: TextStyle(
                                        color: boolNotCertificate
                                            ? Colors.blue.shade900
                                            : Colors.red,
                                        fontSize: boolNotCertificate ? 17 : 20,
                                        fontWeight: FontWeight.w500))
                                : SizedBox.shrink(),
                          )
                        ]),
                      ),
                    ]),
              ))
            : boolGetAllowLinkError
                ? const Center(child: CupertinoActivityIndicator())
                : Center(child: Text("infoNotFind".tr())));
  }
}
