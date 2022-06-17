import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/body_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza1.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
class MainMyStatement extends StatefulWidget {

   String numberParam;
   MainMyStatement({Key? key, required this.numberParam}) : super(key: key);

  @override
  State<MainMyStatement> createState() => _MainMyStatementState();
}

class _MainMyStatementState extends State<MainMyStatement> {
  ProviderAriza providerAriza = ProviderAriza();
  @override
  initState(){
    providerAriza.getQaydVaraqa();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => providerAriza,
    child: Consumer<ProviderAriza>(builder: (context, value, child) => WillPopScope(
    onWillPop: () async {
      if(widget.numberParam == "2"){
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    return true;
    },
    child: Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.appColorBlack()),
        backgroundColor: MyColors.appColorWhite(),
         elevation: 0,
         title:
          MyWidgets.robotoFontText(
              text: "applications".tr(), textSize: 24),
      ),
      body:
      providerAriza.boolQaydVaraqaDownload
          ? providerAriza.boolQaydVaraqaDownloadNot
          ? notInfoPerson(context: context, providerAriza: providerAriza):
      SafeArea(child: bodyAriza1(context: context, providerAriza: providerAriza)):MyWidgets.loaderDownload(context: context),
      
    ),),
    ),);
  }
}
