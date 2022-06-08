import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/privillage/provider_privilege.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget bodyPrivilege(
    {required BuildContext context,
    required ProviderPrivilege providerPrivilege}) {
  return providerPrivilege.boolGetDataPrivilege
      ? Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(

              color: MyColors.appColorWhite()),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            MyWidgets.robotoFontText(text: "privileges".tr(), textSize: 25),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: providerPrivilege.listCheckPrivilege.length,
                itemBuilder: (context, index) => Container(
                  padding:const EdgeInsets.all(5),
                  margin:const EdgeInsets.all(5),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                          color: MyColors.appColorWhite(),

                            boxShadow: [BoxShadow(color: MyColors.appColorGrey400(), blurRadius: 1, spreadRadius: 1)]
                          ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          providerPrivilege
                              .listCheckPrivilege[index].orgName
                              .toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: MyColors.appColorBlue1(),
                              fontSize:  20,
                              fontWeight:  FontWeight.normal,
                              fontFamily: 'Roboto-Medium'),
                        ),
                        const Divider(),
                        Text(
                          providerPrivilege
                              .listCheckPrivilege[index].typeName
                              .toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: MyColors.appColorBlack(),
                              fontSize:  17,
                              fontStyle: FontStyle.italic,
                              fontWeight:  FontWeight.normal,
                              fontFamily: 'Roboto-Medium'),
                        ),

                        MyWidgets.robotoFontText(
                            text: providerPrivilege
                                .listCheckPrivilege[index].serNum
                                .toString()),
                        MyWidgets.robotoFontText(
                            text: providerPrivilege
                                .listCheckPrivilege[index].startDate
                                .toString()),
                        MyWidgets.robotoFontText(
                            text: providerPrivilege
                                .listCheckPrivilege[index].endDate
                                .toString()),

                      ],
                    )),
              ),
            )
          ]),
        )
      : MyWidgets.loaderDownload(context: context);
}
