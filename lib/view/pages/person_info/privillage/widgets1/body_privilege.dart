import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/check_information_page.dart';
import 'package:mydtm/view/pages/person_info/privillage/provider_privilege.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:showcaseview/showcaseview.dart';

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
                margin: const EdgeInsets.all(5),
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
                      "${providerPrivilege.listCheckPrivilege[index].typeName}",
                      maxLines: 6,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: MyColors.appColorBlack(),
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Medium'),
                    ),
                    const Divider(),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "documentSerNum".tr(),
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: MyColors.appColorGrey600(),
                                    fontSize: 15,
                                    // fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto-Medium'),
                              ),
                              Text(
                                providerPrivilege
                                    .listCheckPrivilege[index].serNum
                                    .toString(),
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: MyColors.appColorGrey600(),
                                    fontSize: 15,
                                    // fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto-Medium'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const Divider(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyWidgets.robotoFontText(
                                  textColor: MyColors.appColorGrey600(),
                                  textSize: 14,
                                  text: providerPrivilege
                                              .listCheckPrivilege[index]
                                              .startDate
                                              .toString()
                                              .length >
                                          10
                                      ? providerPrivilege
                                          .listCheckPrivilege[index].startDate
                                          .substring(0, 10)
                                          .toString()
                                      : providerPrivilege
                                          .listCheckPrivilege[index].startDate
                                          .toString()),
                              Icon(Icons.arrow_forward_rounded,
                                  size: 14, color: MyColors.appColorGrey600()),
                              MyWidgets.robotoFontText(
                                  textColor: MyColors.appColorGrey600(),
                                  textSize: 14,
                                  text: providerPrivilege
                                              .listCheckPrivilege[index].endDate
                                              .toString()
                                              .length >
                                          10
                                      ? providerPrivilege
                                          .listCheckPrivilege[index].endDate
                                          .substring(0, 10)
                                      : providerPrivilege
                                          .listCheckPrivilege[index].endDate
                                          .toString()),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // providerPrivilege.listCheckPrivilege[index].typeId
                    //                 .toString() ==
                    //             "2" &&
                    //         providerPrivilege.listCheckPrivilege[index].status
                    //                 .toString() ==
                    //             "7"
                    //     ? const Divider()
                    //     : const SizedBox.shrink(),
                    // providerPrivilege.listCheckPrivilege[index].typeId
                    //                 .toString() ==
                    //             "2" &&
                    //         providerPrivilege.listCheckPrivilege[index].status
                    //                 .toString() ==
                    //             "7"
                    //     ? Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //             GestureDetector(
                    //               onTap:(){
                    //                 pushNewScreen(context, screen: const InvalidAdd(),
                    //                   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    //                   withNavBar: false);
                    //                 },
                    //               child: Icon(Icons.edit,
                    //                   color: MyColors.appColorBlue1()),
                    //             ),
                    //             GestureDetector(
                    //               onTap:(){
                    //
                    //                 AwesomeDialog(
                    //                     context: context,
                    //                     dialogType: DialogType.noHeader,
                    //                     animType: AnimType.bottomSlide,
                    //                     dismissOnTouchOutside: false,
                    //                     title: "BBA",
                    //                     desc: "wantToDelete".tr(),
                    //                     titleTextStyle: TextStyle(
                    //                         color: MyColors.appColorBlue1(),
                    //                         fontSize: 24,
                    //                         fontWeight: FontWeight.bold),
                    //                     descTextStyle: TextStyle(
                    //                         color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
                    //                     btnOkOnPress: (){
                    //                       providerPrivilege.deleteInvalid(context: context);
                    //                     },
                    //                     btnCancelOnPress: () {},
                    //
                    //                     btnOkColor: MyColors.appColorGrey100(),
                    //                     btnCancelColor: MyColors.appColorBlue1(),
                    //
                    //                     btnOkText: "yes".tr(),buttonsTextStyle: TextStyle(color: MyColors.appColorBlack()),
                    //                     btnCancelText: "no".tr())
                    //                     .show();
                    //
                    //
                    //
                    //               },
                    //               child: Icon(Icons.delete_forever,
                    //                   color: Colors.red.shade500),
                    //             ),
                    //           ])
                    //     : const SizedBox.shrink(),
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
                        dialogType: DialogType.noHeader,
                        animType: AnimType.bottomSlide,
                        title: "BBA",
                        desc: "chooseDirection".tr(),
                        titleTextStyle: TextStyle(
                            color: MyColors.appColorBlue1(),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        descTextStyle: TextStyle(
                            color: MyColors.appColorBlack(),
                            fontWeight: FontWeight.bold),
                        btnCancelOnPress: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => ShowCaseWidget(
                            builder: Builder(
                              builder: (context) => CheckInformation(
                                  serviceName:
                                  box.get("categoryName").toString()),
                            ),
                          )));

                        },
                        btnCancelColor: MyColors.appColorBlue1(),
                        btnCancelText: "OK")
                    .show();
              },
            ),
          ],
        ),
      ]),
    );
  } else {
    return MyWidgets.loaderDownload(context: context);
  }
}
