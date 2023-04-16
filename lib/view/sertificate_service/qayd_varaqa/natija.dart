import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/model_natija.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class CertificateResultsView extends StatefulWidget {
  String certId;

  CertificateResultsView({
    Key? key,
    required this.certId,
  }) : super(key: key);

  @override
  State<CertificateResultsView> createState() => _CertificateResultsViewState();
}

class _CertificateResultsViewState extends State<CertificateResultsView> {
  var box = Hive.box("online");

  @override
  void initState() {
    getAllowLink();
    super.initState();
  }
  late PDFDocument doc;
  bool isLoading = false;

  bool boolGetAllowLink = false;
  bool boolGetAllowLinkError = true;
  var dio = Dio();
  String link = "";
  String maxBall = "";

  getAllowLink() async {
    try {
      log(widget.certId);
      //https://apimobile.uzbmb.uz/v1/national/answer/40
      Response response = await dio.get(
          "${MainUrl.mainUrls}/v1/national/answer/${widget.certId}",
          options: Options(headers: {"X-Access-Token": box.get("token")}));
      link =
          DataCertificateResults
              .fromJson(jsonDecode(jsonEncode(response.data)))
              .answer
              .link
              .toString();
      maxBall =
          DataCertificateResults
              .fromJson(jsonDecode(jsonEncode(response.data)))
              .answer
              .commonBall
              .toString();
      setState(() async{
        isLoading = false;
        doc = await PDFDocument.fromURL(link,
            headers: {"X-Access-Token": box.get("token")}
        );
        isLoading = true;
      });
      boolGetAllowLink = true;
      boolGetAllowLinkError = false;
      setState(() {});
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
        title: MyWidgets.robotoFontText(text: "certificateNatja".tr(), textSize: 18),
        centerTitle: true,
        backgroundColor: MyColors.appColorWhite(),
        iconTheme: IconThemeData(color: MyColors.appColorBlack()),
        elevation: 0,
      ),
      body: boolGetAllowLink
          ?
      SafeArea(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.7,
                      child:   isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : PDFViewer(
                        document: doc,
                        lazyLoad: false,
                        zoomSteps: 1,
                        backgroundColor: Colors.white,
                        progressIndicator:const Center(child:Text("")),
                        numberPickerConfirmWidget: const Text(
                          "Confirm",
                        ),),),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(children: [
                      ListTile(
                        title:Text("$maxBall ${"ball".tr()}", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                      )
                    ]),
                  ),
                ]),
          ))
          : boolGetAllowLinkError
          ? const Center(
            child: CupertinoActivityIndicator())   : Center(
             child: Text("infoNotFind".tr()))

    );
  }
}
