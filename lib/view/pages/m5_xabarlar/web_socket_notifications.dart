import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/data/model_parse/m5_model/model_notifications_all.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketNotifications extends StatefulWidget {
  const WebSocketNotifications({super.key});

  @override
  State<WebSocketNotifications> createState() => _WebSocketNotificationsState();
}

class _WebSocketNotificationsState extends State<WebSocketNotifications> {
  late WebSocketChannel channel;

  dynamic listData = "";

  int channelReady = 0;
  List<ModelNotificationAll> listNotificationAll = [];
  var box = Hive.box("online");

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    try {
      channel =
          WebSocketChannel.connect(Uri.parse("wss://uzbmb.uz/websockets"));
      await channel.ready;
      channel.sink.add(
          "{\"action\": \"get\", \"data\":\"${box.get("imie").toString()}\"}");
      print(
          "{\"action\": \"get\", \"data\":\"${box.get("imie").toString()}\"}");
      // channel.stream.listen(
      //   (message) {
      //
      //       channel.sink.add(
      //           "{\"action\": \"get\", \"data\":\"${box.get("imie").toString()}\"}");
      //       listData = message;
      //
      //     }
      // );

      // log("listData.toString()");
      // log(listData.toString());
      // listNotificationAll = (jsonDecode(listData) as List)
      //     .map((e) => ModelNotificationAll.fromJson(e))
      //     .toList();
      // channelReady = 1;
    } catch (e) {
      log("### catch2");
      log(box.get("imie").toString());
      log(e.toString());
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: box.get("imie").toString().length > 5 ||
                  box.get("imie").toString() != "null"
              ? StreamBuilder(
                  stream: channel.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var data = snapshot.data;
                    List<ModelNotificationAll> listNotificationAll =
                        (jsonDecode(data) as List)
                            .map((e) => ModelNotificationAll.fromJson(e))
                            .toList();
                    return Center(
                        child: ListView.builder(
                            itemCount: listNotificationAll.length,
                            itemBuilder: (context, index) =>
                                listNotificationAll[index].title.toString() !=
                                        "null"
                                    ? Container(
                                        margin: const EdgeInsets.only(
                                            right: 4,
                                            left: 5,
                                            bottom: 8,
                                            top: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: MyColors.appColorWhite(),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.teal
                                                      .withOpacity(0.3),
                                                  spreadRadius: 1,
                                                  blurRadius: 0.5)
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 8, bottom: 7),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/logobba.png",
                                                    height: 30,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10,
                                                            top: 5,
                                                            bottom: 5),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      child: Text(
                                                          listNotificationAll[
                                                                      index]
                                                                  .title ??
                                                              "".toString(),
                                                          maxLines: 1,
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.95,
                                              child: ExpansionTile(
                                                  shape: Border.all(
                                                      color:
                                                          Colors.transparent),
                                                  title: Text(
                                                    listNotificationAll[index]
                                                            .title ??
                                                        "".toString(),
                                                    maxLines: 1,
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          listNotificationAll[
                                                                  index]
                                                              .summary
                                                              .toString()),
                                                    ),
                                                  ]),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10,
                                                          left: 10,
                                                          bottom: 5),
                                                  child: Text(
                                                    listNotificationAll[index]
                                                        .sendDate
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Padding(
                                            //   padding:
                                            //   const EdgeInsets.fromLTRB(
                                            //       8, 8, 8, 10),
                                            //   child: Row(
                                            //     crossAxisAlignment:
                                            //     CrossAxisAlignment.center,
                                            //     mainAxisAlignment:
                                            //     MainAxisAlignment
                                            //         .spaceBetween,
                                            //     children: [
                                            //       const Icon(
                                            //         Icons.keyboard_arrow_down,
                                            //       ),
                                            //       Row(
                                            //         children: [
                                            //           Icon(
                                            //             Icons.remove_red_eye,
                                            //             size: 22,
                                            //             color: Colors.teal
                                            //                 .withOpacity(0.7),
                                            //           ),
                                            //           const SizedBox(
                                            //               width: 5),
                                            //           Text(providerDtmNews
                                            //               .modelDtmNews3Temp[
                                            //           index]
                                            //               .views
                                            //               .toString()),
                                            //         ],
                                            //       )
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ))
                                    :  Center(
                                  child: Text("noInfoFound".tr()),
                                ))
                        //   :Center(
                        // child: Text("noInfoFound".tr()),
                        // ),
                        );
                  },
                )
              : Center(
                  child: Text("noInfoFound".tr()),
                )),
    );
  }
}
