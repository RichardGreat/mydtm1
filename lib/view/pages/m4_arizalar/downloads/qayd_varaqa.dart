import 'package:easy_localization/easy_localization.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
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
    // await widget.providerAriza.getDownloads(categoryId: 1);
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
        // actions: [
        //   IconButton(onPressed: (){
        //     Share.share(widget.providerAriza.modelGetDownloads1.src);
        //   },
        //   icon: const Icon(Icons.share),
        //   )
        // ],
      ),
      body: SafeArea(
          child: Container(
        child: widget.providerAriza.boolDataDownload1
            ? widget.providerAriza.modelGetDownloadsData1.status == 1
                ? SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child:
                          PDFViewer(
                            document: widget.providerAriza.doc,
                            lazyLoad: false,

                            scrollDirection: Axis.vertical,
                            zoomSteps: 1,
                            showIndicator: false,
                            showPicker: false,
                            showNavigation: false,
                          ),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.all(15),
                      //   child: Column(children: [
                      //     widget.providerAriza.loading
                      //         ? LinearProgressIndicator(
                      //             minHeight: 10,
                      //             value: widget.providerAriza.progress,
                      //           )
                      //         :
                      //         MaterialButton(
                      //             onPressed: () {
                      //               pushNewScreen(context,
                      //                   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      //                   screen: ChooseEdu(funcState: getBoshFunc));
                      //             },
                      //             height: 50,
                      //             minWidth: double.infinity,
                      //             color: MyColors.appColorBlue1(),
                      //             shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(10)),
                      //             child: MyWidgets.robotoFontText(
                      //                 text: "editEdu".tr(),
                      //                 textColor: MyColors.appColorWhite()),
                      //           ),
                      //   ]),
                      // ),
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
