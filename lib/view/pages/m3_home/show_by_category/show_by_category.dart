import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/service_page/service_page.dart';
import 'package:mydtm/view/pages/m3_home/static_list_for_delete.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

myViewButton(
    {required BuildContext context,
    required List<ModelListForDelete> myList,
    required ProviderMainHome providerMainHome}) {
  showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: false,
      isScrollControlled: true,
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
                      Text(
                        myList[0].serviceName,
                        style: TextStyle(
                            color: MyColors.appColorBlack(),
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto-Medium'),
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.fade,
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
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ServicePage(
                                    status: myList[index].status,
                                    serviceId: myList[index].id,
                                    category: myList[index].category,
                                    categoryName: myList[index].name),
                              ));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 2),
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                          decoration: BoxDecoration(
                              color: providerMainHome.myColors.randomColor(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.account_balance_sharp, size: 48),
                              SizedBox(
                                child: Text(
                                  myList[index].name,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      color: MyColors.appColorBlack(),
                                      fontSize: 17,
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
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                  ),
                ),
              ],
            ));
      });
}
