import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ProviderCertificate extends ChangeNotifier{


  bool imageChange = true;
  var box = Hive.box("online");
  Future changeImage(
      {required dynamic imageData, required String fileTypeName}) async {
    imageChange = false;
    box.delete("image");
    box.delete("imageServer");
    box.put("image", imageData!.replaceAll("\n", ""));
    box.put("imageServer",
        "image:data:image/$fileTypeName;base64, ${imageData!.replaceAll("\n", "")}");
    await Future.delayed(const Duration(milliseconds: 400)).then((value) {
      imageChange = true;
    });
    notifyListeners();
  }
  // Future showImage(
  //     {required BuildContext context,
  //       required ProviderCertificate providerCertificate}) async {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //           shape: const RoundedRectangleBorder(
  //               borderRadius: BorderRadius.only(
  //                 topRight: Radius.circular(5),
  //                 topLeft: Radius.circular(5),
  //               )),
  //           actions: [
  //             Container(
  //                 width: MediaQuery.of(context).size.width,
  //                 height: MediaQuery.of(context).size.height * 0.5,
  //                 decoration: const BoxDecoration(
  //                     borderRadius: BorderRadius.only(
  //                       topRight: Radius.circular(5),
  //                       topLeft: Radius.circular(5),
  //                     )),
  //                 child: DataTimePic(
  //                     providerCertificate: providerCertificate))
  //           ]));
  // }

}