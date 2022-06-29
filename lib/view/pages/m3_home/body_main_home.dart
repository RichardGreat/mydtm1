import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/view/pages/m3_home/carousel.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/serch_main.dart';
import 'package:mydtm/view/pages/m3_home/show_by_category/show_by_category.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:developer';

Widget bodyMainHome(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
  var box = Hive.box("online");
  return providerMainHome.boolParseData
      ? NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {


            return <Widget>[
              SliverAppBar(
                backgroundColor: MyColors.appColorWhite(),
                floating: false,
                elevation: 0,
                expandedHeight: 10,
                flexibleSpace: searchMain(
                    context: context, providerMainHome: providerMainHome),
                foregroundColor: MyColors.appColorWhite(),
                excludeHeaderSemantics: true,
              ),
              SliverToBoxAdapter(
                child: carouselMain(
                    context: context, providerMainHome: providerMainHome),
              )
            ];
          },
          body: Container(
              margin: const EdgeInsets.fromLTRB(10, 2, 10, 8),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: providerMainHome.listDataServiceList.length,
                itemBuilder: (context, index) => providerMainHome
                        .listDataServiceList[index].service.isNotEmpty
                    ? SizedBox(
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    box.get("language") == "1"
                                        ? providerMainHome
                                            .listDataServiceList[index]
                                            .categoryName
                                        : box.get("language") == "2"
                                            ? providerMainHome
                                                .listDataServiceList[index]
                                                .categoryNameQQ
                                            : providerMainHome
                                                .listDataServiceList[index]
                                                .categoryNameRu,
                                    style: TextStyle(
                                        color: MyColors.appColorBlack(),
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto-Medium'),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {



                                    if (providerMainHome
                                        .listDataServiceList[index]
                                        .service
                                        .isNotEmpty) {
                                      myViewButton(
                                          context: context,
                                          providerMainHome: providerMainHome,
                                          myList:



                                          providerMainHome
                                              .listDataServiceList[index]
                                              .service);
                                    }
                                  },
                                  child: MyWidgets.robotoFontText(
                                      text: "all".tr(),
                                      textColor: MyColors.appColorBlue1(),
                                      textSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: providerMainHome
                                    .listDataServiceList[index].service.length,
                                itemBuilder: (context, index2) =>
                                    GestureDetector(
                                  onTap: () {
                                    /// go service page
                                    providerMainHome.goServicePage(
                                      context: context,
                                      serviceMainList: providerMainHome
                                          .listDataServiceList[index]
                                          .service[index2],
                                    );
                                  },
                                  child: Container(
                                    height: 150,
                                    width: 120,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: MyColors.appColorWhite(),
                                        boxShadow: [
                                          BoxShadow(
                                              color: MyColors.appColorGrey400(),
                                              spreadRadius: 1,
                                              blurRadius: 1)
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 1),
                                        CachedNetworkImage(
                                          height: 30,
                                          width: 30,
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.fill,
                                          imageUrl:  "${MainUrl.mainUrlImage}/${providerMainHome.listDataServiceList[index].service[index2].mobilIcon}",
                                          progressIndicatorBuilder:
                                              (context, url, downloadProgress) =>
                                          const   CupertinoActivityIndicator(),
                                          errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                        ),

                                        Text(
                                          box.get("language") == "1"
                                              ?   providerMainHome
                                              .listDataServiceList[index]
                                              .service[index2]
                                              .serviceName
                                              : box.get("language") == "2"
                                              ? providerMainHome
                                              .listDataServiceList[index]
                                              .service[index2]
                                              .serviceNameQQ
                                              :providerMainHome
                                              .listDataServiceList[index]
                                              .service[index2]
                                              .serviceNameRu,

                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines:4,
                                          // softWrap: true,
                                          style: const TextStyle(
                                              fontFamily: 'Roboto-Medium'),
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
      : const Center(child: CupertinoActivityIndicator());
}
