import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:universal_image/universal_image.dart';

Widget carouselMain(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
  return Container(
      margin: const EdgeInsets.only(top: 10),
      child:   CarouselSlider(
        options: CarouselOptions(
            autoPlay: true,

            autoPlayInterval: const Duration(seconds: 8)),
          items: providerMainHome.listDataServiceList[5].service.map((i) {
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
                          color: MyColors.appColorWhite(),
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
                          UniversalImage(
                            "${MainUrl.mainUrlImage}/${i.mobilIcon}", // image storage file path
                            scale: 1.0,
                            width: 100,
                            height: 80,
                            placeholder:const Center(child: CupertinoActivityIndicator()),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              i.serviceName,
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
