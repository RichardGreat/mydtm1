import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';


Widget carouselMain(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
var box = Hive.box("online");
  return Container(
      margin: const EdgeInsets.only(top: 10),
      child:   CarouselSlider(
        options: CarouselOptions(
            autoPlay: true,

            autoPlayInterval: const Duration(seconds: 8)),
          items: providerMainHome.listDataServiceList[0].service.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin:const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    providerMainHome.goServicePage(
                        context: context, serviceMainList: i);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(
                                color: MyColors.appColorGrey400(),
                                blurRadius: 5,
                                spreadRadius: 0.1)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          CachedNetworkImage(
                            filterQuality: FilterQuality.high,
                            width: 80,
                            height: 80,
                            fit: BoxFit.fill,
                            imageUrl:   "${MainUrl.mainUrlImage}/${i.mobilIcon}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                            const   CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) =>
                            Image.asset("assets/images/gerb.png"),
                          ),

                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              box.get("language") == "1"
                                  ?   i.serviceName.toString()
                                  : box.get("language") == "2"
                                  ? i.serviceNameQQ.toString()
                                  : i.serviceNameRu.toString(),

                              maxLines: 2,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18.0, fontFamily: 'Roboto-Medium'),
                            ),
                          ),
                        ],
                      )),
                ),
              );
            },
          );
        }).toList(),
      ),);
}
