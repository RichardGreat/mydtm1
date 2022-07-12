import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:mydtm/view/pages/m5_xabarlar/provider_news.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

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
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: MyColors.appColorBlack()),

            backgroundColor: MyColors.appColorWhite(),
            floating: false,
            elevation: 0,
            expandedHeight: 10,
            // flexibleSpace:
            foregroundColor: MyColors.appColorWhite(),
            excludeHeaderSemantics: true,
          ),
          SliverToBoxAdapter(
            child:   Container(
              margin: const EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: const [BoxShadow(color: Colors.grey)]),
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
          )
        ];
      },
      body: !widget.providerDtmNews.boolDownLoadData
          ? const Center(
        child: CupertinoActivityIndicator(),
      )
          : Scaffold(body: SafeArea(
          child: Container(
            height:  MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(widget.date, style: const TextStyle(fontWeight: FontWeight.w500),)),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
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
                ),
              ],
            ),
          ))),
    );
  }
}
