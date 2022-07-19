import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/image_to_pdf/image_open.dart';
import 'package:mydtm/view/perevod/pages/old_edu/image_to_pdf/provider_image_to_pdf.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
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
            backgroundColor: MyColors.appColorGrey100(),
            appBar: AppBar(elevation: 0, iconTheme: IconThemeData(color: MyColors.appColorBlack()), backgroundColor: MyColors.appColorGrey100()),
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(children: [
                  const SizedBox(height: 40),
                  providerImageToPDF.listFiles.isNotEmpty ?

                  MaterialButton(
                    onPressed: () async {
                      final pdfFile = await providerImageToPDF.createPdfFile(contexts: context);
                      providerImageToPDF.openFiles(pdfFile);
                    },
                    height: 45,
                    minWidth: MediaQuery.of(context).size.width*0.9,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    color: MyColors.appColorWhite(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        Text("access".tr(), style: TextStyle(color: MyColors.appColorBlack())),
                      ],
                    ),
                  )
                      :const SizedBox.shrink(),
                  const SizedBox(height: 20),
                  providerImageToPDF.listFiles.isNotEmpty ?
                  Expanded(
                    child:

                    ListView.builder(
                      itemCount: providerImageToPDF.listImagesPDF.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Column(
                        children: [
                          const Divider(),

                          Container(
                            margin:const EdgeInsets.all(2),
                            decoration: BoxDecoration(color: MyColors.appColorWhite(), borderRadius: BorderRadius.circular(10)),
                            height: MediaQuery.of(context).size.height*0.2,
                            width: MediaQuery.of(context).size.width * 0.28,
                            child: providerImageToPDF.listImagesPDF[index],
                          ),
                          const Divider(),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:[
                                IconButton(icon: Icon(Icons.clear_sharp), onPressed: (){providerImageToPDF.deleteItemList(index: index);},)
                              ]),
                        ],
                      ),
                    ),
                  )
                  :
                      Expanded(child: Center(child:GestureDetector(onTap: (){
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Icon(Icons.add_circle, color: MyColors.appColorBlue1(),),
                        const SizedBox(width: 10),
                        Text("imageDoc".tr(), style: TextStyle(fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: MyColors.appColorBlue1())),],)
                      )))
                  ,
                  SizedBox(height: MediaQuery.of(context).size.height*0.2,
                  child: Text("perevodAllPage".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: MyColors.appColorBlack(), fontSize: 18, fontWeight: FontWeight.w500),),
                  ),
                ]),
              ),
            ),
            floatingActionButton: FloatingActionButton(

                onPressed: (){
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
              backgroundColor: MyColors.appColorBlue1(),

              child: const Icon(Icons.add),
            ),
          );
        }));
  }
}
