import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/provider_check_information.dart';
import 'package:mydtm/view/pages/otm/choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

// ignore: must_be_immutable
class QaydVaraqaEdit extends StatefulWidget {
  ProviderCheckInformation providerCheckInformation;

  QaydVaraqaEdit({Key? key, required this.providerCheckInformation}) : super(key: key);

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
            child: widget.providerCheckInformation.boolDataDownload1
                ? widget.providerCheckInformation.modelGetDownloadsData1.status == 1
                ? SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: const PDF(
                      autoSpacing: false,
                      fitEachPage: true,
                    ).fromUrl(
                      widget.providerCheckInformation.modelGetDownloads1.src,
                      placeholder: (progress) =>
                          Center(child: Text('$progress %')),
                      errorWidget: (error) =>
                          Center(child: Text(error.toString())),
                    )),
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
                        pushNewScreen(context,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            screen: ChooseEdu(funcState: getBoshFunc));
                      },
                      height: 50,
                      minWidth: double.infinity,
                      color: MyColors.appColorWhite(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: MyColors.appColorBlack())),
                      child: MyWidgets.robotoFontText(
                          text: "editEdu".tr(),
                          textColor: MyColors.appColorBlack()),
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
