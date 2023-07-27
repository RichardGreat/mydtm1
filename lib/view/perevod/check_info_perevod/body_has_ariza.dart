import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mydtm/view/perevod/check_info_perevod/provider_check_perevod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyHasArizaPerevod({required BuildContext context,
  required ProviderCheckInfoPerevod providerCheckInfoPerevod}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 5),
        Text(
          "perevod1".tr(),
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
                text: providerCheckInfoPerevod.modelGetArizaPerevod.abitur
                    .psId.toString(),
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
                text: providerCheckInfoPerevod.modelGetArizaPerevod.abitur
                    .lname + " " +
                    providerCheckInfoPerevod.modelGetArizaPerevod.abitur.fname,
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4,
              child: MyWidgets.robotoFontText(
                  text: "saveDateTime".tr(), textSize: 16),
            ),
            MyWidgets.robotoFontText(
                text: providerCheckInfoPerevod.modelGetArizaPerevod.abitur
                    .updatedAt
                    .toString()
                    .substring(0, 16),
                textSize: 14),
          ],
        ),
        const SizedBox(height: 15),

        /// TO'LOV

        providerCheckInfoPerevod.modelGetArizaPerevod.abitur.checkStatus == 2?
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(
              text: providerCheckInfoPerevod.modelGetArizaPerevod
                  .abitur.invoice
                  .toString(),
            ));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 2),
                content: Text(
                  "${"copy".tr()} ${providerCheckInfoPerevod
                      .modelGetArizaPerevod
                      .abitur.invoice}",
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
                          text: providerCheckInfoPerevod.modelGetArizaPerevod
                              .abitur.invoice
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

                  Container(
                    height: 30,
                    padding: const EdgeInsets.fromLTRB(
                        10, 5, 10, 5),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(10),
                        color: providerCheckInfoPerevod.modelGetArizaPerevod
                            .abitur
                            .pay.toString() ==
                            "0"
                            ? MyColors.appColorRed()
                            : MyColors.appColorBlue2()),
                    child: Center(
                      child: MyWidgets.robotoFontText(
                          text: providerCheckInfoPerevod.modelGetArizaPerevod
                              .abitur.pay == 0
                              ? "noPayed".tr()
                              : "payed".tr(),
                          textColor: MyColors
                              .appColorWhite(),
                          textFontWeight:
                          FontWeight.w600,
                          textSize: 15)
                          .animate(
                          onPlay: (controller) =>
                              controller.repeat(
                                  reverse: true))
                          .scaleXY(
                          end: 1,
                          delay: const Duration(
                              milliseconds: 3000),
                          curve: Curves.linear)
                          .shimmer(
                          color: providerCheckInfoPerevod.modelGetArizaPerevod

                              .status.toString() ==
                              "0"
                              ? Colors.red
                              : Colors.blue,
                          delay: const Duration(milliseconds: 3000))
                          .elevation(end: 0),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ):
        const SizedBox(height: 1),

      Column(
          children: [
            providerCheckInfoPerevod.modelGetArizaPerevod.abitur.checkStatus.toString() != "0" ?
            Text(

              providerCheckInfoPerevod.modelGetArizaPerevod.abitur.comments
                  .toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: providerCheckInfoPerevod.modelGetArizaPerevod.abitur.checkStatus
                      .toString() !=
                      "2"
                      ? Colors.red
                      : Colors.black),
            )
                : Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: MyColors.appColorBBA(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                              "arizaKorishda".tr(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),
                    const SizedBox(height: 20),
                    Text(

                      providerCheckInfoPerevod.modelGetArizaPerevod.abitur.comments
                          .toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: providerCheckInfoPerevod.modelGetArizaPerevod.abitur.checkStatus
                              .toString() !=
                              "2"
                              ? Colors.red
                              : Colors.black),
                    )
                  ],
                )),

            const SizedBox(height: 20),
            providerCheckInfoPerevod.modelGetArizaPerevod.abitur.checkStatus.toString() == "1" ?
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: MyColors.appColorBBA(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                          "perevodQaytaAriza".tr(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ))))
                : const SizedBox.shrink(),
          ],
        ),
      ],
    ),
  );
}
