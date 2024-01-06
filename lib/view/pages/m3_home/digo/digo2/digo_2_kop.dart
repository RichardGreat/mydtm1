import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/provider_digo2.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/widget_model_sheet2/fan21.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/widget_model_sheet2/fan22.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/widget_model_sheet2/son.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/widget_model_sheet2/til2.dart';
import 'package:provider/provider.dart';

class Digo2DanKop extends StatefulWidget {
  ModelDigo2GetRegion modelDigo2;

  Digo2DanKop({super.key, required this.modelDigo2});

  @override
  State<Digo2DanKop> createState() => _Digo2DanKopState();
}

class _Digo2DanKopState extends State<Digo2DanKop> {
  ProviderDigo2 providerDigo2 = ProviderDigo2();

  @override
  void initState() {
    addFirsData();
    scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(scrollListener);
    animateToLast();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  animateToLast() async {
    await Future.delayed(const Duration(milliseconds: 500)).then((_) {
      try {
        scrollController
            .animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
        )
            .then((value) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
          );
        });
      } catch (e) {
        // print('error on scroll $e');
      }
    });
  }

  addFirsData() {
    log("initstate");
    log(jsonEncode(widget.modelDigo2).toString());
    providerDigo2.setDataModel(modelDigo2GetRegion: widget.modelDigo2);
  }

  ScrollController scrollController = ScrollController();

  scrollListener() async {
    if (scrollController.offset <= scrollController.position.maxScrollExtent &&
        scrollController.position.outOfRange) {
      // scrollController.addListener(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerDigo2,
      child: Consumer<ProviderDigo2>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 5),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.teal.shade100,
                              blurRadius: 1,
                              spreadRadius: 1)
                        ]),
                    child: Text(
                      "TASDIQLASH",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade700),
                    ),
                  ),
                )
              ],
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: providerDigo2.modelDigo2.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: index % 2 ==0 ? Colors.grey.shade200 : Colors.grey.shade50,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.teal.withOpacity(0.3),
                                    // blurStyle: BlurStyle.inner,
                                    blurRadius: 1,
                                    spreadRadius: 0.2,
                                    offset: const Offset(0, 1))
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          height: 430,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("1-Fan"),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Text(
                                        (index + 1).toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal),
                                      ),
                                    )
                                  ],
                                ),
                                Card(
                                  color: Colors.white,
                                  shadowColor: Colors.teal.shade300,
                                  elevation: 1.5,
                                  child: ListTile(
                                    onTap: () {
                                      getRegionSheet(
                                          context: context,
                                          providerDigo: providerDigo2,
                                          index: 1,
                                          intIndexLists: index);
                                    },
                                    leading: Text(
                                        providerDigo2.textFan1(index: index),
                                        style: const TextStyle(fontSize: 18)),
                                    trailing: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                  ),
                                ),
                                Text("2-Fan"),
                                Card(
                                  color: Colors.white,
                                  shadowColor: Colors.teal.shade300,
                                  elevation: 1.5,
                                  child: ListTile(
                                    onTap: () {
                                      getRegionSheet(
                                          context: context,
                                          providerDigo: providerDigo2,
                                          index: 2,
                                          intIndexLists: index);
                                    },
                                    leading: Text(
                                        providerDigo2.textFan2(index: index),
                                        style: const TextStyle(fontSize: 18)),
                                    trailing: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                  ),
                                ),
                                const Text("Til tanlang"),
                                Card(
                                  color: Colors.white,
                                  shadowColor: Colors.teal.shade300,
                                  elevation: 1.5,
                                  child: ListTile(
                                    onTap: () {
                                      getRegionSheet(
                                          context: context,
                                          providerDigo: providerDigo2,
                                          index: 3,
                                          intIndexLists: index);
                                    },
                                    leading: Text(
                                        providerDigo2.textTil(index: index),
                                        style: const TextStyle(fontSize: 18)),
                                    trailing: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                  ),
                                ),
                                const Text("Son kiriting"),
                                Card(
                                  color: Colors.white,
                                  shadowColor: Colors.teal.shade300,
                                  elevation: 1.5,
                                  child: ListTile(
                                    onTap: () {
                                      getRegionSheet(
                                          context: context,
                                          providerDigo: providerDigo2,
                                          index: 4,
                                          intIndexLists: index);
                                    },
                                    leading: Text(
                                        providerDigo2.sonDigo(index: index),
                                        style: const TextStyle(fontSize: 18)),
                                    trailing: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Visibility(
                                      visible:
                                          providerDigo2.modelDigo2.data.length >
                                                  1 &&
                                              index != 0,
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: const Text(
                                                    "O'chirishni xoxlaysizmi?",
                                                    style: TextStyle(
                                                        color: Colors.teal,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                action: SnackBarAction(
                                                  label: 'Xa',
                                                  textColor: Colors.teal,
                                                  onPressed: () {
                                                    providerDigo2
                                                        .removeDataModel(index);

                                                    animateToLast();
                                                  },
                                                ),
                                              ));
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                            ),
                                            color: Colors.red,
                                          )),
                                    ),
                                    Visibility(
                                      visible: index ==
                                          providerDigo2.modelDigo2.data.length -
                                              1,
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            onPressed: () {
                                              providerDigo2
                                                      .modelDigo2
                                                      .data[index]
                                                      .countDigo
                                                      .isNotEmpty && providerDigo2
                                                  .modelDigo2
                                                  .data[index]
                                                  .countDigo!="0"
                                                  ? {
                                                      providerDigo2.addBosh(),
                                                      animateToLast(),
                                                    }
                                                  : {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        content: Text(
                                                            "Hamma maydonlarni to'ldiring",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.teal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      )),
                                                    };
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                            ),
                                            color: Colors.teal,
                                          )),
                                    )
                                  ],
                                )
                              ]),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 10, right: 25),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(providerDigo2.allCost(),
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => SizedBox(
                                  height: 400,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 15, 30, 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: 'Jami soni: ',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: providerDigo2.jamSon
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16)),
                                                  const TextSpan(text: ' ta'),
                                                ],
                                              ),
                                            ),
                                            // Text("Jami soni: "+providerDigo2.jamSon.toString() +" ta",
                                            //     style: const TextStyle(
                                            //         fontWeight: FontWeight.w600)),
                                            Text(providerDigo2.allCost(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Buyrutma",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Soni",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Expanded(
                                          child: ListView.builder(
                                        itemCount: providerDigo2
                                            .modelDigo2.data.length,
                                        itemBuilder: (context, index) => Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            providerDigo2.modelDigo2.data[index]
                                                    .countDigo.isNotEmpty
                                                ? Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 25),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "1. ${providerDigo2.modelDigo2.data[index].nameFan1 ?? ""}",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            Text(
                                                              "2. ${providerDigo2.modelDigo2.data[index].nameFan2 ?? ""}",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            Text(
                                                              providerDigo2
                                                                      .modelDigo2
                                                                      .data[
                                                                          index]
                                                                      .langName ??
                                                                  "",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          "${providerDigo2.modelDigo2.data[index].countDigo} ta",
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            providerDigo2.modelDigo2.data[index]
                                                    .countDigo.isNotEmpty
                                                ? const Divider()
                                                : const SizedBox.shrink(),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.teal,
                            ))
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getRegionSheet({
    required BuildContext context,
    required ProviderDigo2 providerDigo,
    required int index,
    required int intIndexLists,
  }) {
    intIndexLists != 0
        ? showModalBottomSheet(
            context: context,
            enableDrag: true,
            elevation: 0,
            backgroundColor: Colors.white,
            builder: (context) => Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(15),
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: digoById(index: index, intIndexList: intIndexLists),
                ))
        : {};
  }

  Widget digoById({required int index, required int intIndexList}) {
    if (intIndexList != 0) {
      if (providerDigo2.modelDigo2.data[intIndexList].nameFan1
              .toString()
              .length <
          5) {
        log(providerDigo2.modelDigo2.data[intIndexList].nameFan1.toString());
        index = 1;
      } else if (providerDigo2.modelDigo2.data[intIndexList].nameFan2
              .toString()
              .length <
          5) {
        log(providerDigo2.modelDigo2.data[intIndexList].nameFan2.toString());
        index = 2;
      } else if (providerDigo2.modelDigo2.data[intIndexList].langName
              .toString()
              .length <
          5) {
        log(providerDigo2.modelDigo2.data[intIndexList].langName.toString());
        index = 3;
      } else if (providerDigo2
          .modelDigo2.data[intIndexList].countDigo.isEmpty) {
        index = 4;
      }

      switch (index) {
        case 1:
          return GetDigoFan21(
              providerDigo: providerDigo2, indexList: intIndexList);

        case 2:
          return GetDigoFan22(
              providerDigo: providerDigo2, indexList: intIndexList);
        case 3:
          return GetDigoLang2(
              providerDigo: providerDigo2, indexList: intIndexList);
        case 4:
          return SonKiritish(
              providerDigo: providerDigo2, indexList: intIndexList);
        default:
          return const SizedBox.shrink();
      }
    } else {
      return SizedBox.shrink();
    }
  }
}
