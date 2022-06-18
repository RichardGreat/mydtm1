import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:mydtm/view/pages/m5_xabarlar/provider_news.dart';

// ignore: must_be_immutable
class NewsSee extends StatefulWidget {
  ProviderDtmNews providerDtmNews;
  final String id;
  final String date;
  final String titleName;
  final String imgUrl;

  NewsSee(
      {required this.id,
      required this.imgUrl,
      required this.titleName,
      required this.providerDtmNews,
      required this.date});

  @override
  _NewsSeeState createState() => _NewsSeeState();
}

class _NewsSeeState extends State<NewsSee> {
  @override
  void initState() {
    getOneNew();
    super.initState();
  }

  Future getOneNew() async {
    await widget.providerDtmNews.getBodyById(id: widget.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: !widget.providerDtmNews.boolDownLoadData
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
              child: Container(
                height:  MediaQuery.of(context).size.height,
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.grey)]),
                      child: CachedNetworkImage(
                        height: 80,
                        width: 100,
                        fit: BoxFit.fill,
                        imageUrl: widget.imgUrl,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                        child: Text(widget.date, style: TextStyle(fontWeight: FontWeight.w500),)),
                    const SizedBox(height: 10),
                    Expanded(
                      child: HtmlWidget(
                        jsonDecode(widget.providerDtmNews.data)
                            .toString()
                            .replaceAll("[", "")
                            .replaceAll("]", "")
                            .replaceAll("{", "")
                            .replaceAll("}", "")
                            .replaceAll("body:", ""),
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
