import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:mydtm/view/pages/m3_home/static_list_for_delete.dart';

class ProviderMainHome extends ChangeNotifier {
  List<ModelListForDelete> modelListForDelete = [];

  final List<List<ModelListForDelete>> modelListListForDelete = [];
  List<List<ModelListForDelete>> modelListForDeleteTemp = [];
  int listHeightCount = 1;

  Future getDateService() async {
    StaticListForDelete staticListForDelete = StaticListForDelete();
    modelListForDelete.addAll(staticListForDelete.getListDelete());

    for (int i = 1; i < modelListForDelete.length; i++) {
      if (modelListForDelete[i - 1].category !=
          modelListForDelete[i].category) {
        listHeightCount += 1;
        modelListForDeleteTemp.add([]);

      }

      log(jsonEncode(modelListForDeleteTemp));

      int counter = 0;
      /// modelListForDeleteTemp xar bir itemListiga alohida qo'shaman
      /// keyin oxirida addAll ishlataman
      ///
      for (int i = 0; i < modelListForDelete.length; i++) {
        if (modelListForDelete[i - 1].category != modelListForDelete[i].category) {
          if (modelListForDeleteTemp.isEmpty) {
            modelListForDeleteTemp[counter].add(modelListForDelete[i - 1]);
          }
          // modelListListForDelete.add(modelListForDeleteTemp);
          log("jsonEncode(modelListListForDelete)");
          // modelListForDeleteTemp.clear();
        } else {
          // modelListForDeleteTemp.add(modelListForDelete[i - 1]);
        }
      }
    }

// try{
//   for (int i = 0; i < modelListListForDelete.length; i++) {
//     print(jsonEncode(modelListListForDelete[i]).toString());
//   }
// }catch(e){
//   print(e.toString());
// }
  }
}
