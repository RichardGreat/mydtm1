import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/service_page/service_page.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:showcaseview/showcaseview.dart';

myViewButton(
    {required BuildContext context,
    required List<ServiceMainList> myList,
    required ProviderMainHome providerMainHome}) {
  var box = Hive.box("online");
  showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: MyColors.appColorWhite(),
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: MyColors.appColorWhite()),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 2, bottom: 2),
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          "services".tr(),
                          style: TextStyle(
                              color: MyColors.appColorBlack(),
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Roboto-Medium'),
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 32,
                            color: MyColors.appColorBlack(),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();

                          pushNewScreen(
                            context,
                            screen: ShowCaseWidget(
                              builder: Builder(
                                  builder: (context) => ShowCaseWidget(
                                        builder: Builder(
                                          builder: (context) => ServicePage(
                                              serviceMainList: myList[index]),
                                        ),
                                      )),
                            ),

                            withNavBar: true,
                            // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );

                          // Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(
                          //       builder: (context) => ServicePage(
                          //           status: myList[index].status,
                          //           serviceId: myList[index].id,
                          //           category: myList[index].category,
                          //           categoryName: myList[index].name),
                          //     ));
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 2),
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                          decoration: BoxDecoration(
                              color: MyColors.appColorWhite(),
                              boxShadow: [
                                BoxShadow(
                                    color: MyColors.appColorGrey600(),
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.fill,
                                  imageUrl: myList[index].mobilIcon,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          const CupertinoActivityIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset("assets/images/uzbmb.png")),
                              SizedBox(
                                child: Text(
                                  box.get("language") == "1"
                                      ? myList[index].serviceName
                                      : box.get("language") == "2"
                                          ? myList[index].serviceNameQQ
                                          : myList[index].serviceNameRu,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: MyColors.appColorBlack(),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Medium'),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1.3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                  ),
                ),
              ],
            ));
      });
}
