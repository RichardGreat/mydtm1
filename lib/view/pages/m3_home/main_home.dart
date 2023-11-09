// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m6_profile/get_imie.dart';
import 'package:mydtm/data/model_parse/m6_model/get_imie_info.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/sign_up.dart';
import 'package:mydtm/view/pages/m3_home/carousel.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/show_by_category/show_by_category.dart';
import 'package:mydtm/view/pages/m3_home/webview_window/webv_window.dart';
import 'package:mydtm/view/pages/m5_xabarlar/main_messages.dart';
import 'package:mydtm/view/pages/m6_profile/main_profile.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class MainHome extends StatefulWidget {
  String homePageId;

  MainHome({Key? key, required this.homePageId}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  ProviderMainHome providerMainHome = ProviderMainHome();

  @override
  initState() {
    Future.delayed(Duration.zero);
    getServiceList();
    controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    animation = Tween<double>(begin: 0, end: 600).animate(controller)
      ..addListener(() {
        // setState(() {
        // // The state that has changed here is the animation object's value.
        // });
      });
    controller.forward();
    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  var box = Hive.box("online");

  bool boolGetProfileData = false;
  late ModelGetImieInfo modelGetImieInfo;
  late DataGetImieInfo dataGetImieInfo;
  NetworkGetIMie networkGetIMie = NetworkGetIMie();
  late String psser,
      psnum,
      imie,
      lname,
      fname,
      mname,
      bdate,
      sex,
      nationId,
      image;

  Future getProfile() async {
    try {
      boolGetProfileData = false;
      if (box.get("boxAllPersonInfo").toString().length > 200) {
        modelGetImieInfo = ModelGetImieInfo.fromJson(
            jsonDecode(box.get("boxAllPersonInfo").toString()));
      } else {
        String dataInfo = await networkGetIMie.getIMieInformation();
        box.delete("boxAllPersonInfo");
        box.put("boxAllPersonInfo", dataInfo);
        modelGetImieInfo = ModelGetImieInfo.fromJson(jsonDecode(dataInfo));
      }

      dataGetImieInfo = modelGetImieInfo.data;
      psser = dataGetImieInfo.psser;
      psnum = dataGetImieInfo.psnum.toString();
      imie = dataGetImieInfo.imie.toString();
      lname = dataGetImieInfo.lname;
      fname = dataGetImieInfo.fname;
      mname = dataGetImieInfo.mname;
      bdate = dataGetImieInfo.bdate.toString();
      sex = dataGetImieInfo.sex.toString();
      nationId = dataGetImieInfo.nationId.toString();
      image = dataGetImieInfo.image;
      box.delete("imie");
      box.delete("psnum");
      box.delete("personImage");
      box.delete("fio");
      box.put("fio", "$lname $fname $mname");
      box.put("imie", imie);
      box.put("psnum", psnum);
      box.put("personImage", image);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getServiceList() async {
    getProfile();
    if (widget.homePageId == "1") {
      await providerMainHome.setLangUser();
    }
    await providerMainHome.getDateService(context: context);
    await providerMainHome.checkVersion(context: context);
    if (box.get("token").toString().length > 30) {
    } else {
      await getMessage();
    }
  }

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
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    EnterFirst(windowIdEnterFirst: "1"),
                              ));
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
                        style: TextStyle(
                            color: MyColors.appColorBBA(),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter-Medium"),
                      ),
                      const SizedBox(height: 10),
                      MaterialButton(
                        color: Colors.white,
                        height: 40,
                        minWidth: double.infinity,
                        textColor: MyColors.appColorBBA(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                color: MyColors.appColorBBA(), width: 1)),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => SignUp(),
                          ));
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
      // log(e.toString());
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
          builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.teal,
                    Colors.teal.withOpacity(0.4),
                    Colors.teal.withOpacity(0.06),
                    Colors.teal.withOpacity(0.05),
                    Colors.teal.withOpacity(0.001),
                  ])),
              child: providerMainHome.boolParseData
                  ? !providerMainHome.boolErrorHandle
                      ? Scaffold(
                          extendBodyBehindAppBar: true,
                          backgroundColor: Colors.transparent,
                          appBar: AppBar(
                            elevation: 0,
                            backgroundColor: Color.lerp(
                                Colors.teal, Colors.teal.withOpacity(0.01), 1),

                            systemOverlayStyle: SystemUiOverlayStyle.light,
                            // status bar brightness
                            // title: Text("bba".tr()),
                            actions: [
                              GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => MainMessages(),
                                      ));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 14, 0),
                                  child: Icon(
                                    CupertinoIcons.bell_fill,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                            // backgroundColor: Colors.transparent,
                            flexibleSpace: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.teal,
                                      Colors.teal.withOpacity(0.1),
                                      Colors.teal.withOpacity(0.04),
                                    ]),
                              ),
                            ),
                          ),
                          body: AnimatedBuilder(
                              animation: controller,
                              builder: (context, child) {
                                return SlideTransition(
                                    position: Tween<Offset>(
                                      begin:  Offset(box.get("animationWindowValue")??1, 0),
                                      end: const Offset(0, 0),
                                    ).animate(controller),
                                    child: SafeArea(
                                      child: RefreshIndicator(
                                          onRefresh: gerRefresh,
                                          child: providerMainHome.boolParseData
                                              ? !providerMainHome
                                                      .boolErrorHandle
                                                  ? NestedScrollView(
                                                      floatHeaderSlivers: true,
                                                      headerSliverBuilder:
                                                          (BuildContext context,
                                                              bool
                                                                  innerBoxIsScrolled) {
                                                        return <Widget>[
                                                          // SliverAppBar(
                                                          //   automaticallyImplyLeading: false,
                                                          //    backgroundColor: MyColors.appColorBBA(),//const Color.fromRGBO(48, 192, 192, 0.01),
                                                          //   floating: false,
                                                          //   elevation: 0,
                                                          //   expandedHeight: 10,
                                                          //   flexibleSpace: searchMain(
                                                          //       context: context,
                                                          //       providerMainHome: providerMainHome),
                                                          //   foregroundColor:
                                                          //       const Color.fromRGBO(48, 192, 192, 0.04),
                                                          //   excludeHeaderSemantics: true,
                                                          //
                                                          // ),
                                                          SliverToBoxAdapter(
                                                            child: carouselMain(
                                                                context:
                                                                    context,
                                                                providerMainHome:
                                                                    providerMainHome,
                                                                service: providerMainHome
                                                                    .listDataServiceList[
                                                                        0]
                                                                    .service),
                                                          )
                                                        ];
                                                      },
                                                      body: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  10, 2, 10, 8),
                                                          child:
                                                              ListView.builder(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                providerMainHome
                                                                    .listDataServiceList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                    index) =>
                                                                providerMainHome
                                                                        .listDataServiceList[
                                                                            index]
                                                                        .service
                                                                        .isNotEmpty
                                                                    ? SizedBox(
                                                                        height:
                                                                            220,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            const SizedBox(height: 10),
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width,
                                                                              height: 1.5,
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                    gradient: LinearGradient(colors: [
                                                                                  Colors.teal.shade100,
                                                                                  // Colors.grey,
                                                                                  Colors.teal.shade100,
                                                                                  Colors.teal.shade100,
                                                                                  Colors.white,
                                                                                ])),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(height: 15),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  box.get("language") == "1"
                                                                                      ? providerMainHome.listDataServiceList[index].categoryName
                                                                                      : box.get("language") == "2"
                                                                                          ? providerMainHome.listDataServiceList[index].categoryNameQQ
                                                                                          : providerMainHome.listDataServiceList[index].categoryNameRu,
                                                                                  style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'Roboto-Medium'),
                                                                                  maxLines: 3,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  softWrap: true,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                GestureDetector(
                                                                                  onTap: () async {
                                                                                    if (providerMainHome.listDataServiceList[index].service.isNotEmpty) {
                                                                                      myViewButton(serviceName: providerMainHome.listDataServiceList[index].categoryName, context: context, providerMainHome: providerMainHome, myList: providerMainHome.listDataServiceList[index].service);
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    padding: const EdgeInsets.only(right: 8, left: 8, bottom: 5, top: 5),
                                                                                    margin: const EdgeInsets.only(right: 10),
                                                                                    decoration: BoxDecoration(
                                                                                        color: MyColors.appColorBBA(),
                                                                                        // Colors.blue
                                                                                        //     .withOpacity(
                                                                                        //         0.6),
                                                                                        borderRadius: BorderRadius.circular(5)),
                                                                                    child: MyWidgets.robotoFontText(text: "all".tr(), textColor: Colors.white, textSize: 15),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            const SizedBox(height: 10),
                                                                            Expanded(
                                                                              child: ListView.builder(
                                                                                scrollDirection: Axis.horizontal,
                                                                                itemCount: providerMainHome.listDataServiceList[index].service.length,
                                                                                itemBuilder: (context, index2) {
                                                                                  return GestureDetector(
                                                                                    onTap: () async {
                                                                                      /// go service page

                                                                                      if (providerMainHome.listDataServiceList[index].service[index2].id.toString() == "100000") {
                                                                                        Navigator.push(
                                                                                            context,
                                                                                            CupertinoPageRoute(
                                                                                              builder: (context) => WebViewWindow(
                                                                                                modelServiceMainList: providerMainHome.listDataServiceList[index].service[index2],
                                                                                              ),
                                                                                            ));

                                                                                        // final Uri _url =
                                                                                        //     Uri.parse(
                                                                                        //         "https://mandat.uzbmb.uz/");
                                                                                        // await launchUrl(
                                                                                        //   _url,
                                                                                        //   mode: LaunchMode
                                                                                        //       .inAppWebView,
                                                                                        // );
                                                                                      } else if (providerMainHome.listDataServiceList[index].service[index2].id.toString().length > 5) {
                                                                                        Navigator.push(
                                                                                            context,
                                                                                            CupertinoPageRoute(
                                                                                              builder: (context) => WebViewWindow(
                                                                                                modelServiceMainList: providerMainHome.listDataServiceList[index].service[index2],
                                                                                              ),
                                                                                            ));
                                                                                      } else {
                                                                                        providerMainHome.goServicePage(
                                                                                          context: context,
                                                                                          serviceMainList: providerMainHome.listDataServiceList[index].service[index2],
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                    child: Container(
                                                                                      height: 200,
                                                                                      width: 180,
                                                                                      padding: const EdgeInsets.all(10),
                                                                                      margin: const EdgeInsets.all(5),
                                                                                      decoration: BoxDecoration(
                                                                                          color: index % 2 == 0
                                                                                              ? index2 % 2 == 0
                                                                                                  ? const Color.fromRGBO(252, 246, 225, 1)
                                                                                                  : const Color.fromRGBO(232, 247, 244, 1)
                                                                                              : index2 % 2 != 0
                                                                                                  ? const Color.fromRGBO(252, 246, 225, 1)
                                                                                                  : const Color.fromRGBO(232, 247, 244, 1),
                                                                                          borderRadius: BorderRadius.circular(10)),
                                                                                      child: Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          const SizedBox(height: 1),
                                                                                          Icon(providerMainHome.listDataServiceList[index].service[index2].icon, size: 50, color: MyColors.appColorBBA()),

                                                                                          /// image
                                                                                          // CachedNetworkImage(
                                                                                          //     height:
                                                                                          //         60,
                                                                                          //     width:
                                                                                          //         60,
                                                                                          //     filterQuality: FilterQuality
                                                                                          //         .high,
                                                                                          //     fit: BoxFit
                                                                                          //         .fill,
                                                                                          //     imageUrl:
                                                                                          //         "${providerMainHome.listDataServiceList[index].service[index2].mobilIcon}",
                                                                                          //     progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                                                          //         const CupertinoActivityIndicator(),
                                                                                          //     errorWidget: (context, url, error) =>
                                                                                          //         // Text(url.toString())
                                                                                          //         Image.asset(
                                                                                          //           "assets/images/uzbmb.png",
                                                                                          //         )
                                                                                          //     //
                                                                                          //     //     fit: BoxFit.fill),
                                                                                          //     ),
                                                                                          Text(
                                                                                            box.get("language") == "1"
                                                                                                ? providerMainHome.listDataServiceList[index].service[index2].serviceName
                                                                                                : box.get("language") == "2"
                                                                                                    ? providerMainHome.listDataServiceList[index].service[index2].serviceNameQQ
                                                                                                    : providerMainHome.listDataServiceList[index].service[index2].serviceNameRu,

                                                                                            textAlign: TextAlign.center,
                                                                                            overflow: TextOverflow.ellipsis,
                                                                                            maxLines: 2,
                                                                                            // softWrap: true,
                                                                                            style: const TextStyle(fontFamily: 'Roboto-Medium'),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ))
                                                                    : const SizedBox
                                                                        .shrink(),
                                                          )),
                                                    )
                                                  : const Center(
                                                      child: SizedBox.shrink(),
                                                    )
                                              : const Center(
                                                  child:
                                                      CupertinoActivityIndicator())),
                                    ));
                              }),
                          drawer: Drawer(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: MainProfile(myFunction: gerRefresh),
                          ),
                        )
                      : Scaffold(
                          body: AnimatedBuilder(
                              animation: controller,
                              builder: (context, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    // X, Y - Origin (0, 0) is in the upper left corner.
                                    begin: const Offset(1, 0),
                                    end: const Offset(0, 0),
                                  ).animate(controller),
                                  child: const Center(
                                      child: CupertinoActivityIndicator()),
                                  // PageAnimationTransition(child: PageTwo(), pageAnimationType: LeftToRightFadedTransition(), page: null);
                                );
                              }))
                  : const Scaffold(
                      body: Center(child: CupertinoActivityIndicator()))),
        ));
  }
}
