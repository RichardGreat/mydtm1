import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

Widget carouselMain(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
  var box = Hive.box("online");

  List<Color> myColors = [
    const Color.fromRGBO(252, 246, 225, 1),
    const Color.fromRGBO(252, 246, 225, 1),
    const Color.fromRGBO(252, 246, 225, 1),
    const Color.fromRGBO(252, 246, 225, 1),
    const Color.fromRGBO(252, 246, 225, 1),
    const Color.fromRGBO(232, 247, 244, 1),
    const Color.fromRGBO(232, 247, 244, 1),
    const Color.fromRGBO(232, 247, 244, 1),
    const Color.fromRGBO(232, 247, 244, 1),
    const Color.fromRGBO(232, 247, 244, 1),
  ];
  Random random = Random();
  Color randomColor() {
    return myColors[random.nextInt(10)];
  }
  return Container(
    margin: const EdgeInsets.only(top: 10),
    child: CarouselSlider(

      options: CarouselOptions(
        height: 200,
          padEnds: false,
        //   aspectRatio: 90,
        //   enlargeCenterPage: true,
          viewportFraction: 1,
          autoPlay: true,
          enableInfiniteScroll: true,

          autoPlayInterval: const Duration(seconds: 8)),
      items: providerMainHome.listDataServiceList[0].service.map((i) {

        // items: ["1" ,"2","3","4" ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () async{
                  if (i.id
                      .toString() ==
                      "100000") {
                    final Uri _url =
                    Uri.parse(
                        "https://mandat.uzbmb.uz/");
                    await launchUrl(
                    _url,
                    mode: LaunchMode
                        .inAppWebView,
                    );
                  } else if (i.id
                      .toString() ==
                      "100001") {
                    final Uri _url2 =
                    Uri.parse(
                        "https://t.me/e_dtm_bot");
                    await launchUrl(
                    _url2,
                    mode: LaunchMode
                        .inAppWebView,
                    );}else{
                  providerMainHome.goServicePage(
                      context: context, serviceMainList: i);}
                },
                child: Container(
                  height: 180,
                    width: MediaQuery.of(context).size.width*1.2,
                    // margin: const EdgeInsets.symmetric(horizontal: 3.0),
                    decoration:const BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        color:Colors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: MyColors.appColorGrey400(),
                        //       // blurRadius: 5,
                        //       spreadRadius: 0.1)
                        // ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        SizedBox(

                          width: MediaQuery.of(context).size.width*0.5,
                          height: i.id.toString().length > 4?150: 100,
                          child: CachedNetworkImage(
                              filterQuality: FilterQuality.high,
                              fit: i.id.toString().length > 4?BoxFit.fitHeight: BoxFit.fitHeight,
                              height: MediaQuery.of(context).size.height*0.3,
                              imageUrl: "${i.mobilIcon}",
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) => Text(
                                    url.toString(),
                                  )),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.4,
                          child: Text(i.serviceText.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          maxLines: 4,
                          ),
                        ),
                        const SizedBox(height:4),
                      ],
                    )),
              ),
            );
          },
        );
      }).toList(),
    ),
  );
}
