import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/service_page/provider_service_page.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget servicePageHead(
    {required BuildContext context,
    required ProviderServicePage providerServicePage,
    required String categoryName,
    required int status}) {
  return Container(
    decoration: BoxDecoration(color: MyColors.appColorWhite()),
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyWidgets.robotoFontText(
              text: categoryName,
              textFontWeight: FontWeight.bold,
              textSize: 25),
          const SizedBox(height: 20),
          MaterialButton(
              onPressed: () {
                providerServicePage.checkUserStatus(
                    context: context,
                    status: status,
                    categoryName: categoryName);
              },
              minWidth: double.infinity,
              height: 50,
              color: status == 1
                  ? MyColors.appColorBlue1()
                  : Colors.blueAccent.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: MyWidgets.robotoFontText(
                  text: "Xizmatdan foydalanish",
                  textColor: MyColors.appColorWhite())),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
