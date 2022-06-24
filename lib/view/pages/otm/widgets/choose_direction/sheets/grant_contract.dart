import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

sheetGrantContractChoose(
    {required BuildContext context,
    required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
      backgroundColor: MyColors.appColorWhite(),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: MyChoosGrantContract(providerChooseEdu: providerChooseEdu));
      });
}

class MyChoosGrantContract extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;

  MyChoosGrantContract({Key? key, required this.providerChooseEdu})
      : super(key: key);

  @override
  State<MyChoosGrantContract> createState() => _MyChoosGrantContractState();
}

class _MyChoosGrantContractState extends State<MyChoosGrantContract> {
  int indexValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [GestureDetector(
                  onTap: (){   Navigator.of(context).pop();},
                  child: Icon(Icons.close))],),
            MyWidgets.robotoFontText(
                text: "chooseGrantContract".tr(), textSize: 25),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: MyColors.appColorBlue1(),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: MaterialButton(
                        height: 40,
                        onPressed: () {
                          setState(() {
                            indexValue = 0;
                          });
                        },
                        color: indexValue == 0
                            ? MyColors.appColorWhite()
                            : MyColors.appColorBlue1(),
                        shape:const  RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),

                            )),
                        child: Text("grant".tr(),
                            style: TextStyle(
                                color: indexValue != 0
                                    ? MyColors.appColorWhite()
                                    : MyColors.appColorBlue1())),
                      )),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: MaterialButton(
                        height: 40,
                        color: indexValue == 1
                            ? MyColors.appColorWhite()
                            : MyColors.appColorBlue1(),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),),),
                        onPressed: () {
                          setState(() {
                            indexValue = 1;
                          });
                        },
                        child: Text("contract".tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: indexValue != 1
                                  ? MyColors.appColorWhite()
                                  : MyColors.appColorBlue1(),
                            ))),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Text(
                  widget.providerChooseEdu.listGrantContractText[indexValue],
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  color: MyColors.appColorWhite(),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: MaterialButton(
                          color: MyColors.appColorBlue1(),
                          onPressed: () {
                            widget.providerChooseEdu.setGrantContract(
                                id: "0",
                                name: widget
                                    .providerChooseEdu.listGrantContract[0]);
                            Navigator.of(context).pop();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                              widget.providerChooseEdu.listGrantContract[0],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: MyColors.appColorWhite())),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: MaterialButton(
                          color: MyColors.appColorBlue1(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            widget.providerChooseEdu.setGrantContract(
                                id: "1",
                                name: widget
                                    .providerChooseEdu.listGrantContract[1]);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                              widget.providerChooseEdu.listGrantContract[1],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: MyColors.appColorWhite())),
                        ),
                      ),
                    ],
                  ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
