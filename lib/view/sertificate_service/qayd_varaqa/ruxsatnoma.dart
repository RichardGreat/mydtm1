import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
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

  getAllowLink() async {
    try {
      Response response = await dio.get(
          "${MainUrl.mainUrls}/v1/national/allow/${widget.certRuxsatnomaVaraqaId}",
          options: Options(headers: {"X-Access-Token": box.get("token")}));
      link = ModelCertAllow.fromJson(jsonDecode(jsonEncode(response.data)))
          .data
          .allow
          .toString();

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
                            child: const PDF(
                              autoSpacing: false,
                              fitEachPage: true,
                            ).fromUrl(
                              //    "https://my.uzbmb.uz/allow/m-allow/96904fd98809af197d33453dbd2b33a8",
                              link,
                              headers: {"X-Access-Token": box.get("token")},
                              placeholder: (progress) =>
                                  Center(child: Text('$progress %')),
                              errorWidget: (error) =>
                                  Center(child: Text(error.toString())),
                            )),
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
