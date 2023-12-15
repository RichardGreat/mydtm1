import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class InfoNotPay extends StatefulWidget {
  const InfoNotPay({super.key});

  @override
  State<InfoNotPay> createState() => _InfoNotPayState();
}

class _InfoNotPayState extends State<InfoNotPay> {
  var box = Hive.box("online");
  bool boolNotShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: SingleChildScrollView(
                child: Text(
                    "infoNotPay".tr(),
                    style: TextStyle(
                        color: MyColors.appColorBlack(),
                        fontWeight: FontWeight.w400,
                        fontSize: 17)),
              )),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: SingleChildScrollView(
                child: Column(children: [
                CheckboxListTile(
                  title: Text("doNotShowAgain".tr(), style: TextStyle(color: MyColors.appColorBlue1(), fontWeight: FontWeight.w600)),
                  value: boolNotShow,
                  onChanged: (val) {
                    setState(() {
                      boolNotShow = !boolNotShow;
                      if (boolNotShow) {
                        box.put("notShowAgain1", "1");
                      } else {
                        box.put("notShowAgain1", "0");
                      }
                    });
                  }),
                const  SizedBox(height: 10),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  height: 45,
                  minWidth: MediaQuery.of(context).size.width * 0.75,
                  color: MyColors.appColorBlue1(),
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Text("accepted".tr(),
                      style: TextStyle(color: MyColors.appColorWhite())),
                )]),
              ),),
          )

        ],
      )),
    );
  }
}
