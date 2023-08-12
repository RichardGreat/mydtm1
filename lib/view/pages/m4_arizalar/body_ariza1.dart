import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/body_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/perevod/check_info_perevod/check_info_perevodga.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget bodyAriza1(
    {required BuildContext context, required ProviderAriza providerAriza}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
    child: ListView.builder(
      itemCount: providerAriza.listArizaBodyService.length,
      itemBuilder: (context, index) => Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Text(
                providerAriza.listArizaBodyService[index].serviceName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Divider(),
              const SizedBox(height: 10),

              /// ID RAQAM
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyWidgets.robotoFontText(text: "ID", textSize: 16),
                  MyWidgets.robotoFontText(
                      text: providerAriza.listArizaBodyService[index].id
                          .toString(),
                      textSize: 16),
                ],
              ),
              const SizedBox(height: 10),

              /// FISH
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyWidgets.robotoFontText(text: "fish".tr(), textSize: 16),
                  MyWidgets.robotoFontText(
                      text: providerAriza.listArizaBodyService[index].fish,
                      textSize: 14),
                ],
              ),
              const SizedBox(height: 10),

              /// SAQLANGAN VAQT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: MyWidgets.robotoFontText(
                        text: "saveDateTime".tr(), textSize: 16),
                  ),
                  MyWidgets.robotoFontText(
                      text: providerAriza.listArizaBodyService[index].updateTime
                          .toString()
                          .substring(0, 16),
                      textSize: 14),
                ],
              ),
              const SizedBox(height: 15),
              providerAriza.listArizaBodyService[index].serviceName ==
                      "perevod1".tr()
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyWidgets.robotoFontText(
                            text: "muassasa".tr(), textSize: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "${providerAriza.listArizaBodyService[index].otmNomi}  ${providerAriza.listArizaBodyService[index].otmYunalish}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 10),

              /// TO'LOV
              providerAriza.listArizaBodyService[index].statusCheckPerevod
                          .toString() ==
                      "99"
                  ? providerAriza.listArizaBodyService[index].bitiruvchi == "1"
                      ? const SizedBox.shrink()
                      : GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                              text: providerAriza
                                  .listArizaBodyService[index].invoice
                                  .toString(),
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 2),
                                content: Text(
                                  "${"copy".tr()} ${providerAriza.listArizaBodyService[index].invoice}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                )));
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MyWidgets.robotoFontText(
                                      text: "numberInvoice".tr(), textSize: 16),
                                  Row(
                                    children: [
                                      const Icon(Icons.copy, size: 15),
                                      MyWidgets.robotoFontText(
                                          text: providerAriza
                                              .listArizaBodyService[index]
                                              .invoice
                                              .toString()
                                              .toString(),
                                          textSize: 14),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MyWidgets.robotoFontText(
                                      text: "holat".tr(), textSize: 16),
                                  providerAriza.listArizaBodyService[index]
                                              .bitiruvchi
                                              .toString() ==
                                          "1"
                                      ? const SizedBox.shrink()
                                      : Container(
                                          height: 30,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 10, 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: providerAriza
                                                          .listArizaBodyService[
                                                              index]
                                                          .holat ==
                                                      "0"
                                                  ? MyColors.appColorRed()
                                                  : MyColors.appColorBlue2()),
                                          child: Center(
                                              child: MyWidgets.robotoFontText(
                                                  text:
                                                      providerAriza.model.pay ==
                                                              0
                                                          ? "noPayed".tr()
                                                          : "payed".tr(),
                                                  textColor:
                                                      MyColors.appColorWhite(),
                                                  textFontWeight:
                                                      FontWeight.w600,
                                                  textSize: 15)

                                              // .animate(
                                              //     onPlay: (controller) =>
                                              //         controller.repeat(
                                              //             reverse: true))
                                              // .scaleXY(
                                              //     end: 1,
                                              //     delay: const Duration(
                                              //         milliseconds: 3000),
                                              //     curve: Curves.linear)
                                              // .shimmer(
                                              //     color: providerAriza
                                              //                 .listArizaBodyService[index]
                                              //                 .holat ==
                                              //             "0"
                                              //         ? Colors.red
                                              //         : Colors.blue,
                                              //     delay: const Duration(milliseconds: 3000))
                                              // .elevation(end: 0),
                                              ),
                                        ),
                                ],
                              ),
                              // const SizedBox(height: 5),
                              // MyWidgets.robotoFontText(
                              //     text: "editEdu".tr(),
                              //     textColor: MyColors.appColorBlack()),

                              const SizedBox(height: 20),
                            ],
                          ),
                        )
                  : providerAriza.listArizaBodyService[index].statusCheckPerevod
                              .toString() ==
                          "0"
                      ? const SizedBox.shrink()
                      : providerAriza.listArizaBodyService[index]
                                  .statusCheckPerevod
                                  .toString() ==
                              "1"
                          ? GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                  text: providerAriza
                                      .listArizaBodyService[index].invoice
                                      .toString(),
                                ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        duration: const Duration(seconds: 2),
                                        content: Text(
                                          "${"copy".tr()} ${providerAriza.listArizaBodyService[index].invoice}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        )));
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      MyWidgets.robotoFontText(
                                          text: "numberInvoice".tr(),
                                          textSize: 16),
                                      Row(
                                        children: [
                                          const Icon(Icons.copy, size: 15),
                                          MyWidgets.robotoFontText(
                                              text: providerAriza
                                                  .listArizaBodyService[index]
                                                  .invoice
                                                  .toString()
                                                  .toString(),
                                              textSize: 14),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      MyWidgets.robotoFontText(
                                          text: "holat".tr(), textSize: 16),
                                      providerAriza.listArizaBodyService[index]
                                                  .bitiruvchi
                                                  .toString() ==
                                              "1"
                                          ? const SizedBox.shrink()
                                          : Container(
                                              height: 30,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 5, 10, 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: providerAriza
                                                              .listArizaBodyService[
                                                                  index]
                                                              .holat.toString() !=
                                                          "1"
                                                      ? MyColors.appColorRed()
                                                      : MyColors
                                                          .appColorBlue2()),
                                              child: Center(
                                                  child: MyWidgets.robotoFontText(
                                                      text: providerAriza
                                                                  .listArizaBodyService[
                                                                      index]
                                                                  .pay ==
                                                              "1"
                                                          ? "noPayed".tr()
                                                          : "payed".tr(),
                                                      textColor: MyColors
                                                          .appColorWhite(),
                                                      textFontWeight:
                                                          FontWeight.w600,
                                                      textSize: 15)
                                                  // .animate(
                                                  //     onPlay: (controller) =>
                                                  //         controller.repeat(
                                                  //             reverse: true))
                                                  // .scaleXY(
                                                  //     end: 1,
                                                  //     delay: const Duration(
                                                  //         milliseconds: 3000),
                                                  //     curve: Curves.linear)
                                                  // .shimmer(
                                                  //     color:
                                                  //         providerAriza.listArizaBodyService[index].holat ==
                                                  //                 "0"
                                                  //             ? Colors.red
                                                  //             : Colors.blue,
                                                  //     delay: const Duration(milliseconds: 3000))
                                                  // .elevation(end: 0),
                                                  ),
                                            ),
                                    ],
                                  ),
                                  // const SizedBox(height: 5),
                                  // MyWidgets.robotoFontText(
                                  //     text: "editEdu".tr(),
                                  //     textColor: MyColors.appColorBlack()),

                                  const SizedBox(height: 20),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),

              providerAriza.listArizaBodyService[index].serviceName !=
                      "perevod1".tr()
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          pushNewScreen(context,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                              screen: ArizaEnter(providerAriza: providerAriza));
                        },
                        child: Container(
                          height: 45,
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.appColorBBA()),
                          child: Center(
                              child: MyWidgets.robotoFontText(
                                  text: "viewInformation".tr().toUpperCase(),
                                  textColor: MyColors.appColorWhite(),
                                  textFontWeight: FontWeight.w600,
                                  textSize: 15)),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        providerAriza.listArizaBodyService[index]
                                    .statusCheckPerevod !=
                                "99"
                            ? Text(
                                providerAriza.listArizaBodyService[index].data2
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: providerAriza
                                                .listArizaBodyService[index]
                                                .statusCheckPerevod
                                                .toString() !=
                                            "1"
                                        ? Colors.red
                                        : Colors.black),
                              )
                                .animate(
                                    onPlay: (controller) =>
                                        controller.repeat(reverse: true))
                                .scaleXY(
                                    end: 1,
                                    delay: const Duration(milliseconds: 3000),
                                    curve: Curves.linear)
                                .shimmer(
                                    color: providerAriza
                                                .listArizaBodyService[index]
                                                .holat ==
                                            "0"
                                        ? Colors.white
                                        : Colors.blue,
                                    delay: const Duration(milliseconds: 3000))
                                .elevation(end: 0)
                            : Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: MyColors.appColorBBA(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      "arizaKorishda".tr(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )))),
                        const SizedBox(height: 20),
                        providerAriza.listArizaBodyService[index]
                                    .statusCheckPerevod ==
                                "2"
                            ? Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    pushNewScreen(context,
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                        screen: CheckInformationPerevodga(
                                            serviceName: providerAriza
                                                .listArizaBodyService[index]
                                                .serviceName));
                                  },
                                  child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: MyColors.appColorBBA(),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "perevodQaytaAriza".tr(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                ))
                            : Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: MyColors.appColorBBA(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      "arizaKorishda".tr(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )))),
                      ],
                    ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
        ],
      ),
    ),
  );
}
