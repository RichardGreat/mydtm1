import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget carouselMain(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
  MyColors myColors = MyColors();
  return SizedBox(
      // margin: const EdgeInsets.only(top: 10),
      child: Column(
    children: [
      CarouselSlider(
        options: CarouselOptions(
            autoPlay: true, autoPlayInterval: const Duration(seconds: 8)),
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
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: myColors.randomColor()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Icon(Icons.account_balance_sharp,
                            color: MyColors.appColorBlack(), size: 82),
                        const SizedBox(height: 20),
                        Text(
                          i.name,
                          style: const TextStyle(
                              fontSize: 24.0, fontFamily: 'Roboto-Medium'),
                        ),
                        const SizedBox(height: 20)
                      ],
                    )),
              );
                },
              );
            }).toList(),
          ),
        ],
      ));
}
