
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class LangChangeAll extends StatefulWidget {
  ProviderProfile providerProfile;

  LangChangeAll({super.key, required this.providerProfile});

  @override
  State<LangChangeAll> createState() => _LangChangeAllState();
}

class _LangChangeAllState extends State<LangChangeAll> {
  var box = Hive.box("online");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(backgroundColor: MyColors.appColorWhite(),elevation: 0,

      iconTheme: IconThemeData(color: MyColors.appColorBlack()),
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(color: MyColors.appColorWhite()),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    MyWidgets.robotoFontText(text: "languageApp".tr(), textSize: 24),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          color: MyColors.appColorWhite(),
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              Divider(
                                  height: 0.4,
                                  color: MyColors.appColorGrey400()),
                              ListTile(
                                onTap: () {

                                  widget.providerProfile.changeLang(langId: "0", context: context);


                                },
                                title:
                                    MyWidgets.robotoFontText(text: "uz".tr()),
                                leading: Icon(
                                  Icons.language,
                                  color: MyColors.appColorBlue1(),
                                ),
                              ),
                              Divider(
                                  height: 0.4,
                                  color: MyColors.appColorGrey400()),
                              ListTile(
                                onTap: () {
                                  widget.providerProfile.changeLang(langId: "1", context: context);


                                },
                                title:
                                    MyWidgets.robotoFontText(text: "qq".tr()),
                                leading: Icon(
                                  Icons.language,
                                  color: MyColors.appColorBlue1(),
                                ),
                              ),
                              Divider(
                                  height: 0.4,
                                  color: MyColors.appColorGrey400()),
                              ListTile(
                                onTap: () {

                                  widget.providerProfile.changeLang(langId: "2", context: context);

                                },
                                title:
                                    MyWidgets.robotoFontText(text: "ru".tr()),
                                leading: Icon(
                                  Icons.language,
                                  color: MyColors.appColorBlue1(),
                                ),
                              ),
                              Divider(
                                  height: 0.4,
                                  color: MyColors.appColorGrey400()),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ]),
      )),
    );
  }
}
