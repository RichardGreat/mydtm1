import 'dart:convert';

import "package:collection/collection.dart";
import 'package:flutter/cupertino.dart';
import 'package:mydtm/view/pages/m3_home/service_page/service_page.dart';
import 'package:mydtm/view/pages/m3_home/static_list_for_delete.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:developer';
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
    log(jsonEncode(modelListForDelete));
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

    pushNewScreen(
      context,
      screen: ServicePage(
          status: status,
          serviceId: serviceId,
          category: category,
          categoryName: categoryName),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );

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
