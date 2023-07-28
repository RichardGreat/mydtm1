// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';

// import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class CertQaydVaraqaView extends StatefulWidget {
  String certQaytVaraqaId, certId, certName;

  CertQaydVaraqaView(
      {Key? key,
      required this.certQaytVaraqaId,
      required this.certId,
      required this.certName})
      : super(key: key);

  @override
  State<CertQaydVaraqaView> createState() => _CertQaydVaraqaViewState();
}

class _CertQaydVaraqaViewState extends State<CertQaydVaraqaView> {
  var box = Hive.box("online");

  // late PDFDocument docPDF;
  bool isLoading = false;

  @override
  void initState() {
    log(widget.certQaytVaraqaId);
    downloadAndSavePdf();
    super.initState();
  }

  Future downloadAndSavePdf() async {
    setState(() => isLoading = false);
    // docPDF = await PDFDocument.fromURL(
    //     "${MainUrl.mainUrls}/v1/national/pdf-aplication/${widget.certQaytVaraqaId}",
    //     cacheManager: CacheManager(Config("customCacheKey", stalePeriod: const Duration(seconds: 1))),
    //     headers: {"X-Access-Token": box.get("token")});

    setState(() => isLoading = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyWidgets.robotoFontText(text: "notePaper".tr(), textSize: 18),
        centerTitle: true,
        backgroundColor: MyColors.appColorWhite(),
        iconTheme: IconThemeData(color: MyColors.appColorBlack()),
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: !isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : PDF().cachedFromUrl(
                          "${MainUrl.mainUrls}/v1/national/pdf-aplication/${widget.certQaytVaraqaId}")),
              //
              // PDFViewer(
              //   zoomSteps: 2,
              //   document: PDFDocument.fromURL(
              //
              //
              //   placeholder: (progress) =>
              //       Center(child: Text('$progress %')),
              //   errorWidget: (error) =>
              //       Center(child: Text(error.toString())),
              // )),
              // Container(
              //   margin: const EdgeInsets.all(15),
              //   child: Column(children: [
              //     // widget.providerAriza.loading
              //     //     ?
              //     // LinearProgressIndicator(
              //     //   minHeight: 10,
              //     //   value: widget.providerAriza.progress,
              //     // )
              //     //     :
              //     // MaterialButton(
              //     //   onPressed: () {
              //     //     Navigator.push(
              //     //         context,
              //     //         CupertinoPageRoute(
              //     //           builder: (context) => SertificateServices(
              //     //               serID: widget.certId,
              //     //               serviceName: widget.certName),
              //     //         ));
              //     //   },
              //     //   height: 50,
              //     //   minWidth: double.infinity,
              //     //   color: MyColors.appColorBlue1(),
              //     //   shape: RoundedRectangleBorder(
              //     //       borderRadius: BorderRadius.circular(10)),
              //     //   child: MyWidgets.robotoFontText(
              //     //       text: "editEdu".tr(),
              //     //       textColor: MyColors.appColorWhite()),
              //     // ),
              //   ]),
              // ),
            ]),
      )),
    );
  }
}
