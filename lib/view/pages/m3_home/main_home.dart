// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/sign_up.dart';
import 'package:mydtm/view/pages/m3_home/carousel.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/serch_main.dart';
import 'package:mydtm/view/pages/m3_home/show_by_category/show_by_category.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:showcaseview/showcaseview.dart';

class MainHome extends StatefulWidget {
  String homePageId;

  MainHome({Key? key, required this.homePageId}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  ProviderMainHome providerMainHome = ProviderMainHome();
  final GlobalKey firstMainHome = GlobalKey();

  @override
  void initState() {
    getServiceList();
    super.initState();
  }

  var box = Hive.box("online");

  Future getServiceList() async {
    Future.delayed(Duration.zero);
    log(widget.homePageId);
    //
    if (widget.homePageId == "1") {
      await providerMainHome.setLangUser();
    }
    await providerMainHome.getDateService(context: context);
    await providerMainHome.checkVersion(context: context);
    if (box.get("token").toString().length > 30) {
      if (box.get("showCaseMainHome").toString() != "1") {

        Future.delayed(const Duration(milliseconds: 400)).then(
          (value) {
           setState(() {

           });
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ShowCaseWidget.of(context).startShowCase([firstMainHome]);
            });
          },
        );

        box.put("showCaseMainHome", "1");
      }
    } else {
      if (box.get("welcomeMainHome").toString() == "1") {
        await getMessage();
        box.put("welcomeMainHome", "1");
      } else {
        await getMessage2();
      }
    }
  }

  // final GlobalKey _secondMainHome = GlobalKey();

  Future getMessage() async {
    try {
      if (box.get("token").toString().length < 30) {
        Future.delayed(const Duration(seconds: 1)).then(
          (value) {
            AwesomeDialog(
                context: context,
                dialogType: DialogType.noHeader,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          // style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: "welcome".tr(),
                                style: const TextStyle(
                                    fontFamily: "Inter-Medium",
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const Divider(),

                      const SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: "",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter-Medium",
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: "fillSigInOrSigUp".tr(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Inter-Medium",
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(
                              text: "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Inter-Medium",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                        color: MyColors.appColorBBA(),
                        height: 40,
                        minWidth: double.infinity,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () {
                          pushNewScreen(
                            context,
                            screen: EnterFirst(windowIdEnterFirst: "1"),
                            withNavBar: false,
                            // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text("enterLogPassword".tr(),
                            style: const TextStyle(
                              fontFamily: "Inter-Medium",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "or".tr(),
                        style:  TextStyle(
                            color: MyColors.appColorBBA(),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter-Medium"),
                      ),
                      const SizedBox(height: 10),
                      MaterialButton(
                        color: Colors.white,
                        height: 40,
                        minWidth: double.infinity,
                        textColor:MyColors.appColorBBA(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side:  BorderSide(
                                color: MyColors.appColorBBA(), width: 1)),
                        onPressed: () {
                          // Navigator.of(context).push(CupertinoPageRoute(
                          //   builder: (context) =>  SignUps(),
                          // ));
                          pushNewScreen(
                            context,
                            screen: SignUp(),
                            withNavBar: false,
                            // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text("enterRegistration".tr(),
                            style: const TextStyle(
                              fontFamily: "Inter-Medium",
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                )).show();
          },
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future getMessage2() async {
    try {

      AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          // title: "iTest",
          // titleTextStyle: TextStyle(color: Colors.black),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                 Text(
                  "BBA",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter-Medium",
                      color: MyColors.appColorBBA(),
                      fontSize: 16),
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: "fillSigInOrSigUp".tr(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Inter-Medium",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  color: MyColors.appColorBBA(),
                  height: 40,
                  minWidth: double.infinity,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: EnterFirst(windowIdEnterFirst: "1"),
                      withNavBar: false,
                      // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Text(
                    "enterLogPassword".tr(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter-Medium"),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "or".tr(),
                  style:  TextStyle(
                      color: MyColors.appColorBBA(),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter-Medium"),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  color: Colors.white,
                  height: 40,
                  minWidth: double.infinity,
                  textColor: MyColors.appColorBackC4(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: MyColors.appColorBBA(), width: 1)),
                  onPressed: () {
                    // Navigator.of(context).push(CupertinoPageRoute(
                    //   builder: (context) =>  SignUps(),
                    // ));
                    pushNewScreen(
                      context,
                      screen: SignUp(),
                      withNavBar: false,
                      // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Text(
                    "enterRegistration".tr(),
                    style:  TextStyle(
                        color: MyColors.appColorBBA(),
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter-Medium"),
                  ),
                )
              ],
            ),
          )).show();
    } catch (e) {
      log(e.toString());
    }
  }

  Future gerRefresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerMainHome,
      child: Consumer<ProviderMainHome>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          // appBar:   searchMain(context: context, providerMainHome: providerMainHome),
          body: SafeArea(
            child: RefreshIndicator(
                onRefresh: gerRefresh,
                child: providerMainHome.boolParseData
                    ? !providerMainHome.boolErrorHandle
                        ? NestedScrollView(
                            floatHeaderSlivers: true,
                            headerSliverBuilder: (BuildContext context,
                                bool innerBoxIsScrolled) {
                              return <Widget>[
                                SliverAppBar(
                                  backgroundColor: MyColors.appColorWhite(),
                                  floating: false,
                                  elevation: 0,
                                  expandedHeight: 10,
                                  flexibleSpace: searchMain(
                                      context: context,
                                      providerMainHome: providerMainHome),
                                  foregroundColor: MyColors.appColorWhite(),
                                  excludeHeaderSemantics: true,
                                ),
                                SliverToBoxAdapter(
                                  child: carouselMain(
                                      context: context,
                                      providerMainHome: providerMainHome),
                                )
                              ];
                            },
                            body: Container(
                                margin: const EdgeInsets.fromLTRB(10, 2, 10, 8),
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: providerMainHome
                                      .listDataServiceList.length,
                                  itemBuilder:
                                      (context, index) =>
                                          providerMainHome
                                                  .listDataServiceList[index]
                                                  .service
                                                  .isNotEmpty
                                              ? SizedBox(
                                                  height: 180,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                          height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.6,
                                                            child: Text(
                                                              box.get("language") ==
                                                                      "1"
                                                                  ? providerMainHome
                                                                      .listDataServiceList[
                                                                          index]
                                                                      .categoryName
                                                                  : box.get("language") ==
                                                                          "2"
                                                                      ? providerMainHome
                                                                          .listDataServiceList[
                                                                              index]
                                                                          .categoryNameQQ
                                                                      : providerMainHome
                                                                          .listDataServiceList[
                                                                              index]
                                                                          .categoryNameRu,
                                                              style: TextStyle(
                                                                  color: MyColors
                                                                      .appColorBlack(),
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontFamily:
                                                                      'Roboto-Medium'),
                                                              maxLines: 3,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              softWrap: true,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (providerMainHome
                                                                  .listDataServiceList[
                                                                      index]
                                                                  .service
                                                                  .isNotEmpty) {
                                                                myViewButton(
                                                                    context:
                                                                        context,
                                                                    providerMainHome:
                                                                        providerMainHome,
                                                                    myList: providerMainHome
                                                                        .listDataServiceList[
                                                                            index]
                                                                        .service);
                                                              }
                                                            },
                                                            child: MyWidgets
                                                                .robotoFontText(
                                                                    text: "all"
                                                                        .tr(),
                                                                    textColor:
                                                                        MyColors
                                                                            .appColorBlue1(),
                                                                    textSize:
                                                                        15),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Expanded(
                                                        child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              providerMainHome
                                                                  .listDataServiceList[
                                                                      index]
                                                                  .service
                                                                  .length,
                                                          itemBuilder: (context,
                                                                  index2) =>
                                                              GestureDetector(
                                                            onTap: () {
                                                              /// go service page
                                                              providerMainHome
                                                                  .goServicePage(
                                                                context:
                                                                    context,
                                                                serviceMainList:
                                                                    providerMainHome
                                                                        .listDataServiceList[
                                                                            index]
                                                                        .service[index2],
                                                              );

                                                            },
                                                            child:
                                                            // index == 0
                                                            //     ? Showcase(
                                                            //         key:
                                                            //             firstMainHome,
                                                            //         description:
                                                            //             "regEducation".tr(),
                                                            //         child:
                                                            //             Container(
                                                            //           height:
                                                            //               155,
                                                            //           width:
                                                            //               125,
                                                            //           padding:
                                                            //               const EdgeInsets.all(
                                                            //                   10),
                                                            //           margin:
                                                            //               const EdgeInsets.all(
                                                            //                   5),
                                                            //           decoration: BoxDecoration(
                                                            //               color: MyColors
                                                            //                   .appColorWhite(),
                                                            //               boxShadow: [
                                                            //                 BoxShadow(
                                                            //                     color: MyColors.appColorGrey400(),
                                                            //                     spreadRadius: 1,
                                                            //                     blurRadius: 1)
                                                            //               ],
                                                            //               borderRadius:
                                                            //                   BorderRadius.circular(10)),
                                                            //           child:
                                                            //               Column(
                                                            //             mainAxisAlignment:
                                                            //                 MainAxisAlignment.spaceBetween,
                                                            //             crossAxisAlignment:
                                                            //                 CrossAxisAlignment.center,
                                                            //             children: [
                                                            //               const SizedBox(
                                                            //                   height: 1),
                                                            //               CachedNetworkImage(
                                                            //                   height: 40,
                                                            //                   width: 40,
                                                            //                   filterQuality: FilterQuality.high,
                                                            //                   fit: BoxFit.fill,
                                                            //                   imageUrl: "${providerMainHome.listDataServiceList[index].service[index2].mobilIcon}",
                                                            //                   progressIndicatorBuilder: (context, url, downloadProgress) => const CupertinoActivityIndicator(),
                                                            //                   errorWidget: (context, url, error) =>
                                                            //                       // Text(url.toString())
                                                            //                       Image.asset(
                                                            //                         "assets/images/uzbmb.png",
                                                            //                       )
                                                            //                   //
                                                            //                   //     fit: BoxFit.fill),
                                                            //                   ),
                                                            //               Text(
                                                            //                 box.get("language") == "1"
                                                            //                     ? providerMainHome.listDataServiceList[index].service[index2].serviceName
                                                            //                     : box.get("language") == "2"
                                                            //                         ? providerMainHome.listDataServiceList[index].service[index2].serviceNameQQ
                                                            //                         : providerMainHome.listDataServiceList[index].service[index2].serviceNameRu,
                                                            //
                                                            //                 textAlign:
                                                            //                     TextAlign.center,
                                                            //                 overflow:
                                                            //                     TextOverflow.ellipsis,
                                                            //                 maxLines:
                                                            //                     3,
                                                            //                 // softWrap: true,
                                                            //                 style:
                                                            //                     const TextStyle(fontFamily: 'Roboto-Medium'),
                                                            //               ),
                                                            //             ],
                                                            //           ),
                                                            //         ),
                                                            //       )
                                                            //     :
                                                            Container(
                                                                    height: 155,
                                                                    width: 125,
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    margin: const EdgeInsets
                                                                        .all(5),
                                                                    decoration: BoxDecoration(
                                                                        color: MyColors
                                                                            .appColorWhite(),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              color: MyColors.appColorGrey400(),
                                                                              spreadRadius: 1,
                                                                              blurRadius: 1)
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        const SizedBox(
                                                                            height:
                                                                                1),
                                                                        CachedNetworkImage(
                                                                            height:
                                                                                40,
                                                                            width:
                                                                                40,
                                                                            filterQuality: FilterQuality
                                                                                .high,
                                                                            fit: BoxFit
                                                                                .fill,
                                                                            imageUrl:
                                                                                "${providerMainHome.listDataServiceList[index].service[index2].mobilIcon}",
                                                                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                                                const CupertinoActivityIndicator(),
                                                                            errorWidget: (context, url, error) =>
                                                                                // Text(url.toString())
                                                                                Image.asset(
                                                                                  "assets/images/uzbmb.png",
                                                                                )
                                                                            //
                                                                            //     fit: BoxFit.fill),
                                                                            ),
                                                                        Text(
                                                                          box.get("language") == "1"
                                                                              ? providerMainHome.listDataServiceList[index].service[index2].serviceName
                                                                              : box.get("language") == "2"
                                                                                  ? providerMainHome.listDataServiceList[index].service[index2].serviceNameQQ
                                                                                  : providerMainHome.listDataServiceList[index].service[index2].serviceNameRu,

                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              3,
                                                                          // softWrap: true,
                                                                          style:
                                                                              const TextStyle(fontFamily: 'Roboto-Medium'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ))
                                              : const SizedBox.shrink(),
                                )),
                          )
                        : const Center(
                            child: SizedBox.shrink(),
                          )
                    : const Center(child: CupertinoActivityIndicator())
                // bodyMainHome(context: context, providerMainHome: providerMainHome),
                ),
          ),
        ),
      ),
    );
  }
}
