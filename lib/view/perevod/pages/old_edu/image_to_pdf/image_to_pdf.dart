// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/image_to_pdf/image_open.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class ImageToPdf extends StatefulWidget {
  ProviderOldEdu providerOldEdu;

  ImageToPdf({super.key, required this.providerOldEdu});

  @override
  State<ImageToPdf> createState() => _ImageToPdfState();
}

class _ImageToPdfState extends State<ImageToPdf> {
  List<Uint8List> imagesUint8list = [];

  getActionState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    widget.providerOldEdu.listFiles.length > 3 ?{Navigator.of(context).pop()}:{};
    return WillPopScope(
      onWillPop: () async {
        // if (widget.providerOldEdu.listFiles.isNotEmpty) {
        //   await widget.providerOldEdu.createPdfFile(contexts: context);
        // }

        // widget.providerOldEdu
        //     .openFiles(widget.providerOldEdu.fileToServerPerevod!);
        //Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: MyColors.appColorGrey100(),
        appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: MyColors.appColorBlack()),
            backgroundColor: MyColors.appColorGrey100()),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(children: [
              const SizedBox(height: 40),
              widget.providerOldEdu.listFiles.isNotEmpty
                  ? MaterialButton(
                      onPressed: () async {
                        // await widget.providerOldEdu
                        //     .createPdfFile(contexts: context);
                        // widget.providerOldEdu
                        //     .openFiles(widget.providerOldEdu.fileToServerPerevod!);
                        // widget.providerOldEdu.openFiles(pdfFile);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                      height: 45,
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: MyColors.appColorWhite(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("access".tr(),
                              style:
                                  TextStyle(color: MyColors.appColorBlack())),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 20),
              widget.providerOldEdu.listImagesPDF.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: widget.providerOldEdu.listImagesPDF.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Column(
                          children: [
                            const Divider(),
                            Container(
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: MyColors.appColorWhite(),
                                  borderRadius: BorderRadius.circular(10)),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: widget.providerOldEdu.listImagesPDF[index],
                            ),
                            const Divider(),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.clear_sharp),
                                    onPressed: () async {
                                      await widget.providerOldEdu
                                          .deleteItemList(index: index);
                                      setState(() {});
                                    },
                                  )
                                ]),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Center(
                          child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enableDrag: true,
                                  builder: (context) => Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        topLeft: Radius.circular(5),
                                      )),
                                      height: 200,
                                      child: ChooseImagesPerevod(
                                        function: getActionState,
                                        providerOldEdu: widget.providerOldEdu,
                                      )),
                                ).then((value) => (value) {
                                      Navigator.of(context).pop();
                                    });

                                setState(() {});
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    color: MyColors.appColorBlue1(),
                                  ),
                                  const SizedBox(width: 10),
                                  Text("imageDoc".tr(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: MyColors.appColorBlue1())),
                                ],
                              )))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Text(
                  "perevodAllPage".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyColors.appColorBlack(),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.providerOldEdu.listImagesPDF.length >= 3
                ? {
            // Navigator.of(context).pop(),
            }
                : showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enableDrag: true,
                    builder: (context) => Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        )),
                        height: 200,
                        child:
                        widget.providerOldEdu.listImagesPDF.length <= 3?
                        ChooseImagesPerevod(
                          function: getActionState,
                          providerOldEdu: widget.providerOldEdu,
                        ) :const SizedBox.shrink()),
                  ).then((value) => (value) {
                      Navigator.of(context).pop();
                    });
            setState(() {});
          },
          backgroundColor: widget.providerOldEdu.listImagesPDF.length < 3
              ? MyColors.appColorBlue1()
              : MyColors.appColorGrey400(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
