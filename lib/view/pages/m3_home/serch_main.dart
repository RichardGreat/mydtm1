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
      enableDrag: false,
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
                      onChanged: (val){
                        providerMainHome.searchServicesItem(searchValue: val);
                        state((){});
                      },
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
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
                      icon: const Icon(Icons.close))
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                itemCount: providerMainHome.modelListForDeleteSearch.length,
                 itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.fromLTRB(5, 1, 4, 1),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: MyColors.appColorGrey100()))),
                    child: MyWidgets.robotoFontText(
                        text: providerMainHome.modelListForDeleteSearch[index].name,
                        textSize: 18)),
              ))
            ]),
          ),
        );
      });
}
