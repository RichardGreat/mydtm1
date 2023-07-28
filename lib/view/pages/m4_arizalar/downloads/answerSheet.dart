// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
// import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class AnswerSheetDownload extends StatefulWidget {
  ProviderAriza providerAriza;

  AnswerSheetDownload({Key? key, required this.providerAriza})
      : super(key: key);

  @override
  State<AnswerSheetDownload> createState() => _AnswerSheetDownloadState();
}

class _AnswerSheetDownloadState extends State<AnswerSheetDownload> {
  @override
  initState() {
    getDownload();
    super.initState();
  }

  Future getDownload() async {
    await widget.providerAriza.getDownloads(categoryId: 3);
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(
        title: MyWidgets.robotoFontText(text: "answerSheet".tr(), textSize: 18),
        centerTitle: true,
        backgroundColor: MyColors.appColorWhite(),
        iconTheme: IconThemeData(color: MyColors.appColorBlack()),
        elevation: 0,
        actions: [
          widget.providerAriza.boolDataDownload3
              ? widget.providerAriza.modelGetDownloadsData3.status.toString() ==
              "1"?

          IconButton(
            onPressed: () async{
           await   widget.providerAriza.downloadFileJavobVaraqa(
                  url: widget.providerAriza.modelGetDownloads3.src,
                  name: "javob_varaqa");
              Share.share(widget.providerAriza.fileUrlJavobVaraqa.path);
            },
            icon: const Icon(Icons.share),
          )
              :SizedBox.shrink()
              :SizedBox.shrink()
        ],
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(15),
        child: widget.providerAriza.boolDataDownload3
            ? widget.providerAriza.modelGetDownloadsData3.status.toString() ==
                    "1"
                ? SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: const PDF(
                            fitEachPage: true,
                            autoSpacing: true,
                            enableSwipe: true
                          ).cachedFromUrl(widget.providerAriza.modelGetDownloads3.src)),
                      // Container(
                      //   margin: const EdgeInsets.all(15),
                      //   child: Column(children: [
                      //     MaterialButton(
                      //       onPressed: () {
                      //         widget.providerAriza.openFileJavobVaraqa(
                      //             url: widget
                      //                 .providerAriza.modelGetDownloads3.src,
                      //             fileName: "javob_varaqa");
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
                : Center(
                    child: MyWidgets.loaderDownload(context: context),
                  )
            : Center(
                child: Text(
                "noInfoAbiturResult".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors.appColorBlack(),
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              )),
      )),
    );
  }
}
