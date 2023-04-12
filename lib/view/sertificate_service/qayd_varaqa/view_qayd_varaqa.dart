import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class CertQaydVaraqaView extends StatefulWidget {

  String certQaytVaraqaId;
  CertQaydVaraqaView({Key? key, required this.certQaytVaraqaId}) : super(key: key);

  @override
  State<CertQaydVaraqaView> createState() => _CertQaydVaraqaViewState();
}

class _CertQaydVaraqaViewState extends State<CertQaydVaraqaView> {

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
                  child: const PDF(
                    autoSpacing: false,

                    fitEachPage: true,
                  ).fromUrl(
                    "${MainUrl.mainUrls}/v1/national/pdf-aplication/${widget.certQaytVaraqaId}",
                    placeholder: (progress) =>
                        Center(child: Text('$progress %')),
                    errorWidget: (error) =>
                        Center(child: Text(error.toString())),
                  )),
              Container(
                margin: const EdgeInsets.all(15),
                child: Column(children: [
                  // widget.providerAriza.loading
                  //     ?
                  // LinearProgressIndicator(
                  //   minHeight: 10,
                  //   value: widget.providerAriza.progress,
                  // )
                  //     :
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // widget.providerAriza.download(
                      //     urls: widget.providerAriza
                      //         .modelGetDownloads1.src ,  fileName: "qayd_varaqa.pdf" );
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
                        text: "editEdu".tr(),
                        textColor: MyColors.appColorWhite()),
                  ),

                ]),
              ),
            ]),
          )),
    );
  }
}
