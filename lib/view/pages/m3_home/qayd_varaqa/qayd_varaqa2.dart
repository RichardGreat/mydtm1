import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

// import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/provider_check_information.dart';
import 'package:mydtm/view/pages/otm/choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:showcaseview/showcaseview.dart';

// ignore: must_be_immutable
class QaydVaraqaEdit extends StatefulWidget {
  ProviderCheckInformation providerCheckInformation;

  QaydVaraqaEdit({Key? key, required this.providerCheckInformation})
      : super(key: key);

  @override
  State<QaydVaraqaEdit> createState() => _QaydVaraqaEditState();
}

class _QaydVaraqaEditState extends State<QaydVaraqaEdit> {
  @override
  initState() {
    getDownload();
    super.initState();
  }

  Future getDownload() async {
    await widget.providerCheckInformation.getQaydVaraqa2();
    setState(() {});
  }

  Future getBoshFunc() async {
    // await widget.providerCheckInformation.getQaydVaraqa2();
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
        padding: const EdgeInsets.all(8),
        child: widget.providerCheckInformation.boolDataDownload1
            ? widget.providerCheckInformation.modelGetDownloadsData1.status == 1
                ? SingleChildScrollView(
                    child: Column(children: [
                      // SizedBox(
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.72,
                          child: const PDF().cachedFromUrl(widget
                              .providerCheckInformation.modelGetDownloads1.src)
                          // PDFViewer(
                          //   document: widget.providerCheckInformation.doc,
                          //   lazyLoad: false,
                          //   scrollDirection: Axis.vertical,
                          //   zoomSteps: 1,
                          //   showIndicator: false,
                          //   showPicker: false,
                          //   showNavigation: false,
                          // ),
                          ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(children: [
                          // MaterialButton(
                          //   onPressed: () {
                          //     widget.providerCheckInformation.openFile(
                          //         url: widget
                          //             .providerCheckInformation.modelGetDownloads1.src,
                          //         fileName: "dtm1");
                          //   },
                          //   height: 50,
                          //   minWidth: double.infinity,
                          //   color: MyColors.appColorBlue1(),
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: MyWidgets.robotoFontText(
                          //       text: "download".tr(),
                          //       textColor: MyColors.appColorWhite()),
                          // ),
                          // const SizedBox(height: 10),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => ShowCaseWidget(
                                builder: Builder(
                                  builder: (context) =>
                                      ChooseEdu(funcState: getBoshFunc),
                                ),)));
                            },
                            height: 50,
                            minWidth: double.infinity,
                            color: MyColors.appColorWhite(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side:
                                    BorderSide(color: MyColors.appColorBBA())),
                            child: MyWidgets.robotoFontText(
                                text: "editEdu".tr(),
                                textColor: MyColors.appColorBBA()),
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
