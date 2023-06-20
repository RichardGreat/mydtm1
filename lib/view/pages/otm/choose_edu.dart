// ignore_for_file: must_be_immutable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/app_bar_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/body_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseEdu extends StatefulWidget {
  Function funcState;

  ChooseEdu({Key? key, required this.funcState}) : super(key: key);

  @override
  State<ChooseEdu> createState() => _ChooseEduState();
}

class _ChooseEduState extends State<ChooseEdu> {
  ProviderChooseEdu providerChooseEdu = ProviderChooseEdu();
  var box = Hive.box("online");

  @override
  initState() {
    providerChooseEdu.getCheckUseNationCertInfo();
    // log(box.get("token"));
    super.initState();
  }

  double heightScreen() {
    if (MediaQuery.of(context).size.height >= 851) {
      return MediaQuery.of(context).size.height * 1.2;
    } else if (MediaQuery.of(context).size.height >= 800 &&
        MediaQuery.of(context).size.height <= 850) {
      return MediaQuery.of(context).size.height * 1.32;
    } else if (MediaQuery.of(context).size.height < 800 &&
        MediaQuery.of(context).size.height >= 700) {
      return MediaQuery.of(context).size.height * 1.53;
    } else if (MediaQuery.of(context).size.height < 700 &&
        MediaQuery.of(context).size.height >= 600) {
      return MediaQuery.of(context).size.height * 1.63;
    } else if (MediaQuery.of(context).size.height < 600 &&
        MediaQuery.of(context).size.height >= 500) {
      return MediaQuery.of(context).size.height * 1.83;
    } else if (MediaQuery.of(context).size.height < 500 &&
        MediaQuery.of(context).size.height >= 400) {
      return MediaQuery.of(context).size.height * 2.53;
    }
    return 700;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerChooseEdu,
      child: Consumer<ProviderChooseEdu>(
        builder: (contexts, value, child) => WillPopScope(
          onWillPop: () async {
            AwesomeDialog(
                context: context,
                dialogType: DialogType.noHeader,
                animType: AnimType.rightSlide,
                title: "BMBA",
                desc: "wantBackPage".tr(),
                descTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                btnOkColor: Colors.grey,
                btnCancelColor: Colors.blueAccent,
                btnCancelText: "no".tr(),
                btnOkText: "yes".tr(),
                btnCancelOnPress: () {
                  // Navigator.of(context).pop();
            },
            btnOkOnPress: () {
            widget.funcState();
            Navigator.of(context).pop();
            },

            ).show();

            return true;
          },
          child: Scaffold(
              backgroundColor: MyColors.appColorGrey100(),
              appBar: appBarEduChoose(
                  context: contexts, providerChooseEdu: providerChooseEdu),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: heightScreen(),
                    margin: const EdgeInsets.all(15),
                    child: providerChooseEdu.boolCheckUseCertificateData
                        ? bodyChooseEdu(
                            context: context,
                            providerChooseEdu: providerChooseEdu)
                        : Center(
                            child: MyWidgets.loaderDownload(context: context)),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
