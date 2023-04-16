import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/model_cert_allow.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class CertRuxsatnomaView extends StatefulWidget {
  String certRuxsatnomaVaraqaId;

  CertRuxsatnomaView({Key? key, required this.certRuxsatnomaVaraqaId})
      : super(key: key);

  @override
  State<CertRuxsatnomaView> createState() => _CertRuxsatnomaViewState();
}

class _CertRuxsatnomaViewState extends State<CertRuxsatnomaView> {
  var box = Hive.box("online");

  @override
  void initState() {
    getAllowLink();
    log(widget.certRuxsatnomaVaraqaId);
    super.initState();
  }

  bool boolGetAllowLink = false;
  bool boolGetAllowLinkError = true;
  var dio = Dio();
  String link = "";
  late PDFDocument doc;
  bool isLoading = false;
  getAllowLink() async {
    try {

      Response response = await dio.get(
          "${MainUrl.mainUrls}/v1/national/allow/${widget.certRuxsatnomaVaraqaId}",
          options: Options(headers: {"X-Access-Token": box.get("token")
          }));
      link = ModelCertAllow.fromJson(jsonDecode(jsonEncode(response.data)))
          .data
          .allow
          .toString();
      setState(() => isLoading = false);

      doc = await PDFDocument.fromURL(link,
          headers: {"X-Access-Token": box.get("token")}
      );
      boolGetAllowLink = true;
      boolGetAllowLinkError = false;
      setState(() => isLoading = true);
    } catch (e) {
      boolGetAllowLinkError = false;
      boolGetAllowLink = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            MyWidgets.robotoFontText(text: "certRuxsatnoma".tr(), textSize: 18),
        centerTitle: true,
        backgroundColor: MyColors.appColorWhite(),
        iconTheme: IconThemeData(color: MyColors.appColorBlack()),
        elevation: 0,
      ),
      body: SafeArea(
          child: boolGetAllowLink
              ? SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child:    !isLoading
                                ? const Center(child: CircularProgressIndicator())
                                : PDFViewer(
                                 document: doc,
                                 lazyLoad: false,
                                 zoomSteps: 1,
                                 backgroundColor: Colors.white,
                                  numberPickerConfirmWidget: const Text(
                                "",
                              ),),),
                      ]),
                )
              : boolGetAllowLinkError
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : Center(
                      child: Text("infoNotFind".tr()),
                    )),
    );
  }
}
