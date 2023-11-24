// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:share_plus/share_plus.dart';

class CertificateView extends StatefulWidget {
  String linkCert;

  CertificateView({Key? key, required this.linkCert})
      : super(key: key);

  @override
  State<CertificateView> createState() => _CertificateViewState();
}

class _CertificateViewState extends State<CertificateView> {
  @override
  initState() {
    getDownload();
    super.initState();
  }

  Future getDownload() async {

    // await widget.providerAriza.getDownloads(categoryId: 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: MyWidgets.robotoFontText(text: "Sertifikat", textSize: 18),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color:Colors.black),
        elevation: 0,
        actions: [
          // widget.providerAriza.boolDataDownload2
          //     ? widget.providerAriza.modelGetDownloadsData2.status.toString() ==
          //     "1"
          //     ?
          IconButton(
            onPressed: () async {
              // await widget.providerAriza.downloadFile(
              //     url: widget.providerAriza.modelGetDownloadsData2.src,
              //     name: "bmba");
              // Share.share(widget.providerAriza.fileUrl.path);
              Share.shareFiles([("")], text: 'Sertifikat');
            },
            icon: const Icon(Icons.share),
          )
              // : const SizedBox.shrink()
              // : const SizedBox.shrink()
        ],
      ),
      body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child:
              // widget.providerAriza.boolDataDownload2
              //     ? widget.providerAriza.modelGetDownloadsData2.status.toString() == "1"
              //     ?
              SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: const PDF(
                        autoSpacing: true,
                        fitEachPage: true,

                      ).cachedFromUrl(
                         widget.linkCert)),
                  // Container(
                  //   margin: const EdgeInsets.all(15),
                  //   child: Column(children: [
                  //     MaterialButton(
                  //       onPressed: () {
                  //         widget.providerAriza.openFile(
                  //             url: widget
                  //                 .providerAriza.modelGetDownloadsData2.src,
                  //             fileName: "ruxsatnoma");
                  //       },
                  //       height: 50,
                  //       minWidth: double.infinity,
                  //       color: MyColors.appColorBBA(),
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: MyWidgets.robotoFontText(
                  //           text: "download".tr(),
                  //           textColor: MyColors.appColorWhite()),
                  //     ),
                  //   ]),
                  // ),
                ]),
              )
              //     : Center(
              //   child: MyWidgets.loaderDownload(context: context),
              // )
              //     : Center(
              //   child: MyWidgets.loaderDownload(context: context),
              // )
            // Center(
            //         child: Text(
            //         "noInfoAbiturRuxsat".tr(),
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: MyColors.appColorBlack(),
            //           fontWeight: FontWeight.w500,
            //           fontSize: 18,
            //         ),
            //       )),
          )),
    );
  }
}
