// ignore_for_file: must_be_immutable, file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:share_plus/share_plus.dart';

class AccessPaperDownload extends StatefulWidget {
  ProviderAriza providerAriza;

  AccessPaperDownload({Key? key, required this.providerAriza})
      : super(key: key);

  @override
  State<AccessPaperDownload> createState() => _AccessPaperDownloadState();
}

class _AccessPaperDownloadState extends State<AccessPaperDownload> {
  @override
  initState() {
    getDownload();
    super.initState();
  }

  Future getDownload() async {
    await widget.providerAriza.getDownloads(categoryId: 2);
    // await widget.providerAriza.getDownloads(categoryId: 1);
    setState(() {});
  }

  Future getBoshFunc() async {
    await widget.providerAriza.getDownloads(categoryId: 2);
    // await widget.providerAriza.getDownloads(categoryId: 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(
        title: MyWidgets.robotoFontText(text: "accessPaper".tr(), textSize: 18),
        centerTitle: true,
        backgroundColor: MyColors.appColorWhite(),
        iconTheme: IconThemeData(color: MyColors.appColorBlack()),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            widget.providerAriza.downloadFile(url: widget.providerAriza.modelGetDownloads2.src, name: "bmba");
            Share.share(widget.providerAriza.fileUrl.path);
          },
          icon: const Icon(Icons.share),
          )
        ],
      ),
      body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(15),
        child: widget.providerAriza.boolDataDownload2
            ? widget.providerAriza.modelGetDownloadsData2.status.toString() ==
         // child: widget.providerAriza.boolDataDownload1
         //    ? widget.providerAriza.modelGetDownloadsData1.status.toString() ==
                    "1"
                ? SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child:PDFViewer(
                            document: widget.providerAriza.doc2,
                            lazyLoad: false,
                            scrollDirection: Axis.vertical,
                            zoomSteps: 1,
                            showIndicator: false,
                            showPicker: false,
                            showNavigation: false,
                          )),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(children: [
                          MaterialButton(
                            onPressed: () {

                              widget.providerAriza.openFile(
                                  url: widget
                                      .providerAriza.modelGetDownloads2.src,
                                  fileName: "ruxsatnoma");
                            },
                            height: 50,
                            minWidth: double.infinity,
                            color: MyColors.appColorBBA(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: MyWidgets.robotoFontText(
                                text: "download".tr(),
                                textColor: MyColors.appColorWhite()),
                          ),
                        ]),
                      ),
                    ]),
                  )
                : Center(
                    child: MyWidgets.loaderDownload(context: context),
                  )
            : Center(child:
        Text( "noInfoAbiturRuxsat".tr(),
          textAlign: TextAlign.center,
          style: TextStyle(color: MyColors.appColorBlack(), fontWeight: FontWeight.w500, fontSize: 18, ),)),
      )),
    );
  }
}
