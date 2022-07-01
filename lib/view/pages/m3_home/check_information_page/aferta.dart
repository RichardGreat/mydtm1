import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/provider_check_information.dart';
import 'package:mydtm/view/pages/otm/choose_edu.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Aferta extends StatefulWidget {
  Function function;
  ProviderCheckInformation providerCheckInformation;

  Aferta(
      {Key? key,
      required this.function,
      required this.providerCheckInformation})
      : super(key: key);

  @override
  State<Aferta> createState() => _AfertaState();
}

class _AfertaState extends State<Aferta> {
  List<String> myAfertaList = [
    "aferta".tr(),
  ];
  bool boolAfertaButton = false;
  Future getAction({required bool myBools })async{
    await widget.providerCheckInformation.getButtonColor(myBool: myBools);
    setState((){});
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
                  return SizedBox.shrink();
                }
              }),
        ),
        const SizedBox(height: 10),
        MaterialButton(
          height: 40,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: widget.providerCheckInformation.boolAfertaButton
              ? MyColors.appColorBlue1()
              : Colors.blue.withOpacity(0.3),
          child: Text("afertaAccept".tr(),
              style: TextStyle(color: MyColors.appColorWhite())),
          onPressed: () {
            widget.providerCheckInformation.boolAfertaButton
                ?
            {
            Navigator.of(context).pop(),
            pushNewScreen(

              context,
              screen: ChooseEdu(funcState: widget.function),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            ),
          }:{};
          },
        ),
      ]),
    );
  }
}
