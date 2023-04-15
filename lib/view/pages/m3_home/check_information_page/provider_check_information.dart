import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m4_ariza/qayd_varaqa.dart';
import 'package:mydtm/data/internet_connections/person_info/check_user_info/check_user_info.dart';
import 'package:mydtm/data/internet_connections/person_info/privilege_check/privillege_check.dart';
import 'package:mydtm/data/model_parse/m4_qayd_var/downloads.dart';
import 'package:mydtm/data/model_parse/person_info/check_user_info.dart';
import 'package:mydtm/data/model_parse/person_info/privilege_model/privilege_model1.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/aferta.dart';
import 'package:mydtm/view/pages/person_info/address_info/adress_info.dart';
import 'package:mydtm/view/pages/person_info/certificate/certificates.dart';
import 'package:mydtm/view/pages/person_info/gradueted/graduetid.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_information.dart';
import 'package:mydtm/view/pages/person_info/privillage/privillage.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderCheckInformation extends ChangeNotifier
{


  List<ModelCheckInformationForDelete> myList = [
    ModelCheckInformationForDelete(
      id: 1,
      name: "personInformation".tr(),
    ),
    ModelCheckInformationForDelete(
      id: 2,
      name: "addressAlways".tr(),
    ),
    ModelCheckInformationForDelete(
      id: 3,
      name: "schoolInfo".tr(),
    ),
    ModelCheckInformationForDelete(
      id: 4,
      name: "certificates".tr(),
    ),
    ModelCheckInformationForDelete(
      id: 5,
      name: "privileges".tr(),
    ),
    ModelCheckInformationForDelete(
      id: 6,
      name: "chooseDirection".tr(),
    ),
  ];
  NetworkCheckUserInfo networkCheckUserInfo = NetworkCheckUserInfo();
  late ModelCheckUserInfo modelCheckUserInfo;
  bool boolCheckUserInfo = false;
  var box = Hive.box("online");

  Future getInfoUser() async {
    try {
      boolCheckUserInfo = false;
      String dataCheckInfo = await networkCheckUserInfo.getUserInfo(
          phoneNumber: box.get("phoneNumber"));
      log(dataCheckInfo);
      modelCheckUserInfo =
          ModelCheckUserInfo.fromJson(jsonDecode(dataCheckInfo));

      boolCheckUserInfo = true;
      notifyListeners();
    } catch (e) {}
    // https://api.dtm.uz/v1/imtiyoz/check-data?imie=30309975270036
  }

  final Uri _url = Uri.parse("https://lex.uz/docs/-4396419");

  Future checkInfo(
      {required int index,
      required BuildContext context,
      required ProviderCheckInformation providerCheckInformation,
      required Function func}) async {

    if (modelCheckUserInfo.person) {
      if (index == 0) {
        pushNewScreen(
          context,
          screen: PersonInformation(funcState: func, idFunction: "0", windowIdPassport: "0"),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      } else if (modelCheckUserInfo.personAddress) {
        if (index == 1) {
          pushNewScreen(
            context,
            screen: AddressInfo(funcState: func, addressWindowId: "0"),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }
        if (modelCheckUserInfo.personGeneralEdu) {
          if (index == 2) {
            pushNewScreen(
              context,
              screen: Graduated(funcState: func, windowIdGraduated: "0" ),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (index == 3) {
            pushNewScreen(
              context,
              screen: Certificates(funcState: func),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (index == 4) {
            pushNewScreen(
              context,
              screen: Privilege(funcState: func),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (index == 5) {
            // infoAferta(context: context, function: func);
            inFoAferta(
                context: context,
                function: func,
                providerCheckInformation: providerCheckInformation);
          }
        } else {
          if (index == 2) {
            pushNewScreen(
              context,
              screen: Graduated(funcState: func, windowIdGraduated: "0"),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else {
            MyWidgets.awesomeDialogError(
                context: context, valueText: "eduEndSchool".tr());
          }
        }
      } else {
        if (index == 1) {
          pushNewScreen(
            context,
            screen: AddressInfo(funcState: func,  addressWindowId: "0"),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        } else {
          MyWidgets.awesomeDialogError(
              context: context, valueText: "addressFillInfo".tr());
        }
      }
    } else {
      if (index == 0) {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.noHeader,
            animType: AnimType.bottomSlide,
            body: GestureDetector(
              onTap: () {
                _launchInBrowser(_url);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Text("personalInfoAccess".tr(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      color: MyColors.appColorBlue1(),
                    )),
              ),
            ),
            titleTextStyle: TextStyle(
                color: MyColors.appColorBlue1(),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            descTextStyle: TextStyle(
                color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
            btnOkOnPress: () {
              pushNewScreen(
                context,
                screen: PersonInformation(funcState: func, idFunction: "0", windowIdPassport: "0"),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            btnOkText: "iAgree".tr(),
            btnOkColor: MyColors.appColorBlue1(),
            btnCancel: MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: MyColors.appColorWhite(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "notAgree".tr(),
                style: TextStyle(color: MyColors.appColorBlack()),
              ),
            )).show();
      } else {
        MyWidgets.awesomeDialogError(
            context: context, valueText: "passportFillInfo".tr());
      }
    }
  }

  bool boolAfertaButton = false;

  Future getButtonColor({required bool myBool}) async {
    boolAfertaButton = myBool;
    // notifyListeners();
  }

  Future<void> inFoAferta({
    required BuildContext context,
    required Function function,
    required ProviderCheckInformation providerCheckInformation,
  }) async {
    return //AwesomeDialog(
        //   context: context,
        //   dialogType: DialogType.noHeader,
        //   animType: AnimType.bottomSlide,
        //   title: "requestExamTest".tr(),
        //   body: GestureDetector(
        //     onTap: () {
        //       // _launchInBrowser(_url);
        //     },
        //     child: Column(
        //       children: [
        //         const SizedBox(height: 10),
        //         Text("requestExamTest".tr(),
        //             textAlign: TextAlign.center,
        //             style: const TextStyle(
        //               fontWeight: FontWeight.w600,
        //             )),
        //         Container(
        //           padding: EdgeInsets.all(8),
        //           height: MediaQuery.of(context).size.height * 0.75,
        //           child: ListView.builder(
        //               itemCount: 2,
        //               itemBuilder: (context, index) {
        //                 if (index == 0) {
        //                   boolAfertaButton = false;
        //                   return Text(myAfertaList[index]);
        //                 } else {
        //                   boolAfertaButton = true;
        //                   notifyListeners();
        //                   return const SizedBox.shrink();
        //                 }
        //               }),
        //         ),
        //       ],
        //     ),
        //   ),
        //   titleTextStyle: TextStyle(
        //       color: MyColors.appColorBlue1(),
        //       fontWeight: FontWeight.bold,
        //       fontSize: 20),
        //   descTextStyle: TextStyle(
        //       color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
        //   btnOkOnPress: () {
        //     // pushNewScreen(
        //     //   context,
        //     //   screen: PersonInformation(funcState: func),
        //     //   withNavBar: false,
        //     //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
        //     // );
        //   },
        //   btnOkText: "iAgree".tr(),
        //   btnOkColor: boolAfertaButton
        //       ? MyColors.appColorBlue1()
        //       : Colors.blue.withOpacity(0.3),
        // ).show();
        showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 10),
            Text("requestExamTest".tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                )),
          ]),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Aferta(
                providerCheckInformation: providerCheckInformation,
                function: function),
          ),
        );
      },
    );
  }

  // final Uri urls = Uri.parse("https://lex.uz/docs/-4396419");
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }


  NetworkPrivilege networkPrivilege = NetworkPrivilege();
  List<DataCheckPrivilege> listCheckPrivilege = [];
  bool boolGetDataPrivilege = false;
  bool boolPrivilegeNot = false;

  Future getPrivilege()async{
    try{
      boolGetDataPrivilege = false;
      String dataPrivilege = await networkPrivilege.getPrivilege();
      ModelCheckPrivilege modelCheckPrivilege = ModelCheckPrivilege.fromJson(jsonDecode(dataPrivilege));
      listCheckPrivilege = modelCheckPrivilege.data;
      boolGetDataPrivilege = true;
      notifyListeners();
    }catch(e){

      boolPrivilegeNot = true;
      boolGetDataPrivilege = true;
      notifyListeners();
      log(e.toString());
    }

  }

  NetworkDownloadsQaydVaraqa networkDownloadsQaydVaraqa = NetworkDownloadsQaydVaraqa();
  late ModelGetDownloads modelGetDownloadsData1;
  late DataGetDownloads modelGetDownloads1;
  bool boolDataDownload1 = false;
  Future getQaydVaraqa2()async{
    try {
      boolDataDownload1 = false;
      String dataDownloads = await networkDownloadsQaydVaraqa.getCheckDownloads();
      modelGetDownloadsData1 =
          ModelGetDownloads.fromJson(jsonDecode(dataDownloads));
      modelGetDownloads1 = modelGetDownloadsData1.data;
      boolDataDownload1 = true;
      notifyListeners();
      log(modelGetDownloadsData1.data.src);
    }catch(e){
      modelGetDownloadsData1.status = 0;
      log(e.toString());}

  }
  Future openFile({required String url, required String fileName})async{
    try{
      final file = await downloadFile(url: url, name: fileName);
      if (file == null) return;

      OpenFile.open(file.path);
    }catch(e){
      log(e.toString());
    }
  }

  Future<File?> downloadFile({required String url, required String name})async{
    final appStore = await getApplicationDocumentsDirectory();
    final file = File('${appStore.path}/$name.pdf');
    final response = await Dio().get(url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        )
    );

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;

  }

}

class ModelCheckInformationForDelete {
  String name;
  int id;

  ModelCheckInformationForDelete({
    required this.id,
    required this.name,
  });

  factory ModelCheckInformationForDelete.fromJson(Map<String, dynamic> json) =>
      ModelCheckInformationForDelete(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
