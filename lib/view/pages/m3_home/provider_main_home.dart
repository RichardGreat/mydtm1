import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/check_version.dart';
import 'package:mydtm/data/internet_connections/m3_home/service_list.dart';
import 'package:mydtm/data/internet_connections/person_info/set_lang.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/data/model_parse/model_check_mobile_version.dart';
import 'package:mydtm/view/pages/m3_home/service_page/service_page.dart';
import 'package:mydtm/view/pages/update_page/upadate_must.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
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

  MyColors myColors = MyColors();
  late NetworkServiceList networkServiceList = NetworkServiceList();
  NetworkSetLanguage networkSetLanguage = NetworkSetLanguage();
  String dataLang = "";
  late DataCheckMobileVersion dataCheckMobileVersion;

  Future checkVersion({required BuildContext context}) async {
    boolParseData = false;
    notifyListeners();
    try {
      String dataVersion = await NetworkCheckVersions.checkMobileVersion();
      ModelCheckMobileVersion modelCheckMobileVersion =
          ModelCheckMobileVersion.fromJson(jsonDecode(dataVersion));

      log(jsonEncode(modelCheckMobileVersion).toString());
      ///1004
      if(box.get("updateVersion").toString() != modelCheckMobileVersion.data.version.toString()
      ) {

        if (modelCheckMobileVersion.data.status.toString() == "1") {

        } else if (modelCheckMobileVersion.data.status.toString() == "2") {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.NO_HEADER,
                  animType: AnimType.BOTTOMSLIDE,
                  dismissOnBackKeyPress: false,
                  title: "DTM",
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
          // ignore: use_build_context_synchronously
          pushNewScreen(context,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
              screen: UpdateMust(), withNavBar: false);
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
  final Uri _url = Uri.parse('https://play.google.com/store/apps/details?id=www.my_dtm.uz');
  Future openGooglePlayMarket()async{
    try{
      if (!await launchUrl(_url)) throw 'Could not launch $_url';
    }catch(e){}
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

  Future getDateService({required BuildContext context}) async {
    try {
      String dataServiceList = await networkServiceList.getServiceList();

      ModelServiceList modelServiceList =
          ModelServiceList.fromJson(jsonDecode(dataServiceList));
      // log(jsonEncode(modelServiceList));

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
      notifyListeners();
    } catch (e) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: "DTM",
              dismissOnTouchOutside: false,
              desc: "noInternetConn".tr(),
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
              btnCancelOnPress: () {
                // getDateService(context: context);
                if (Platform.isIOS) {
                  exit(0);
                } else {
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
