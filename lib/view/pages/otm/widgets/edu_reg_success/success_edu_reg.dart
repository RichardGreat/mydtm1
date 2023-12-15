import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class SuccessEduReg extends StatefulWidget {
  const SuccessEduReg({super.key});

  @override
  State<SuccessEduReg> createState() => _SuccessEduRegState();
}

class _SuccessEduRegState extends State<SuccessEduReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Icon(Icons.check_circle, color: MyColors.appColorGreen2(), size: 140),
            const SizedBox(height: 20),
            MyWidgets.robotoFontText(text: "textSentSuccess".tr(),  textSize: 25),
            const SizedBox(height: 50),
            MyWidgets.robotoFontText(text: "goArizaSection".tr()),
          ],
        ),
      ),
    ),);
  }
}
