import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/provider_digo2.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/widget_model_sheet2/fan21.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/widget_model_sheet2/fan22.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/widget_model_sheet2/son.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/widget_model_sheet2/til2.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
    providerDigo2.setDataModel(modelDigo2GetRegion: widget.modelDigo2);
  }

  ScrollController scrollController = ScrollController();

  scrollListener() async {
    if (scrollController.offset <= scrollController.position.maxScrollExtent &&
        scrollController.position.outOfRange) {
      // scrollController.addListener(() {});
    }
  }


  Widget bodyBuild(){
    if(providerDigo2.sentServer == "1"){
      return Container(
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
                        color: index % 2 == 0
                            ? Colors.grey.shade200
                            : Colors.grey.shade50,
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
                               Text("firsSub".tr()),
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
                           Text("secondSub".tr()),
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
                           Text("chooseLang".tr()),
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
                           Text("enterNum".tr()),
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
                                          content:  Text(
                                              "wantDelete".tr(),
                                              style: const TextStyle(
                                                  color: Colors.teal,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          action: SnackBarAction(
                                            label: 'yes'.tr(),
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
                                            .isNotEmpty
                                            ? {
                                          providerDigo2
                                              .modelDigo2
                                              .data[
                                          index]
                                              .countDigo ==
                                              "0" ||
                                              providerDigo2
                                                  .modelDigo2
                                                  .data[
                                              index]
                                                  .countDigo ==
                                                  "00" ||
                                              providerDigo2
                                                  .modelDigo2
                                                  .data[
                                              index]
                                                  .countDigo ==
                                                  "000" ||
                                              providerDigo2
                                                  .modelDigo2
                                                  .data[
                                              index]
                                                  .countDigo ==
                                                  "0000"
                                              ? getRegionSheet(
                                              context: context,
                                              providerDigo:
                                              providerDigo2,
                                              index: 4,
                                              intIndexLists:
                                              index)
                                              : providerDigo2
                                              .addBosh(),
                                          animateToLast(),
                                        }
                                            : {
                                          ScaffoldMessenger.of(
                                              context)
                                              .showSnackBar(
                                               SnackBar(
                                                content: Text(
                                                    "fillAll".tr(),
                                                    style:const TextStyle(
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
                          onPressed: showAllOrder,
                          icon: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.teal,
                          ))
                    ],
                  )),
            ),
          ],
        ),
      );
    }else if(providerDigo2.sentServer == "0"){
      return const Center(child: CupertinoActivityIndicator(),);
    }else if(providerDigo2.sentServer == "2"){
      return  const Center(
        child: Icon(
          Icons.check_circle_outline,
          size: 90,
          color: Colors.teal,
        ),
      );
    }else if(providerDigo2.sentServer == "3"){
      return Center(
        child: Container(
          margin:const EdgeInsets.fromLTRB(30, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

             const SizedBox(height: 20),
              Text("successOrder".tr(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
             const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "province".tr(),
                        style:const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(providerDigo2.regName.toString(),
                        style:const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start),
                  )
                ],
              ),
             const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "idNumber".tr(),
                        style:const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                        providerDigo2.modelGetNatija.data[0].id.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start),
                  )
                ],
              ),
             const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "countAllBooks".tr(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(providerDigo2.allCount().toString() +"countDigo".tr(),
                        style:const TextStyle(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start),
                  )
                ],
              ),
             const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "allCost".tr(),
                        style:const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(providerDigo2.allCost(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start),
                  )
                ],
              ),
             const SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  Clipboard.setData(ClipboardData(
                    text: providerDigo2.modelGetNatija.data[0].invoice.toString(),
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text("${"copy".tr()} ${providerDigo2.modelGetNatija.data[0].invoice}",
                      )));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          "invoice".tr(),
                          style:const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                          providerDigo2.modelGetNatija.data[0].invoice.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start),
                    ),
                  const  Icon(Icons.copy)
                  ],
                ),
              ),
             const SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Clipboard.setData(ClipboardData(
                    text:providerDigo2.modelGetNatija.data[0].invoice.toString(),
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text("${"copy".tr()} ${providerDigo2.modelGetNatija.data[0].invoice.toString()}",
                      )));
                },
                child: QrImageView(
                  data:providerDigo2.modelGetNatija.data[0].invoice.toString(),
                  version: QrVersions.auto,
                  size: 100.0,
                ),
              ),
              const SizedBox(height: 20),
             const SizedBox(height: 20),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text("goBack2".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              )
            ],
          ),
        ),
      );
    }else{
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(providerDigo2.sentServer,
                textAlign: TextAlign.center, maxLines: 4),
            const SizedBox(height: 10),
            const Text("Xatolik"),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                providerDigo2.getDefault();
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
                providerDigo2.sentServer == "1"?
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 5),
                  child: GestureDetector(
                    onTap: () {
                      showAll();
                    },
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
                        "access".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade700),
                      ),
                    ),
                  ),
                ):const SizedBox.shrink()
              ],
            ),
            body: bodyBuild()
          ),
        ),
      ),
    );
  }

  showAllOrder(){
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(
                  20, 15, 30, 10),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "${'countAllBooks'.tr()} ",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight:
                          FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                            text: "${providerDigo2.jamSon}${"countDigo".tr()}",
                            style: const TextStyle(
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 16)),
                        const TextSpan(text: ''),
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
              child:  Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "myOrders".tr(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight:
                            FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "booksCount".tr(),
                    style:const TextStyle(
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
                          .countDigo.isNotEmpty ||
                          providerDigo2
                              .modelDigo2
                              .data[index]
                              .countDigo !=
                              "0" ||
                          providerDigo2
                              .modelDigo2
                              .data[index]
                              .countDigo !=
                              "00" ||
                          providerDigo2
                              .modelDigo2
                              .data[index]
                              .countDigo !=
                              "000" ||
                          providerDigo2
                              .modelDigo2
                              .data[index]
                              .countDigo !=
                              "0000"
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
                              "${providerDigo2.modelDigo2.data[index].countDigo}",
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
      return const SizedBox.shrink();
    }
  }

  showAll() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Text("myOrders".tr(),
            style:const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Divider(),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "myOrders".tr(),
                        style:const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "booksCount".tr(),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                  child: ListView.builder(
                itemCount: providerDigo2.modelDigo2.data.length,
                itemBuilder: (context, index) => providerDigo2
                        .modelDigo2.data[index].countDigo.isNotEmpty
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          providerDigo2.modelDigo2.data[index].countDigo
                                      .isNotEmpty ||
                                  providerDigo2
                                          .modelDigo2.data[index].countDigo !=
                                      "0" ||
                                  providerDigo2
                                          .modelDigo2.data[index].countDigo !=
                                      "00" ||
                                  providerDigo2
                                          .modelDigo2.data[index].countDigo !=
                                      "000" ||
                                  providerDigo2
                                          .modelDigo2.data[index].countDigo !=
                                      "0000"
                              ? Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: ListTile(
                                    minLeadingWidth: 1,
                                    leading: Text((index + 1).toString()),
                                    title: Text(providerDigo2
                                            .modelDigo2.data[index].nameFan1 +
                                        "\n" +
                                        providerDigo2
                                            .modelDigo2.data[index].nameFan2),
                                    subtitle: Text(providerDigo2
                                        .modelDigo2.data[index].langName),
                                    trailing: Text(
                                        "${providerDigo2.modelDigo2.data[index].countDigo}"),
                                  ))
                              : const SizedBox.shrink(),
                          providerDigo2
                                  .modelDigo2.data[index].countDigo.isNotEmpty
                              ? const Divider()
                              : const SizedBox.shrink(),
                        ],
                      )
                    : const SizedBox.shrink(),
              )),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 5, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(providerDigo2.modelDigo2.data[0].nameReg,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.teal)),
                    RichText(
                      text: TextSpan(
                        text: "${'myOrders'.tr()} ",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                          TextSpan(
                              text: providerDigo2.allCount().toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                           TextSpan(text: 'countDigo'.tr()),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'booksCount'.tr(),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: providerDigo2.jamSon.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                           TextSpan(text: 'countDigo'.tr()),
                        ],
                      ),
                    ),
                    // Text("Jami soni: "+providerDigo2.jamSon.toString() +" ta",
                    //     style: const TextStyle(
                    //         fontWeight: FontWeight.w600)),
                    Text(providerDigo2.allCost(),
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:  Text(
                "goBack2".tr(),
                style:
                const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
              )),
          TextButton(
              onPressed: () {
                try{
                 providerDigo2.sendServer2();
                  if(providerDigo2.sentServer == "2"){
                    Navigator.of(context).pop();
                  }
                  // log(jsonEncode(map).toString());
                }catch(e){
                  log(e.toString());
                }
              },
              child:  Text(
                "access".tr(),
                style:
                const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
              )),
        ],
      ),
    );
  }
}
