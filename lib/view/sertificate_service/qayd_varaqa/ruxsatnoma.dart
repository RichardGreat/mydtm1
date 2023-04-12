import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class CertRuxsatnomaView extends StatefulWidget {
  String certRuxsatnomaVaraqaId;
   CertRuxsatnomaView({Key? key, required this.certRuxsatnomaVaraqaId}) : super(key: key);

  @override
  State<CertRuxsatnomaView> createState() => _CertRuxsatnomaViewState();
}

class _CertRuxsatnomaViewState extends State<CertRuxsatnomaView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyWidgets.robotoFontText(text: "certRuxsatnoma".tr(), textSize: 18),
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
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: const PDF(
                        autoSpacing: false,

                        fitEachPage: true,
                      ).fromUrl(
                     //    "https://my.uzbmb.uz/allow/m-allow/96904fd98809af197d33453dbd2b33a8",
                        "${MainUrl.mainUrls}/v1/national/allow/${widget.certRuxsatnomaVaraqaId.toString()}",
                        placeholder: (progress) =>
                            Center(child: Text('$progress %')),
                        errorWidget: (error) =>
                            Center(child: Text(error.toString())),
                      )),

                ]),
          )),
    );
  }
}
