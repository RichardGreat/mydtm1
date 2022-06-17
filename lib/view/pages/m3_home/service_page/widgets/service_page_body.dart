import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/m3_home/service_page/provider_service_page.dart';
import 'package:mydtm/view/pages/m3_home/service_page/widgets/service_page_bottonsheet.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/body_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/main_my_statement.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget servicePageBody(
    {required BuildContext context,
    required ServiceMainList serviceMainList,
    required ProviderServicePage providerServicePage}) {
  List<String> myList = [
    "Xizmat haqida",
    "Xizmat bo'yicha arizalarim",
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.all(10),
        child: MyWidgets.robotoFontText(
            text: "Qo'shimcha ma'lumotlar",
            textSize: 15,
            textColor: MyColors.appColorGrey600()),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.appColorWhite()),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              if (index == 0) {
                serviceSheetBottomSheet(
                    serviceMainList: serviceMainList,
                    context: context,
                    providerServicePage: providerServicePage);
              } else if (index == 1) {

                if(serviceMainList.id.toString().trim() == "42") {
                  pushNewScreen(context,
                      screen: MainMyStatement(numberParam: "0"));
                }
                else{
                  MyWidgets.awesomeDialogError(context: context, valueText:"Ariza mavjud emas");
                }
              }
            },
            shape: RoundedRectangleBorder(
                side: BorderSide(
              color: MyColors.appColorGrey100(),
              width: 1,
            )),
            leading: MyWidgets.robotoFontText(
                text: myList[index], textColor: MyColors.appColorBlack()),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ),
      )
    ],
  );
}
