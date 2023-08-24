import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/webview_window/webv_window.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget carouselMain(
    {required BuildContext context,
    required ProviderMainHome providerMainHome,
    required List<ServiceMainList> service}) {
  return Container(

    // margin: const EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)),
    child: CarouselSlider(
      options: CarouselOptions(
          height: 250,
          padEnds: true,
          viewportFraction: 1.1,
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 8)),
      items: providerMainHome.listDataServiceList[0].service.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              height: 250,

              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () async {
                  if (i.id.toString().length > 5) {
                    pushNewScreen(context,
                        screen: WebViewWindow(
                          modelServiceMainList: i,
                        ),
                        withNavBar: true);
                  }
                  else {
                    providerMainHome.goServicePage(
                        context: context, serviceMainList: i);
                  }
                },
                child: Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width * 1.2,
                    margin: const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: i.id.toString().length > 4 ? 150 : 100,
                            child: CachedNetworkImage(
                                filterQuality: FilterQuality.high,
                                fit: i.id.toString().length > 4
                                    ? BoxFit.fitHeight
                                    : BoxFit.fitHeight,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                imageUrl: "${i.mobilIcon}",
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        const CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) => Text(
                                      url.toString(),
                                    )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              i.serviceText.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: i.serviceText.toString().length < 30
                                      ? 20
                                      : 16,
                                  fontWeight: FontWeight.bold),
                              maxLines: 8,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
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
