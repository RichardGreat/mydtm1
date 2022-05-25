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
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(color: MyColors.appColorWhite()),
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
                              status: myList[index].status
                                  ,
                              serviceId: myList[index].id,
                              category: myList[index].category,
                              categoryName: myList[index].name),
                        ));
                  },
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: providerMainHome.myColors.randomColor(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(child: Text(myList[index].name))),
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
            ));
      });
}
