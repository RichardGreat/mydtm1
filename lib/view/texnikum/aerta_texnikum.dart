import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m2_main_page/main_page.dart';
import 'package:mydtm/view/pages/otm/choose_edu.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class AfertaTexnikum extends StatefulWidget {
  Function function;
  ProviderTexnikum providerTexnikum;

  AfertaTexnikum(
      {Key? key, required this.function, required this.providerTexnikum})
      : super(key: key);

  @override
  State<AfertaTexnikum> createState() => _AfertaTexnikumState();
}

class _AfertaTexnikumState extends State<AfertaTexnikum> {
  List<String> myAfertaList = [
    "aferta".tr(),
  ];
  bool boolAfertaButton = false;

  Future getAction({required bool myBools}) async {
    await widget.providerTexnikum.getButtonColor(myBool: myBools);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: Column(children: [
        Expanded(
          // height: MediaQuery.of(context).size.height*0.7,
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  getAction(myBools: false);
                  return Text(myAfertaList[index]);
                } else if (index == 1) {
                  getAction(myBools: true);
                  return const SizedBox.shrink();
                } else {
                  return const SizedBox.shrink();
                }
              }),
        ),
        const SizedBox(height: 10),
        MaterialButton(
          height: 40,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: widget.providerTexnikum.boolAfertaButton
              ? MyColors.appColorBlue1()
              : Colors.blue.withOpacity(0.3),
          child: Text("afertaAccept".tr(),
              style: TextStyle(color: MyColors.appColorWhite())),
          onPressed: () {
            widget.providerTexnikum.boolAfertaButton
                ? {
                    Navigator.of(context).pop(),
                    widget.providerTexnikum.modelCheckUserInfoTexnikum.bakalavr
                        ? pushNewScreen(
                            context,
                            screen: MainPages(),
                            //QaydVaraqaEdit(providerCheckInformation: widget.providerTexnikum),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          )
                        : pushNewScreen(
                            context,
                            screen: ChooseEdu(funcState: widget.function),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          ),
                  }
                : {};
          },
        ),
      ]),
    );
  }
}
