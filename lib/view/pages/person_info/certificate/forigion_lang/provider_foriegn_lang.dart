import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/widgets/model_botton_sheet.dart';

class ProviderForeignLang extends ChangeNotifier {
  bool imageChange = true;
  var box = Hive.box("online");

  addImageForeign(
      {required BuildContext context,
      required ProviderForeignLang providerForeignLang}) {
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
          child: ChooseImageForeignLang(providerForeignLang: providerForeignLang)),
    );
  }

  Future changeImageForeign(
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
}
