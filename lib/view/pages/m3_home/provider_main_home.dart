import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m3_home/service_list.dart';
import 'package:mydtm/data/internet_connections/person_info/set_lang.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/m3_home/service_page/service_page.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:developer';

class ProviderMainHome extends ChangeNotifier {
  // List<ModelListForDelete> modelListForDelete = [];
  // List<ModelListForDelete> modelListForDeleteSearch = [];
  // List<List<ModelListForDelete>> modelListForDeleteTemp = [];
  // late Map<int, List<ModelListForDelete>> releaseDateMap;

  List<DataServiceList> listDataServiceList = [];
  List<ServiceMainList> listDataServiceListTemp = [];
  List<ServiceMainList> listDataServiceListTemp2 = [];
  var box = Hive.box("online");
  bool boolParseData = false;

  MyColors myColors = MyColors();
  late NetworkServiceList networkServiceList = NetworkServiceList();
  NetworkSetLanguage networkSetLanguage = NetworkSetLanguage();
  String dataLang = "";

  Future setLangUser() async {
    log(box.get("token").toString());
    try{
      if (box.get("token").toString().length > 30) {
        box.get("language") == "1"
            ? {
                dataLang =
                    await networkSetLanguage.setLanguageUser(setLang: "uz")
              }
            : box.get("language") == "2"
                ? {
                    dataLang =
                        await networkSetLanguage.setLanguageUser(setLang: "kk")
                  }
                : {
                    dataLang =
                        await networkSetLanguage.setLanguageUser(setLang: "ru")
                  };
        log(dataLang);
      }
    }catch(e){
      log(e.toString());
    }
  }

  Future getDateService({required BuildContext context}) async {
    boolParseData = false;

    try {
      String dataServiceList = await networkServiceList.getServiceList();
      log(dataServiceList);
      ModelServiceList modelServiceList =
      ModelServiceList.fromJson(jsonDecode(dataServiceList));
      log(jsonEncode(modelServiceList));

      listDataServiceList.addAll(modelServiceList.data);
      for (var value in listDataServiceList) {
        value.service.sort((a, b) => a.sortId);
      }
      listDataServiceListTemp.clear();
      listDataServiceListTemp2.clear();

      for (var val in listDataServiceList) {
        listDataServiceListTemp.addAll(val.service);
        listDataServiceListTemp2.addAll(val.service);
      }

      boolParseData = true;
    } catch (e) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: "DTM",
          desc: "internet bilan aloqani tekshiring",
          titleTextStyle: TextStyle(
              color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
          descTextStyle: TextStyle(
              color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
          btnCancelOnPress: () {
            getDateService(context: context);
            Navigator.of(context).pop();
          },
          btnCancelText: "OK")
          .show();
      log("@@@message");
      log(e.toString());
    }

    // StaticListForDelete staticListForDelete = StaticListForDelete();
    // modelListForDelete.addAll(staticListForDelete.getListDelete());
    // log(jsonEncode(modelListForDelete));
    // modelListForDeleteSearch.clear();
    // modelListForDeleteSearch.addAll(modelListForDelete);
    //
    // modelListForDelete.sort((a, b) => a.category.compareTo(b.category));
    // releaseDateMap =
    //     modelListForDelete.groupListsBy((element) => element.category);
    // modelListForDeleteTemp.addAll(releaseDateMap.values);

    notifyListeners();
  }

  /// Go service page

  Future goServicePage({required BuildContext context,
    required ServiceMainList serviceMainList}) async {
    pushNewScreen(
      context,
      screen: ServicePage(
        serviceMainList: serviceMainList,
      ),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  /// search

  TextEditingController textEditController = TextEditingController();

  Future searchServicesItem({required String searchValue}) async {
    listDataServiceListTemp.clear();

    box.get("language") == "1"
        ? {
      for (var element in listDataServiceListTemp2)
        {
          if (element.serviceName
              .toLowerCase()
              .contains(searchValue.toLowerCase()))
            {
              listDataServiceListTemp.add(element),
            }
        }
    }
        : box.get("language") == "2"
        ? {
      for (var element in listDataServiceListTemp2)
        {
          if (element.serviceNameQQ
              .toLowerCase()
              .contains(searchValue.toLowerCase()))
            {
              listDataServiceListTemp.add(element),
            }
        }
    }
        : {
      for (var element in listDataServiceListTemp2)
        {
          if (element.serviceNameRu
              .toLowerCase()
              .contains(searchValue.toLowerCase()))
            {
              listDataServiceListTemp.add(element),
            }
        }
    };
  }

  Future closeSearchMain() async {
    listDataServiceListTemp.clear();
    for (var val in listDataServiceList) {
      listDataServiceListTemp.addAll(val.service);
    }
    notifyListeners();
  }

///
}
