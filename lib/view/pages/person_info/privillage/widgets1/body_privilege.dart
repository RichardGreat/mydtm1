import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/privillage/provider_privilege.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bodyPrivilege(
    {required BuildContext context,
    required ProviderPrivilege providerPrivilege}) {
  if (providerPrivilege.boolGetDataPrivilege) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: MyColors.appColorWhite()),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        MyWidgets.robotoFontText(text: "privileges".tr(), textSize: 25),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: providerPrivilege.listCheckPrivilege.length,
            itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MyColors.appColorWhite(),
                    boxShadow: [
                      BoxShadow(
                          color: MyColors.appColorGrey400(),
                          blurRadius: 1,
                          spreadRadius: 1)
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
        )
      ]),
    );
  } else {
    return MyWidgets.loaderDownload(context: context);
  }
}
