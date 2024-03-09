import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/notification/home_page.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/m5_xabarlar/one_page_news/one_news.dart';
import 'package:mydtm/view/pages/m5_xabarlar/provider_news.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class MainMessages extends StatefulWidget {
  int index;

  MainMessages({super.key, required this.index});

  @override
  State<MainMessages> createState() => _MainMessagesState();
}

class _MainMessagesState extends State<MainMessages> {
  ProviderDtmNews providerDtmNews = ProviderDtmNews();

  var box = Hive.box("online");
  var box2 = Hive.box("online2");

  @override
  initState() {
    getDtmNews();
    getData();
    box2.put("windowNews", 0);
    super.initState();
  }

  Future getDtmNews() async {
    await providerDtmNews.getAllDtmNews();

  }

  List<ModelSocketMessage> listModelSocket = [];

  bool getNewNotifications = true;

  getData() async {
    try {
      setState(() {
        getNewNotifications = false;
      });
      try{
        listModelSocket = (jsonDecode(box2.get("bildirishnoma")) as List)
            .map((e) => ModelSocketMessage.fromJson(e))
            .toList();

        listModelSocket.sort((a, b) {
          return b.sendDate.compareTo(a.sendDate);
        });
      }catch(e){setState(() {
        getNewNotifications = true;
      });}

      setState(() {
        getNewNotifications = true;
      });
    } catch (e) {
      log("eeee");
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => providerDtmNews,
        child: Consumer<ProviderDtmNews>(
          builder: (context, value, child) => DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  // backgroundColor: MyColors.appColorBBA(),
                  leading: GestureDetector(
                      onTap: (){
                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) =>  MainPages(homeIdMainpage: "0"),), (route) => false);
                      },
                      child: Icon(Platform.isIOS?Icons.arrow_back_ios:Icons.arrow_back)),
                  backgroundColor: Colors.transparent,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.teal,
                            Colors.teal,
                            Colors.teal.withOpacity(0.8),
                          ]),
                    ),
                  ),
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.white),
                  title: MyWidgets.robotoFontText(
                      text: "news".tr(),
                      textSize: 24,
                      textColor: Colors.white,
                      textFontWeight: FontWeight.w500),
                  bottom: TabBar(
                    indicatorColor: Colors.black,
                    indicatorWeight: 3,
                    tabs: [
                      Tab(
                        child: Text(
                            widget.index == 0 ? "last".tr() : "mostSee".tr(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Tab(
                        child: Text(
                            widget.index == 1 ? "last".tr() : "mostSee".tr(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                body: providerDtmNews.boolDtmNews
                    ? TabBarView(children: [
                        RefreshIndicator.adaptive(
                            onRefresh: () {
                              return getDtmNews();
                            },
                            child:
                            getNewNotifications?
                            bodyTab(widget.index == 0 ? 0 : 1):const  Center(child: CupertinoActivityIndicator(),)),
                        RefreshIndicator.adaptive(
                            onRefresh: () async {

                              await getData();
                            },
                            child:
                            getNewNotifications?
                            bodyTab(widget.index == 1 ? 0 : 1) :const  Center(child: CupertinoActivityIndicator(),)),
                      ])
                    : MyWidgets.loaderDownload(context: context)),
          ),
        ));
  }

  Widget bodyTab(int index) {
    if (index == 0) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: providerDtmNews.modelDtmNews2.length,
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(
                        right: 4, left: 5, bottom: 8, top: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MyColors.appColorWhite(),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.teal.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 0.5)
                        ]),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            barrierColor: Colors.black.withOpacity(0.2),
                            context: context,
                            enableDrag: true,
                            isScrollControlled: true,
                            builder: (_) {
                              return Container(
                                  margin: const EdgeInsets.all(10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: NewsSee(
                                      id: providerDtmNews
                                          .modelDtmNews2[index].id
                                          .toString(),
                                      date: providerDtmNews
                                          .modelDtmNews2[index].createdDate
                                          .toString(),
                                      titleName: providerDtmNews
                                          .modelDtmNews2[index].title
                                          .toString(),
                                      imgUrl: providerDtmNews
                                          .modelDtmNews2[index].imageUrl
                                          .toString(),
                                      providerDtmNews: providerDtmNews));
                            });
                        // pushNewScreen(context,
                        //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        //     screen:);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, top: 5, bottom: 5),
                                child: Text(
                                    providerDtmNews
                                        .modelDtmNews2[index].createdDate
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: CachedNetworkImage(
                              fadeOutCurve: Curves.easeInCirc,
                              width: MediaQuery.of(context).size.width * 0.9,
                              fit: BoxFit.fill,
                              imageUrl:
                                  providerDtmNews.modelDtmNews2[index].imageUrl,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 15),
                                  child: Text(
                                    providerDtmNews.modelDtmNews2[index].title
                                        .toString(),
                                    textAlign: TextAlign.justify,
                                    maxLines: 3,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye,
                                      size: 22,
                                      color: Colors.teal.withOpacity(0.7),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(providerDtmNews
                                        .modelDtmNews2[index].views
                                        .toString()),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
      );
    } else if (index == 1) {
      return SafeArea(
        child:
        getNewNotifications?
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          listModelSocket.isNotEmpty?
          ListView.builder(
              itemCount: listModelSocket.length,
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(
                        right: 4, left: 5, bottom: 8, top: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MyColors.appColorWhite(),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.teal.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 0.5)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, bottom: 5),
                              child: Text(
                                  listModelSocket[index].sendDate.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ExpansionTile(
                              shape: Border.all(color: Colors.transparent),
                              title: Text(
                                listModelSocket[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(listModelSocket[index].summary),
                                ),
                              ]),
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
                    ),
                  )):Center(child: Text("noInfoFound".tr()),),
        )
        :const Center(child: CupertinoActivityIndicator(),)
        ,
      );
    } else {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
  }
}
