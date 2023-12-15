// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/provider_check_information.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/widgets/app_bar_check_info.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/widgets/body_check_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

class CheckInformation extends StatefulWidget {
  String serviceName;

  CheckInformation({super.key, required this.serviceName});

  @override
  State<CheckInformation> createState() => _CheckInformationState();
}

class _CheckInformationState extends State<CheckInformation> {
  ProviderCheckInformation providerCheckInformation =
      ProviderCheckInformation();

  @override
  initState() {
    getCheckUserInfo();
    super.initState();
  }

  Future getCheckUserInfo() async {
    await providerCheckInformation.getInfoUser();
    if (box.get("showCaseCheckInformation").toString() != "1") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ShowCaseWidget.of(context).startShowCase([
          birGlobalKeyCheckInfo,
          ikkiGlobalKeyCheckInfo,
          uchGlobalKeyCheckInfo,
          tortGlobalKeyCheckInfo,
          beshGlobalKeyCheckInfo,
          oltiGlobalKeyCheckInfo,
          yettiGlobalKeyCheckInfo
        ]);
      });
      box.put("showCaseCheckInformation", "1");
    }
    setState(() {});
  }

  var box = Hive.box("online");

  final birGlobalKeyCheckInfo = GlobalKey();
  final ikkiGlobalKeyCheckInfo = GlobalKey();
  final uchGlobalKeyCheckInfo = GlobalKey();
  final tortGlobalKeyCheckInfo = GlobalKey();
  final beshGlobalKeyCheckInfo = GlobalKey();
  final oltiGlobalKeyCheckInfo = GlobalKey();
  final yettiGlobalKeyCheckInfo = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCheckInformation,
      child: Consumer<ProviderCheckInformation>(
          builder: (context, value, child) => WillPopScope(
              child: Scaffold(
                backgroundColor: MyColors.appColorGrey100(),
                appBar: appBarCheckInfo(context: context),
                body: providerCheckInformation.boolCheckUserInfo
                    ? SafeArea(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            padding: const EdgeInsets.all(8),
                            child: bodyCheckInformation(
                                functions: getCheckUserInfo,
                                context: context,
                                providerCheckInformation:
                                    providerCheckInformation,
                                serviceName: widget.serviceName,
                                birGK: birGlobalKeyCheckInfo,
                                ikkiGK: ikkiGlobalKeyCheckInfo,
                                uchGK: uchGlobalKeyCheckInfo,
                                tortGK: tortGlobalKeyCheckInfo,
                                beshGK: beshGlobalKeyCheckInfo,
                                oltiGK: oltiGlobalKeyCheckInfo,
                                yettiGK: yettiGlobalKeyCheckInfo),
                          ),
                        ),
                      )
                    : MyWidgets.loaderDownload(context: context),
              ),
              onWillPop: () async {
                box.delete("langLock");
                box.put("langLock", "1");
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MainPages(homeIdMainpage: "0"),
                    ),
                    (route) => false);
                return true;
              })),
    );
  }
}
