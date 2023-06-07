// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/widgets/app_bar_check_info.dart';
import 'package:mydtm/view/perevod/check_info_perevod/body_check_info_perevod.dart';
import 'package:mydtm/view/perevod/check_info_perevod/provider_check_perevod.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class CheckInformationPerevodga extends StatefulWidget {
  String serviceName;

  CheckInformationPerevodga({Key? key, required this.serviceName}) : super(key: key);

  @override
  State<CheckInformationPerevodga> createState() => _CheckInformationPerevodgaState();
}

class _CheckInformationPerevodgaState extends State<CheckInformationPerevodga> {
  ProviderCheckInfoPerevod providerCheckInfoPerevod =
  ProviderCheckInfoPerevod();

  @override
  initState() {
    // https://api.dtm.uz/v1/imtiyoz/check-data?imie=30309975270036
    getCheckUserInfo();
    super.initState();
  }

  Future getCheckUserInfo() async {
    await providerCheckInfoPerevod.getInfoUser();
    setState(() {});
  }
  var box = Hive.box("online");
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerCheckInfoPerevod,
      child: Consumer<ProviderCheckInfoPerevod>(
          builder: (context, value, child) => WillPopScope(child: Scaffold(
            backgroundColor: MyColors.appColorGrey100(),
            appBar: appBarCheckInfo(context: context),
            body: providerCheckInfoPerevod.boolCheckUserInfo
                ? SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: bodyCheckInfoPerevod(
                      functions: getCheckUserInfo,
                      context: context,
                      providerCheckInfoPerevod: providerCheckInfoPerevod,
                      serviceName: widget.serviceName),
                ),
              ),
            )
                : MyWidgets.loaderDownload(context: context),
          ), onWillPop: ()async{
            box.delete("langLock");
            box.put("langLock", "1");
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const MainPages(),), (route) => false);
            return true;
          })
      ),
    );
  }
}
