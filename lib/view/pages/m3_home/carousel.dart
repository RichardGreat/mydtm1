import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';

Widget carouselMain(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
  return SizedBox(
    // margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(

                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8)
            ),
            items: providerMainHome.modelListForDeleteTemp[3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      providerMainHome.goServicePage
                        (context: context,
                          category: i.category,
                          serviceId: i.id,
                          categoryName: i.name,
                          status: i.status);
                    },
                    child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber),
                        child: Center(
                            child: Text(
                              i.name,
                              style: TextStyle(fontSize: 16.0),
                            ))),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ));
}
