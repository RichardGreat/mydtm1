import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/main.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

sheetAppLanguageInterface({required BuildContext context,
  required ProviderProfile providerProfile}) {
  showModalBottomSheet(
      backgroundColor: MyColors.appColorWhite(),
      enableDrag: false,

      context: context,
      builder: (context) {
        var box = Hive.box("online");
        return StatefulBuilder(
            builder: (context, setState) =>
                Container
                  (
                  height: 300,
                  decoration: BoxDecoration(color: MyColors.appColorWhite()),
                  child: Column(children: [
                    const SizedBox(height: 10),
                    MyWidgets.robotoFontText(text: "languageApp".tr()),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          color: MyColors.appColorWhite(),
                          height: MediaQuery.of(context).size.height*0.2,
                          child:Column(children: [
                            Divider(height: 0.4, color: MyColors.appColorGrey400()),
                            ListTile(
                              onTap: (){
                                context.locale = const Locale("uz", "UZ");
                                //context.setLocale(const Locale('uz', 'UZ'));
                                box.delete("language");
                                box.put("language", "1");
                                // Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MyApp()),(route) => false,);
                                setState((){});
                              },
                              title: MyWidgets.robotoFontText(text: "uz".tr()),
                              leading: Icon(Icons.language,  color: MyColors.appColorBlue1(),),
                            ),
                            // Divider(height: 0.4, color: MyColors.appColorGrey400()),
                            // ListTile(
                            //   onTap: (){
                            //     context.locale = const Locale("kk", "KK");
                            //     box.delete("language");
                            //     box.put("language", "2");
                            //     // Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) =>  MyApp ()),(route) => false,);
                            //     setState((){});
                            //   },
                            //   title: MyWidgets.robotoFontText(text: "qq".tr()),
                            //   leading: Icon(Icons.language,  color: MyColors.appColorBlue1(),),
                            // ),
                            Divider(height: 0.4, color: MyColors.appColorGrey400()),
                            ListTile(
                              onTap: (){
                                context.locale = const Locale("ru", "RU");
                                // context.setLocale(const Locale('ru', 'RU'));
                                box.delete("language");
                                box.put("language", "3");
                                // Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MyApp()),(route) => false,);
                                setState((){});
                              },
                              title: MyWidgets.robotoFontText(text: "ru".tr()),
                              leading: Icon(Icons.language,  color: MyColors.appColorBlue1(),),
                            ), Divider(height: 0.4, color: MyColors.appColorGrey400()),
                          ],)
                      ),
                    ),
                  ],),
                )
        );
      });
}
