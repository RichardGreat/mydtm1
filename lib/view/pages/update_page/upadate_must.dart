import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class UpdateMust extends StatefulWidget {
  const UpdateMust({Key? key}) : super(key: key);

  @override
  State<UpdateMust> createState() => _UpdateMustState();
}

class _UpdateMustState extends State<UpdateMust> {
  var box = Hive.box("online");

  @override
  initState() {
    Future.delayed(Duration.zero);
    box.put("updateMust", "3");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          body: Container(
            margin:const EdgeInsets.all(10),
            child: Center(
              child: MyWidgets.robotoFontText(
                text: box.get("updateMobileText").toString(),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          if (Platform.isIOS) {
            exit(0);
          } else {
            SystemNavigator.pop();
          }
          return true;
        });
  }
}
