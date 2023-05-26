// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/texnikum/qayd_varaqa/q2_appbar.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class ApplicationTexnikum extends StatefulWidget {
  ProviderTexnikum providerTexnikum;

  ApplicationTexnikum({Key? key, required this.providerTexnikum})
      : super(key: key);

  @override
  State<ApplicationTexnikum> createState() => _ApplicationTexnikumState();
}

class _ApplicationTexnikumState extends State<ApplicationTexnikum> {
  @override
  initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    await widget.providerTexnikum.getAllData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorGrey100(),
      appBar: appBarQaydVaraqa(),
      body: widget.providerTexnikum.boolQaydVaraqaGet
          ? SafeArea(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      MyWidgets.robotoFontText(text: "aboutApplication".tr()),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MyColors.appColorWhite(),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  color: MyColors.appColorGrey400())
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ListTile(
                            //     title: Text("holat".tr()),
                            //     onTap: () {},
                            //     trailing: Container(
                            //       padding: const EdgeInsets.all(5),
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(4),
                            //         color: widget
                            //                     .providerTexnikum
                            //                     .modelQaydVaraqaTexnikum
                            //                     .abitur
                            //                     .pstype
                            //                     .toString() ==
                            //                 "1"
                            //             ? Colors.amber
                            //             : widget
                            //                         .providerTexnikum
                            //                         .modelQaydVaraqaTexnikum
                            //                         .abitur
                            //                         .pstype
                            //                         .toString() ==
                            //                     "2"
                            //                 ? MyColors.appColorBlue1()
                            //                 : MyColors.appColorRed(),
                            //       ),
                            //       child: Text(
                            //         widget
                            //             .providerTexnikum
                            //             .modelQaydVaraqaTexnikum
                            //             .abitur
                            //             .statusName
                            //             .toString(),
                            //         style: TextStyle(
                            //             fontWeight: FontWeight.w500,
                            //             fontSize: 16,
                            //             color: MyColors.appColorWhite()),
                            //       ),
                            //     )),
                            ListTile(
                              title: Text("applicent".tr()),
                              onTap: () {},
                              trailing: Text(
                                  "${widget.providerTexnikum.modelQaydVaraqaTexnikum.abitur.lname}.${widget.providerTexnikum.modelQaydVaraqaTexnikum.abitur.fname.toString().substring(0, 1)}.${widget.providerTexnikum.modelQaydVaraqaTexnikum.abitur.mname.toString().substring(0, 1)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: MyColors.appColorBlack())),
                            ),
                            ListTile(
                              title: Text("lastChange".tr()),
                              onTap: () {},
                              trailing: Text(
                                widget.providerTexnikum.modelQaydVaraqaTexnikum
                                            .abitur.updateAt
                                            .toString() ==
                                        "null"
                                    ? widget.providerTexnikum
                                        .modelQaydVaraqaTexnikum.abitur.createAt
                                        .toString()
                                        .substring(0, 16)
                                    : widget.providerTexnikum
                                        .modelQaydVaraqaTexnikum.abitur.updateAt
                                        .toString()
                                  ..substring(0, 16),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ),

                            ListTile(
                              title: const Text("Tanlangan texnikum"),
                              horizontalTitleGap: 1,
                              onTap: () {},
                              trailing: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  widget.providerTexnikum
                                      .modelQaydVaraqaTexnikum.abitur.educ
                                      .toString()
                                      .toString(),
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            ListTile(
                              title: const Text("Yo'nalish"),
                              horizontalTitleGap: 1,
                              onTap: () {},
                              trailing: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  widget.providerTexnikum
                                      .modelQaydVaraqaTexnikum.abitur.science
                                      .toString()
                                      .toString(),
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            ListTile(
                              title:const  Text("Ta'lim shakl"),
                              horizontalTitleGap: 1,
                              onTap: () {},
                              trailing: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  widget
                                      .providerTexnikum
                                      .modelQaydVaraqaTexnikum
                                      .abitur
                                      .talimShakli
                                      .toString(),
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            ListTile(
                              title: const Text("Ta'lim tili"),
                              horizontalTitleGap: 1,
                              onTap: () {},
                              trailing: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  widget.providerTexnikum
                                      .modelQaydVaraqaTexnikum.abitur.talmTili
                                      .toString(),
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),

                            // MyWidgets.robotoFontText(text: "Oliy ta'lim muassasalariga qabul"),
                            // MyWidgets.robotoFontText(text: providerAriza.model.imie.toString()),
                            // MyWidgets.robotoFontText(text: providerAriza.model.invoice.toString()),
                            // MyWidgets.robotoFontText(text: providerAriza.model.status.toString()),
                          ],
                        ),
                      ),
                      widget.providerTexnikum.modelQaydVaraqaTexnikum.abitur
                                  .flangCertName
                                  .toString()
                                  .length >
                              4
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                MyWidgets.robotoFontText(
                                    text: "Chet tili sertifikati"),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: MyColors.appColorWhite(),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            color: MyColors.appColorGrey400())
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                          title: Text("holat".tr()),
                                          onTap: () {},
                                          trailing: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: widget
                                                          .providerTexnikum
                                                          .modelQaydVaraqaTexnikum
                                                          .abitur
                                                          .pstype
                                                          .toString() ==
                                                      "1"
                                                  ? Colors.amber
                                                  : widget
                                                              .providerTexnikum
                                                              .modelQaydVaraqaTexnikum
                                                              .abitur
                                                              .pstype
                                                              .toString() ==
                                                          "2"
                                                      ? MyColors.appColorBlue1()
                                                      : MyColors.appColorRed(),
                                            ),
                                            child: Text(
                                              widget
                                                  .providerTexnikum
                                                  .modelQaydVaraqaTexnikum
                                                  .abitur
                                                  .statusName
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color:
                                                      MyColors.appColorWhite()),
                                            ),
                                          )),
                                      ListTile(
                                        title: const Text("Chet tili"),
                                        onTap: () {},
                                        trailing: Text(
                                            widget
                                                .providerTexnikum
                                                .modelQaydVaraqaTexnikum
                                                .abitur
                                                .flangName
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color:
                                                    MyColors.appColorBlack())),
                                      ),
                                      ListTile(
                                        title:const Text("daraja"),
                                        onTap: () {},
                                        trailing: Text(
                                          widget
                                              .providerTexnikum
                                              .modelQaydVaraqaTexnikum
                                              .abitur
                                              .flangLevelName
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                      ListTile(
                                        title:const  Text("Turi"),
                                        horizontalTitleGap: 1,
                                        onTap: () {},
                                        trailing: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: Text(
                                            widget
                                                .providerTexnikum
                                                .modelQaydVaraqaTexnikum
                                                .abitur
                                                .flangCertName
                                                .toString(),
                                            textAlign: TextAlign.right,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title:const  Text("Berilgan vaqti"),
                                        horizontalTitleGap: 1,
                                        onTap: () {},
                                        trailing: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: Text(
                                            widget
                                                .providerTexnikum
                                                .modelQaydVaraqaTexnikum
                                                .abitur
                                                .givenDate
                                                .toString()
                                                .substring(0, 11),
                                            textAlign: TextAlign.right,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      widget.providerTexnikum.modelQaydVaraqaTexnikum.imtiyoz
                              .isNotEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyWidgets.robotoFontText(text: "imtiyoz"),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: MyColors.appColorWhite(),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            color: MyColors.appColorGrey400())
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        title: Text(
                                          widget
                                                      .providerTexnikum
                                                      .modelQaydVaraqaTexnikum
                                                      .imtiyoz[0]
                                                      .typeId
                                                      .toString() ==
                                                  "1"
                                              ? "Ko‘zi ojiz bo‘lgan shaxslar uchun imtiyoz"
                                              : "Kam taminlangan shaxslar uchun imtiyoz",
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}
