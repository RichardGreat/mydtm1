import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

// ignore: must_be_immutable
class QaydVaraqaDownload extends StatefulWidget {
  ProviderAriza providerAriza;

  QaydVaraqaDownload({Key? key, required this.providerAriza}) : super(key: key);

  @override
  State<QaydVaraqaDownload> createState() => _QaydVaraqaDownloadState();
}

class _QaydVaraqaDownloadState extends State<QaydVaraqaDownload> {
  @override
  initState() {
    getDownload();
    super.initState();
  }

  Future getDownload() async {
    await widget.providerAriza.getDownloads(categoryId: 1);
    setState(() {});
  }

  Future getBoshFunc() async {
    await widget.providerAriza.getDownloads(categoryId: 1);
    setState(() {});
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
          child: Container(
        child: widget.providerAriza.boolDataDownload1
            ? widget.providerAriza.modelGetDownloadsData1.status == 1
                ? SingleChildScrollView(
                    child: Column(children: [
                      // SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.6,
                      //     child: const PDF(
                      //       autoSpacing: false,
                      //       fitEachPage: true,
                      //     ).fromUrl(
                      //       widget.providerAriza.modelGetDownloads1.src,
                      //       placeholder: (progress) =>
                      //           Center(child: Text('$progress %')),
                      //       errorWidget: (error) =>
                      //           Center(child: Text(error.toString())),
                      //     )),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(children: [
                          widget.providerAriza.loading
                              ? LinearProgressIndicator(
                                  minHeight: 10,
                                  value: widget.providerAriza.progress,
                                )
                              : MaterialButton(
                                  onPressed: () {
                                    widget.providerAriza.download(
                                        urls: widget.providerAriza
                                            .modelGetDownloads1.src,
                                        fileName: "qayd_varaqa.pdf");
                                    // widget.providerAriza.openFile(
                                    //     url: widget
                                    //         .providerAriza.modelGetDownloads1.src,
                                    //     fileName: "dtm1");
                                  },
                                  height: 50,
                                  minWidth: double.infinity,
                                  color: MyColors.appColorBlue1(),
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
                    child: MyWidgets.robotoFontText(text: "infoNotFind".tr()),
                  )
            : MyWidgets.loaderDownload(context: context),
      )),
    );
  }
}
