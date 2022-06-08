import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/m3_home/service_page/provider_service_page.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
Widget servicePageHead(
    {required BuildContext context,
    required ProviderServicePage providerServicePage,
    required ServiceMainList serviceMainList ,
   }) {
  return Container(
    decoration: BoxDecoration(color: MyColors.appColorWhite()),
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            serviceMainList.serviceName,
            textAlign: TextAlign.start,

            style: TextStyle(

                color: MyColors.appColorBlack(),
                fontSize: 20,
                fontWeight:  FontWeight.normal,
                fontFamily: 'Roboto-Medium'),
          ),

          const SizedBox(height: 20),
          MaterialButton(
              onPressed: () {
                providerServicePage.checkUserStatus(
                    context: context,
                    status: serviceMainList.status,
                    categoryName: serviceMainList.serviceName);
              },
              minWidth: double.infinity,
              height: 50,
              color: serviceMainList.status
                  ? MyColors.appColorBlue1()
                  : Colors.blueAccent.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: MyWidgets.robotoFontText(
                  text: "userService".tr(),
                  textColor: MyColors.appColorWhite())),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
