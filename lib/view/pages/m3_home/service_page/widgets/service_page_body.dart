import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/service_page/provider_service_page.dart';
import 'package:mydtm/view/pages/m3_home/service_page/widgets/service_page_bottonsheet.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget servicePageBody(
    {required BuildContext context,
    required ProviderServicePage providerServicePage}) {
  List<String> myList = [
    "Xizmat haqida",
    "Foydalanish statistikasi",
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
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.appColorWhite()),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => ListTile(
            onTap: (){
              if(index == 0) {
                serviceSheetBottomSheet(
                    context: context, providerServicePage: providerServicePage);
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
