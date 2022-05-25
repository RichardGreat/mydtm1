import 'package:flutter/foundation.dart';
import 'package:mydtm/view/pages/m3_home/static_list_for_delete.dart';
import "package:collection/collection.dart";
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class ProviderMainHome extends ChangeNotifier {

  List<ModelListForDelete> modelListForDelete = [];
  List<List<ModelListForDelete>> modelListForDeleteTemp = [];
  late Map<int, List<ModelListForDelete>> releaseDateMap;
  bool boolParseData = false;
  MyColors myColors = MyColors();

  Future getDateService() async {
    boolParseData = false;
    StaticListForDelete staticListForDelete = StaticListForDelete();
    modelListForDelete.addAll(staticListForDelete.getListDelete());
    modelListForDelete.sort((a, b) => a.category.compareTo(b.category));
    releaseDateMap =
        modelListForDelete.groupListsBy((element) => element.category);
    modelListForDeleteTemp.addAll(releaseDateMap.values);
    boolParseData = true;
    notifyListeners();

  }
}
