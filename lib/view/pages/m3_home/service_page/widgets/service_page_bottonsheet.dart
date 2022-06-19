import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/m3_home/service_page/provider_service_page.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';


serviceSheetBottomSheet(
    {required BuildContext context,
      required ServiceMainList serviceMainList,
    required ProviderServicePage providerServicePage}) {
  var box = Hive.box("online");
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            margin:const  EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyWidgets.robotoFontText(text: "aboutService".tr()),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
                HtmlWidget(
                  box.get("language") == "1"
                      ? serviceMainList.serviceText
                      : box.get("language") == "2"
                      ? serviceMainList.serviceNameQQ
                      : serviceMainList.serviceNameRu
                  ,textStyle: TextStyle(fontSize: 18), ),

              ],
            ),
          ),
        );
      });
}
