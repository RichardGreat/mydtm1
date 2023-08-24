// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/check_version.dart';
import 'package:mydtm/data/internet_connections/m3_home/internet_get_slider.dart';
import 'package:mydtm/data/internet_connections/m3_home/service_list.dart';
import 'package:mydtm/data/internet_connections/person_info/set_lang.dart';
import 'package:mydtm/data/model_parse/m3_home/model_get_slider.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/data/model_parse/model_check_mobile_version.dart';
import 'package:mydtm/view/pages/m3_home/service_page/service_page.dart';
import 'package:mydtm/view/pages/update_page/upadate_must.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool boolErrorHandle = false;

  MyColors myColors = MyColors();
  late NetworkServiceList networkServiceList = NetworkServiceList();
  NetworkSetLanguage networkSetLanguage = NetworkSetLanguage();
  String dataLang = "";
  late DataCheckMobileVersion dataCheckMobileVersion;
  String numberAPIUpdate = "";

  Future checkVersion({required BuildContext context}) async {
    boolParseData = false;
    boolErrorHandle = false;
    notifyListeners();
    try {
      String dataVersion = await NetworkCheckVersions.checkMobileVersion();
      ModelCheckMobileVersion modelCheckMobileVersion =
          ModelCheckMobileVersion.fromJson(jsonDecode(dataVersion));
      numberAPIUpdate = modelCheckMobileVersion.data.numberApi.toString();

      ///1005
      if (box.get("updateVersion").toString() !=
          modelCheckMobileVersion.data.version.toString()) {
        if (modelCheckMobileVersion.data.status.toString() == "1") {
        } else if (modelCheckMobileVersion.data.status.toString() == "2") {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.noHeader,
                  animType: AnimType.bottomSlide,
                  dismissOnBackKeyPress: false,
                  title: "BBA",
                  desc: box.get("language").toString() == "1"
                      ? modelCheckMobileVersion.data.versionText
                      : box.get("language").toString() == "2"
                          ? modelCheckMobileVersion.data.versionTextQq
                          : box.get("language").toString() == "3"
                              ? modelCheckMobileVersion.data.versionTextRu
                              : "update",
                  titleTextStyle: TextStyle(
                      color: MyColors.appColorBlue1(),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  descTextStyle: TextStyle(
                      color: MyColors.appColorBlack(),
                      fontWeight: FontWeight.bold),
                  btnCancelOnPress: () {
                    openGooglePlayMarket();
                  },
                  btnCancelText: "OK",
                  btnCancelColor: MyColors.appColorBlue1())
              .show();
        } else if (modelCheckMobileVersion.data.status.toString() == "3") {
          box.put("updateMobileText", modelCheckMobileVersion.data.versionText);

          pushNewScreen(context,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
              screen: const UpdateMust(),
              withNavBar: false);
        }
      }
      boolParseData = true;
      boolErrorHandle = false;
      notifyListeners();
    } catch (e) {
      // log(e.toString());
      boolParseData = true;
      boolErrorHandle = true;
      AwesomeDialog(
              context: context,
              dialogType: DialogType.noHeader,
              animType: AnimType.bottomSlide,
              title: "BBA",
              dismissOnTouchOutside: false,
              desc: "noServerConnection".tr(),
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
              btnCancelOnPress: () {
                // getDateService(context: context);
                if (Platform.isIOS) {
                  // getDateService(context: context);
                  exit(0);
                } else {
                  // getDateService(context: context);
                  SystemNavigator.pop();
                }
                Navigator.of(context).pop();
              },
              btnCancelText: "OK")
          .show();
      notifyListeners();
    }
  }

  final Uri _url =
      Uri.parse('https://play.google.com/store/apps/details?id=www.uzbmba.uz');

  Future openGooglePlayMarket() async {
    try {
      if (!await launchUrl(_url)) throw 'Could not launch $_url';
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future setLangUser() async {
    log(box.get("token").toString());
    try {
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
    } catch (e) {
      log(e.toString());
    }
  }

  late ModelServiceList modelServiceList;

  /// slider qo'shimcha
  NetworkGetSlider networkGetSlider = NetworkGetSlider();
  List<ModelGetSlider> listModelGetSlider = [];
  List<Uri> listUri = [];

  Future getDateService({required BuildContext context}) async {
    try {
      if (box.get("numberApi").toString().trim() !=
          numberAPIUpdate.toString().trim()) {
        String dataServiceList = await networkServiceList.getServiceList();
        // log(dataServiceList);
        box.put("dataServiceList", dataServiceList);
        box.put("numberApi", numberAPIUpdate);
        // log("Download 777");
        // log(box.get("numberApi"));
        // log("####");
      }
      try {
        String getSlider = await networkGetSlider.getSlider();
        log("@@@");
        log(jsonDecode(getSlider).toString());
        listModelGetSlider = (jsonDecode(jsonDecode(getSlider)) as List)
            .map((e) => ModelGetSlider.fromJson(e))
            .toList();
        listModelGetSlider.sort((a, b) => a.ves.compareTo(b.ves));
        notifyListeners();
      } catch (e) {
        log(e.toString());
      }

      modelServiceList =
          ModelServiceList.fromJson(jsonDecode(box.get("dataServiceList")));
      listDataServiceList.addAll(modelServiceList.data);
      for (int i = 0; i < listModelGetSlider.length; i++) {
        listModelGetSlider[i].status.toString() == "1"
            ? listDataServiceList[0].service.add(
                  ServiceMainList(
                      id: (int.parse(listModelGetSlider[i].id.toString()) *
                              100000)
                          .toString(),
                      serviceName: listModelGetSlider[i].description.toString(),
                      serviceText: listModelGetSlider[i].description.toString(),
                      serviceTextRu:
                          listModelGetSlider[i].description.toString(),
                      serviceTextQQ:
                          listModelGetSlider[i].description.toString(),
                      serviceNameRu:
                          listModelGetSlider[i].description.toString(),
                      serviceNameQQ:
                          listModelGetSlider[i].description.toString(),
                      status: listModelGetSlider[i].status.toString() == "1"
                          ? true
                          : false,
                      mobilIcon: listModelGetSlider[i].imageUrl.toString(),
                      link: listModelGetSlider[i].link.toString(),
                      icon: listModelGetSlider[i].imageUrl.toString(),
                      catId: "",
                      cod: "",
                      sortId: listModelGetSlider[i].ves.toString(),
                      createdAt: "",
                      updatedAt: "",
                      deleted: "0"),
                )
            : {};
      }
      listDataServiceList.add(DataServiceList(
          id: "999",
          categoryName: "Davlat xizmatlari (my.gov.uz)",
          categoryNameRu: "Государственные услуги (my.gov.uz)",
          categoryNameQQ: "Gosudarstvennie uslugi (my.gov. uz)",
          service: [
            ServiceMainList(
                id: "8000000",
                serviceName:
                    "Oliy ta'lim muassasalarining bakalavriat ta'lim yo'nalishilariga qabul qilish bo'yicha test sinovlarini o'tkazish",
                serviceText:
                    "Oliy ta'lim muassasalarining bakalavriat ta'lim yo'nalishilariga qabul qilish bo'yicha test sinovlarini o'tkazish",
                serviceTextRu:
                    "Oliy ta'lim muassasalarining bakalavriat ta'lim yo'nalishilariga qabul qilish bo'yicha test sinovlarini o'tkazish",
                serviceTextQQ:
                    "Oliy ta'lim muassasalarining bakalavriat ta'lim yo'nalishilariga qabul qilish bo'yicha test sinovlarini o'tkazish",
                serviceNameRu:
                    "Oliy ta'lim muassasalarining bakalavriat ta'lim yo'nalishilariga qabul qilish bo'yicha test sinovlarini o'tkazish",
                serviceNameQQ:
                    "Oliy ta'lim muassasalarining bakalavriat ta'lim yo'nalishilariga qabul qilish bo'yicha test sinovlarini o'tkazish",
                status: true,

                mobilIcon: "mobilIcon",
                link: "https://my.gov.uz/oz/service/259",
                icon: "",
                catId: "2023",
                cod: "1",
                sortId: "1",
                createdAt: "2023",
                updatedAt: "2023",
                deleted: "0"),
            ServiceMainList(
                id: "8000001",
                serviceName: "Chet tilini bilish darajasini aniqlash",
                serviceText: "Chet tilini bilish darajasini aniqlash",
                serviceTextRu: "Chet tilini bilish darajasini aniqlash",
                serviceTextQQ: "Chet tilini bilish darajasini aniqlash",
                serviceNameRu: "Chet tilini bilish darajasini aniqlash",
                serviceNameQQ: "Chet tilini bilish darajasini aniqlash",
                status: true,
                mobilIcon: "",
                link: "https://my.gov.uz/oz/service/559",
                icon: "",
                catId: "2023",
                cod: "2",
                sortId: "2",
                createdAt: "2023",
                updatedAt: "2023",
                deleted: "0"),
            ServiceMainList(
                id: "8000002",
                serviceName:
                    "Xorijiy davlatda ta'lim olganlik to'g'risidagi hujjatni tan olish va nostrifikatsiyalash(ekvivalentligini qayd etish)",
                serviceText:
                    "Xorijiy davlatda ta'lim olganlik to'g'risidagi hujjatni tan olish va nostrifikatsiyalash(ekvivalentligini qayd etish)",
                serviceTextRu:
                    "Xorijiy davlatda ta'lim olganlik to'g'risidagi hujjatni tan olish va nostrifikatsiyalash(ekvivalentligini qayd etish)",
                serviceTextQQ:
                    "Xorijiy davlatda ta'lim olganlik to'g'risidagi hujjatni tan olish va nostrifikatsiyalash(ekvivalentligini qayd etish)",
                serviceNameRu:
                    "Xorijiy davlatda ta'lim olganlik to'g'risidagi hujjatni tan olish va nostrifikatsiyalash(ekvivalentligini qayd etish)",
                serviceNameQQ:
                    "Xorijiy davlatda ta'lim olganlik to'g'risidagi hujjatni tan olish va nostrifikatsiyalash(ekvivalentligini qayd etish)",
                status: true,
                mobilIcon: "",
                link: "https://my.gov.uz/oz/service/210",
                icon: "",
                catId: "2023",
                cod: "3",
                sortId: "3",
                createdAt: "2023",
                updatedAt: "2023",
                deleted: "0"),
            ServiceMainList(
                id: "8000003",
                serviceName:
                    "Yuridik texnikumlarga kirish test sinovlarini o'tkazish davlat xizmati",
                serviceText:
                    "Yuridik texnikumlarga kirish test sinovlarini o'tkazish davlat xizmati",
                serviceTextRu:
                    "Yuridik texnikumlarga kirish test sinovlarini o'tkazish davlat xizmati",
                serviceTextQQ:
                    "Yuridik texnikumlarga kirish test sinovlarini o'tkazish davlat xizmati",
                serviceNameRu:
                    "Yuridik texnikumlarga kirish test sinovlarini o'tkazish davlat xizmati",
                serviceNameQQ:
                    "Yuridik texnikumlarga kirish test sinovlarini o'tkazish davlat xizmati",
                status: true,
                mobilIcon: "",
                link: "https://my.gov.uz/oz/service/493",
                icon: "",
                catId: "2023",
                cod: "4",
                sortId: "4",
                createdAt: "2023",
                updatedAt: "2023",
                deleted: "0"),
          ]));
      listUri.clear();
      for (int i = 0; i < listDataServiceList[0].service.length; i++) {
        listUri.add(Uri.parse(listDataServiceList[0].service[i].link));
      }

      listDataServiceListTemp.clear();
      listDataServiceListTemp2.clear();

      for (var val in listDataServiceList) {
        listDataServiceListTemp.addAll(val.service);
        listDataServiceListTemp2.addAll(val.service);
      }

      boolParseData = true;
      boolErrorHandle = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      boolParseData = true;
      boolErrorHandle = true;
      notifyListeners();
      AwesomeDialog(
              context: context,
              dialogType: DialogType.noHeader,
              animType: AnimType.bottomSlide,
              title: "BBA",
              dismissOnTouchOutside: false,
              desc: "noServerConnection".tr(),
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
              btnCancelOnPress: () {
                // getDateService(context: context);
                if (Platform.isIOS) {
                  // getDateService(context: context);
                  exit(0);
                } else {
                  // getDateService(context: context);
                  SystemNavigator.pop();
                }
                Navigator.of(context).pop();
              },
              btnCancelText: "OK")
          .show();
    }
  }

  /// Go service page

  Future goServicePage(
      {required BuildContext context,
      required ServiceMainList serviceMainList}) async {
    pushNewScreen(
      context,
      screen: ShowCaseWidget(
        builder: Builder(
          builder: (context) => ServicePage(
            serviceMainList: serviceMainList,
          ),
        ),
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
                  {listDataServiceListTemp.add(element)}
              }
          }
        : box.get("language") == "2"
            ? {
                for (var element in listDataServiceListTemp2)
                  {
                    if (element.serviceNameQQ
                        .toLowerCase()
                        .contains(searchValue.toLowerCase()))
                      {listDataServiceListTemp.add(element)}
                  }
              }
            : {
                for (var element in listDataServiceListTemp2)
                  {
                    if (element.serviceNameRu
                        .toLowerCase()
                        .contains(searchValue.toLowerCase()))
                      {listDataServiceListTemp.add(element)}
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
