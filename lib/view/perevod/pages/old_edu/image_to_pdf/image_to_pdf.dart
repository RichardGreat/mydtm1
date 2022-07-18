import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/image_to_pdf/image_open.dart';
import 'package:mydtm/view/perevod/pages/old_edu/image_to_pdf/provider_image_to_pdf.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class ImageToPdf extends StatefulWidget {
  const ImageToPdf({Key? key}) : super(key: key);

  @override
  State<ImageToPdf> createState() => _ImageToPdfState();
}

class _ImageToPdfState extends State<ImageToPdf> {
  List<Uint8List> imagesUint8list = [];
  ProviderImageToPDF providerImageToPDF = ProviderImageToPDF();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => providerImageToPDF,
        child: Consumer<ProviderImageToPDF>(builder: (context, value, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(children: [
                const SizedBox(height: 60),
                MaterialButton(
                  onPressed: () {
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
                            providerImageToPDF: providerImageToPDF,
                          )),
                    );
                  },
                  child: Text("Choose"),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: providerImageToPDF.listImagesPDF.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        const Divider(),
                        SizedBox(
                          height: 400,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: providerImageToPDF.listImagesPDF[index],
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 45,
                child: MaterialButton(onPressed: () async{
                  final pdfFile = await providerImageToPDF.createPdfFile(contexts: context);
                  providerImageToPDF.openFiles(pdfFile);

                }, child: Text("TOPDF"),),
                )

              ]),
            ),
          );
        }));
  }
}
