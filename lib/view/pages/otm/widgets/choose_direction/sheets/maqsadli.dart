// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetMaqsadli(
    {required BuildContext context,
    required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
      backgroundColor: MyColors.appColorWhite(),
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          height: MediaQuery.of(context).size.height * 0.9,
          child: MyChooseMaqsadli(providerChooseEdu: providerChooseEdu),
        );
      });
}

class MyChooseMaqsadli extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;

  MyChooseMaqsadli({super.key, required this.providerChooseEdu});

  @override
  State<MyChooseMaqsadli> createState() => _MyChooseMaqsadliState();
}

class _MyChooseMaqsadliState extends State<MyChooseMaqsadli> {
  int indexValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          
          height:MediaQuery.of(context).size.height * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height:  10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.close))
                ],
              ),
              MyWidgets.robotoFontText(
                  text: "targetSelection".tr(), textSize: 25),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.52,
                child:ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => Text(
                  widget.providerChooseEdu.listmaqsadliText[indexValue],
                  style: const TextStyle(fontSize: 15),
                ),)


              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                color: MyColors.appColorWhite(),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,

                      child: MaterialButton(
                        height: 45,
                        color: MyColors.appColorWhite(),
                        onPressed: () {
                          widget.providerChooseEdu.setMaqsadli(
                              id: "1",
                              name: widget.providerChooseEdu.listmaqsadli[0]);
                          Navigator.of(context).pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Text("targeted".tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: MyColors.appColorBlack())),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.4,

                      child: MaterialButton(
                        height: 45,
                        color: MyColors.appColorWhite(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () {
                          widget.providerChooseEdu.setMaqsadli(
                              id: "0",
                              name: widget.providerChooseEdu.listmaqsadli[1]);
                          Navigator.of(context).pop();
                        },
                        child: Text("aimless".tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: MyColors.appColorBlack())),
                      ),
                    ),
                  ],
                ),
              ),
             const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
