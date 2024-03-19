import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo_main/provider_digo_main.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DigoMain extends StatefulWidget {
  const DigoMain({super.key});

  @override
  State<DigoMain> createState() => _DigoMainState();
}

class _DigoMainState extends State<DigoMain> {
  ProviderDigoMain providerDigoMain = ProviderDigoMain();

  @override
  void initState() {
    getData(numPage: "1");
    _scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
    super.initState();
  }

  getData({required String numPage}) async {
    if (numPage == "1") {
      await providerDigoMain.getAllData(pageNum: numPage);
    } else {
      await providerDigoMain.getNextPage(pageNum: numPage);
    }
  }

  ScrollController _scrollController = ScrollController();

  var pageCount = 2;

  _scrollListener() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      try {
        getData(numPage: pageCount.toString());
        pageCount = pageCount + 1;
      } catch (e) {
        log(e.toString());
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  var box = Hive.box("online");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerDigoMain,
      child: Consumer<ProviderDigoMain>(
        builder: (context, value, child) => Form(
          onPopInvoked: (bool e) {
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                  builder: (context) => const MainPages(homeIdMainpage: "1"),
                ),
                (route) => false);
          },
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const MainPages(homeIdMainpage: "1"),
                        ), (route) => false,);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
              title: Text("digoTest".tr(),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: SafeArea(child: bodyBuild()),
          ),
        ),
      ),
    );
  }

  Widget bodyBuild() {
    if (providerDigoMain.textServerResponse == "0") {
      return const Center(child: CupertinoActivityIndicator());
    } else if (providerDigoMain.textServerResponse == "1") {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    height: 50,
                    shape: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.teal,
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const Digo(),
                          ));
                    },
                    child: Text(
                      "order".tr(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  "myOrders".tr(),
                  style: const TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: RefreshIndicator.adaptive(
                onRefresh: () async {
                  getData(numPage: "1");
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: providerDigoMain.listDatum.length + 1,
                  itemBuilder: (context, index) => index !=
                          providerDigoMain.listDatum.length
                      ? Container(
                          margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.teal.shade50,
                                    spreadRadius: 1,
                                    blurRadius: 0.2),
                              ],
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      "${providerDigoMain.getFanName(index: index)} : ${providerDigoMain.getFanName2(index: index)}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    providerDigoMain
                                        .listDatum[index].order[0].dir.lang.name
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text("booksCount".tr(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          providerDigoMain.listDatum[index].cnt
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                        "${"oldOrder".tr()} : ${providerDigoMain.listDatum[index].createAt.toString().substring(0, 10)}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(
                                        text: providerDigoMain
                                            .listDatum[index].invoice
                                            .toString(),
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              duration:
                                                  const Duration(seconds: 1),
                                              content: Text(
                                                "${"copy".tr()} ${providerDigoMain.listDatum[index].invoice.toString()}",
                                              )));
                                    },
                                    child: Text(
                                        "${"invoice".tr()} : ${providerDigoMain.listDatum[index].invoice.toString()}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal)),
                                  ),
                                  Text(
                                      "${"cost".tr()} : ${providerDigoMain.listDatum[index].pay.toString() == "0" ? "noPayed".tr() : "payed".tr()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: providerDigoMain
                                                      .listDatum[index].pay
                                                      .toString() ==
                                                  "0"
                                              ? Colors.red
                                              : Colors.teal)),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(
                                          text: providerDigoMain
                                              .listDatum[index].invoice
                                              .toString(),
                                        ));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                duration:
                                                    const Duration(seconds: 1),
                                                content: Text(
                                                  "${"copy".tr()} ${providerDigoMain.listDatum[index].invoice.toString()}",
                                                )));
                                      },
                                      child: QrImageView(
                                        data: providerDigoMain
                                            .listDatum[index].invoice
                                            .toString(),
                                        version: QrVersions.auto,
                                        size: 100.0,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "invoice".tr(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      : providerDigoMain.listDatum.length > 5
                          ? SizedBox(
                              height: 100,
                              child: Center(
                                child: providerDigoMain.textNextNull == "0"
                                    ? const CupertinoActivityIndicator()
                                    : IconButton(
                                        onPressed: () {
                                          _scrollController.animateTo(
                                            0.0,
                                            curve: Curves.easeOut,
                                            duration: const Duration(
                                                milliseconds: 700),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.keyboard_double_arrow_up,
                                          color: Colors.teal,
                                        )),
                              ),
                            )
                          : const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(providerDigoMain.textServerResponse,
                textAlign: TextAlign.center, maxLines: 4),
            const SizedBox(height: 10),
            const Text("Xatolik"),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                providerDigoMain.getAllData(pageNum: "1");
              },
              color: Colors.white,
              minWidth: 200,
              height: 50,
              child: const Text("Qayta urinish",
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      );
    }
  }
}
