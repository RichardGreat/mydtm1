// ignore_for_file: must_be_immutable, file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

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
    setState(() {});
  }

  Future getBoshFunc() async {
    await widget.providerAriza.getDownloads(categoryId: 2);
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
      ),
      body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(15),
        child: widget.providerAriza.boolDataDownload2
            ? widget.providerAriza.modelGetDownloadsData2.status.toString() ==
                    "1"
                ? SingleChildScrollView(
                    child: Column(children: [
                      // SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.6,
                      //     child: const PDF(
                      //       autoSpacing: false,
                      //       fitEachPage: true,
                      //     ).fromUrl(
                      //       widget.providerAriza.modelGetDownloads2.src,
                      //       placeholder: (progress) =>
                      //           Center(child: Text('$progress %')),
                      //       errorWidget: (error) =>
                      //           Center(child: Text(error.toString())),
                      //     )),
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
