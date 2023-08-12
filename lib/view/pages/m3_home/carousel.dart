import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget carouselMain(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
  var box = Hive.box("online");
  return Container(
    margin: const EdgeInsets.only(top: 10),
    child: CarouselSlider(
      options: CarouselOptions(
        // height: 300,
        //   padEnds: true,
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
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  providerMainHome.goServicePage(
                      context: context, serviceMainList: i);
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColors.appColorBBA(),
                        boxShadow: [
                          BoxShadow(
                              color: MyColors.appColorGrey400(),
                              blurRadius: 5,
                              spreadRadius: 0.1)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        CachedNetworkImage(
                            filterQuality: FilterQuality.high,
                            // width: MediaQuery.of(context).size.width*0.2,

                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height*0.2,
                            imageUrl: "${i.mobilIcon}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) => Text(
                                  url.toString(),
                                )),

                        const SizedBox(height: 10),
                        // Align(
                        //   alignment: Alignment.bottomCenter,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text(
                        //       box.get("language") == "1"
                        //           ?   i.serviceName.toString()
                        //           : box.get("language") == "2"
                        //           ? i.serviceNameQQ.toString()
                        //           : i.serviceNameRu.toString(),
                        //           // ?   i.toString()
                        //           // : box.get("language") == "2"
                        //           // ? i.toString()
                        //           // : i.toString(),
                        //
                        //       maxLines: 2,
                        //       softWrap: true,
                        //       textAlign: TextAlign.center,
                        //       style: const TextStyle(
                        //           fontSize: 18.0, fontFamily: 'Roboto-Medium'),
                        //     ),
                        //   ),
                        // ),
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
