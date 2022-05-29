import "package:collection/collection.dart";
import 'package:flutter/cupertino.dart';
import 'package:mydtm/view/pages/m3_home/service_page/service_page.dart';
import 'package:mydtm/view/pages/m3_home/static_list_for_delete.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class ProviderMainHome extends ChangeNotifier {

  List<ModelListForDelete> modelListForDelete = [];
  List<ModelListForDelete> modelListForDeleteSearch = [];
  List<List<ModelListForDelete>> modelListForDeleteTemp = [];
  late Map<int, List<ModelListForDelete>> releaseDateMap;
  bool boolParseData = false;
  MyColors myColors = MyColors();

  Future getDateService() async {
    boolParseData = false;
    StaticListForDelete staticListForDelete = StaticListForDelete();
    modelListForDelete.addAll(staticListForDelete.getListDelete());
    modelListForDeleteSearch.clear();
    modelListForDeleteSearch.addAll(modelListForDelete);

    modelListForDelete.sort((a, b) => a.category.compareTo(b.category));
    releaseDateMap =
        modelListForDelete.groupListsBy((element) => element.category);
    modelListForDeleteTemp.addAll(releaseDateMap.values);
    boolParseData = true;
    notifyListeners();
  }

  /// Go service page

  Future goServicePage({required BuildContext context,
    required int category,
    required int serviceId,
    required String categoryName,
    required int status,

  }) async {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) =>
              ServicePage(
                  status: status,
                  serviceId: serviceId,
                  category: category,
                  categoryName: categoryName),
        ));
  }

  /// search

  TextEditingController textEditController = TextEditingController();

  Future searchServicesItem({required String searchValue}) async {
    modelListForDeleteSearch.clear();
    for (var element in modelListForDelete) {
      if (element.name.toLowerCase().contains(searchValue.toLowerCase())) {
        modelListForDeleteSearch.add(element);
      }
    }
  }

  Future closeSearchMain() async {
    modelListForDeleteSearch.clear();
    modelListForDeleteSearch.addAll(modelListForDelete);
    notifyListeners();
  }
  ///
}
