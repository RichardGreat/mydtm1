import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/m3_home/service_page/provider_service_page.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:showcaseview/showcaseview.dart';

Widget servicePageHead({required BuildContext context,
  required ProviderServicePage providerServicePage,
  required ServiceMainList serviceMainList,
  required GlobalKey oneServicePageGlobal
}) {
  var box = Hive.box("online");
  return Container(
    decoration: BoxDecoration(color: MyColors.appColorWhite()),
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              box.get("language") == "1"
                  ? serviceMainList.serviceName
                  : box.get("language") == "2"
                  ? serviceMainList.serviceNameQQ
                  : serviceMainList.serviceNameRu,

              textAlign: TextAlign.start,

              style: TextStyle(

                  color: MyColors.appColorBlack(),
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto-Medium'),
            ),
          ),

          const SizedBox(height: 20),

          Showcase(
            key: oneServicePageGlobal,
            description: "Xizmatdan foydalanish knopkasini bosish orqali keyingi qadamga o'tasiz",
          child:   MaterialButton(
              onPressed: () {
                providerServicePage.checkUserStatus(
                  categoryId: serviceMainList.id.toString(),
                  context: context,
                  status: serviceMainList.status,
                  categoryName:
                  box.get("language") == "1"
                      ? serviceMainList.serviceName
                      : box.get("language") == "2"
                      ? serviceMainList.serviceNameQQ
                      : serviceMainList.serviceNameRu,
                );
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
          ),

          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
