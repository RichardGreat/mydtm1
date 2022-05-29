import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget searchMain(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
  return AppBar(
    backgroundColor: MyColors.appColorWhite(),
    elevation: 0,
    centerTitle: true,
    title: GestureDetector(
      onTap: () {
        mainSearchBottomSheet(
            context: context, providerMainHome: providerMainHome);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        width: MediaQuery.of(context).size.width * 0.85,
        height: 40,
        decoration: BoxDecoration(
            color: MyColors.appColorGrey100(),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: MyColors.appColorGrey400(),
            ),
            MyWidgets.robotoFontText(
                text: "Xizmat nomini kiriting",
                textColor: MyColors.appColorGrey400())
          ],
        ),
      ),
    ),
    //MyWidgets.robotoFontText(text:"search", ),
  );
}

mainSearchBottomSheet(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
  showModalBottomSheet(
      context: context,

      enableDrag: true,
      isDismissible: false,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, state) => Container(
            height: MediaQuery.of(context).size.height * 0.88,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: providerMainHome.textEditController,
                      onChanged: (val){
                        providerMainHome.searchServicesItem(searchValue: val);
                        state((){});
                      },
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              providerMainHome.searchServicesItem(searchValue: "");
                              providerMainHome.textEditController.clear();
                              state((){});
                            }, icon: const Icon(Icons.clear, size: 13,)),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey600(),
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey600(),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey600(),
                            )),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        providerMainHome.closeSearchMain();
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.keyboard_arrow_down_sharp, size: 32,))
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                    itemCount: providerMainHome.modelListForDeleteSearch.length,
                itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.fromLTRB(5, 4, 4, 4),
                    padding: const EdgeInsets.fromLTRB(1, 3, 1, 4),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: MyColors.appColorGrey100()))),
                    child: GestureDetector(
                      onTap: (){
                        // Navigator.of(context).pop();
                        providerMainHome.goServicePage(
                            context: context,
                            status:providerMainHome.modelListForDeleteSearch[index].status,
                            serviceId:providerMainHome.modelListForDeleteSearch[index].id,
                            category: providerMainHome.modelListForDeleteSearch[index].category,
                            categoryName:providerMainHome.modelListForDeleteSearch[index].name);


                      },
                      child: MyWidgets.robotoFontText(
                          text: providerMainHome
                              .modelListForDeleteSearch[index].name,
                          textColor: Colors.black.withOpacity(0.9),
                          textSize: 20),
                    )),
              ))
            ]),
          ),
        );
      });
}
