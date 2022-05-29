import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/carousel.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/show_by_category/show_by_category.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

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
                floating: true,
                expandedHeight: 200.0,
                centerTitle: true,

                // foregroundColor: MyColors.appColorWhite(),
                forceElevated: innerBoxIsScrolled,
                excludeHeaderSemantics: true,
                flexibleSpace:  carouselMain(
                    context: context, providerMainHome: providerMainHome),
              ),
            ];
          },
          body: Container(
              margin: const EdgeInsets.fromLTRB(10, 2, 10, 8),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: providerMainHome.modelListForDeleteTemp.length,
                itemBuilder: (context, index) => SizedBox(
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyWidgets.robotoFontText(text: "${index + 1}"),
                            GestureDetector(
                              onTap: () {
                                myViewButton(
                                    context: context,
                                    providerMainHome: providerMainHome,
                                    myList: providerMainHome
                                        .modelListForDeleteTemp[index]);
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
                            itemCount: providerMainHome
                                .modelListForDeleteTemp[index].length,
                            itemBuilder: (context, index2) => GestureDetector(
                              onTap: () {
                                /// go service page
                                providerMainHome.goServicePage(
                                    context: context,
                                    status: providerMainHome
                                        .modelListForDeleteTemp[index][index2]
                                        .status,
                                    serviceId: providerMainHome
                                        .modelListForDeleteTemp[index][index2]
                                        .id,
                                    category: providerMainHome
                                        .modelListForDeleteTemp[index][index2]
                                        .category,
                                    categoryName: providerMainHome
                                        .modelListForDeleteTemp[index][index2]
                                        .name);
                              },
                              child: Container(
                                height: 80,
                                width: 100,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color:
                                        providerMainHome.myColors.randomColor(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      providerMainHome
                                          .modelListForDeleteTemp[index][index2]
                                          .name,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      maxLines: 3,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              )),
        )
      : const Center(child: CupertinoActivityIndicator());
}
