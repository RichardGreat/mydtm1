import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/view/pages/m3_home/carousel.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/serch_main.dart';
import 'package:mydtm/view/pages/m3_home/show_by_category/show_by_category.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:universal_image/universal_image.dart';

Widget bodyMainHome(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
  return providerMainHome.boolParseData
      ? NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: MyColors.appColorWhite(),
                floating: false,
                // centerTitle: false,
                elevation: 0,
                expandedHeight: 0,
                flexibleSpace: searchMain(
                    context: context, providerMainHome: providerMainHome),
                // foregroundColor: MyColors.appColorWhite(),
                forceElevated: innerBoxIsScrolled,
                excludeHeaderSemantics: true,
                // flexibleSpace:
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
                itemCount: providerMainHome.listDataServiceList
                    .length,
                itemBuilder: (context, index) =>
                  providerMainHome.listDataServiceList[index].service.isNotEmpty ?
                    SizedBox(
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                providerMainHome.listDataServiceList[index]
                                    .categoryName,
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

                                if(providerMainHome.listDataServiceList[index].service.isNotEmpty) {
                                  myViewButton(
                                      context: context,
                                      providerMainHome: providerMainHome,
                                      myList: providerMainHome
                                          .listDataServiceList[index].service);
                                }
                              },
                              child: MyWidgets.robotoFontText(
                                  text: "Barchasi",
                                  textColor: MyColors.appColorBlue1(),
                                  textSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                providerMainHome.listDataServiceList[index].service.length,
                            itemBuilder: (context, index2) => GestureDetector(
                              onTap: () {
                                /// go service page
                                providerMainHome.goServicePage(
                                    context: context,
                                  serviceMainList: providerMainHome.listDataServiceList[index].service[index2],
                                    );
                              },
                              child: Container(
                                height: 100,
                                width: 120,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color:
                                        providerMainHome.myColors.randomColor(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 1),

                                    UniversalImage(
                                      "${MainUrl.mainUrlImage}/${providerMainHome.listDataServiceList[index].service[index2].icon}", // image storage file path
                                      color: Colors.black,
                                      matchTextDirection: false,
                                      scale: 1.0,
                                      width: 30,
                                      height: 30,
                                      // frameBuilder: null,
                                      // errorBuilder: null,
                                      // semanticLabel: null,
                                      // excludeFromSemantics: false,
                                      // colorBlendMode: BlendMode.clear,
                                      // fit: BoxFit.cover,
                                      // alignment: Alignment.center,
                                      // repeat: ImageRepeat.noRepeat,
                                      // centerSlice: Rect.fromLTWH(0, 0, 100, 100),
                                      // gaplessPlayback: false,
                                      // isAntiAlias: false,
                                      // filterQuality: FilterQuality.high,
                                      // cacheWidth: 30,
                                      // cacheHeight: 30,
                                      // allowDrawingOutsideViewBox: false,
                                      // svgSkiaMode: false,
                                      placeholder: Container(child: CupertinoActivityIndicator()),
                                    ),


                                    // SvgPicture.network(
                                    //
                                    //   "${MainUrl.mainUrlImage}/${providerMainHome.listDataServiceList[index].service[index2].icon}",
                                    //   height: 40,
                                    //   fit: BoxFit.fill,
                                    //   placeholderBuilder:
                                    //       (BuildContext context) => Container(
                                    //           padding:
                                    //               const EdgeInsets.all(30.0),
                                    //           child:
                                    //               const CircularProgressIndicator()),
                                    // ),

                                    // Icon(Icons.account_balance_sharp,
                                    //     color: MyColors.appColorBlack(),
                                    //     size: 32),
                                    Text(
                                      providerMainHome
                                          .listDataServiceList[index]
                                          .service[index2]
                                          .serviceName,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      maxLines: 2,
                                      softWrap: true,
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
                :const SizedBox.shrink()
                ,
              )),
        )
      : const Center(child: CupertinoActivityIndicator());
}
