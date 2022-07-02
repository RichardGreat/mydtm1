import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/check_information_page.dart';
import 'package:mydtm/view/pages/person_info/privillage/provider_privilege.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyPrivilege({
  required BuildContext context,
  required ProviderPrivilege providerPrivilege,
}) {
  if (providerPrivilege.boolGetDataPrivilege) {
    var box = Hive.box("online");
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: MyColors.appColorGrey100()),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),

        Expanded(
          child: ListView.builder(
            itemCount: providerPrivilege.listCheckPrivilege.length,
            itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(12),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MyColors.appColorWhite(),
                    boxShadow: [
                      BoxShadow(
                          color: MyColors.appColorGrey400(),
                          blurRadius: 0.5,
                          spreadRadius: 0.5)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1} "
                      "${providerPrivilege.listCheckPrivilege[index].orgName}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: MyColors.appColorBlack(),
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Medium'),
                    ),
                    const Divider(),
                    Text(
                      providerPrivilege.listCheckPrivilege[index].typeName
                          .toString(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: MyColors.appColorGrey600(),
                          fontSize: 15,
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Medium'),
                    ),
                    const Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyWidgets.robotoFontText(
                              text: providerPrivilege
                                  .listCheckPrivilege[index].serNum
                                  .toString(),
                              textSize: 14,
                              textColor: MyColors.appColorGrey600()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MyWidgets.robotoFontText(
                                  textColor: MyColors.appColorGrey600(),
                                  textSize: 14,
                                  text: providerPrivilege
                                      .listCheckPrivilege[index].startDate
                                      .toString()),
                              Icon(Icons.arrow_forward_rounded,
                                  size: 14, color: MyColors.appColorGrey600()),
                              MyWidgets.robotoFontText(
                                  textColor: MyColors.appColorGrey600(),
                                  textSize: 14,
                                  text: providerPrivilege
                                      .listCheckPrivilege[index].endDate
                                      .toString()),
                            ],
                          ),
                        ]),
                  ],
                )),
          ),
        ),
        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              height: 50,
              minWidth: MediaQuery.of(context).size.width * 0.7,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: MyColors.appColorBlue1(),
              child: Text("continue".tr(),
                  style: TextStyle(color: MyColors.appColorWhite())),
              onPressed: () {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.NO_HEADER,
                        animType: AnimType.BOTTOMSLIDE,
                        title: "DTM",
                        desc: "chooseDirection".tr(),
                        titleTextStyle: TextStyle(
                            color: MyColors.appColorBlue1(),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        descTextStyle: TextStyle(
                            color: MyColors.appColorBlack(),
                            fontWeight: FontWeight.bold),
                        btnCancelOnPress: () {
                          pushNewScreen(context,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                              screen: CheckInformation(
                                  serviceName: box.get("categoryName").toString()));
                        },
                        btnCancelColor: MyColors.appColorBlue1(),
                        btnCancelText: "OK")
                    .show();

              },
            ),

          ],
        )
      ]),
    );
  } else {
    return MyWidgets.loaderDownload(context: context);
  }
}
