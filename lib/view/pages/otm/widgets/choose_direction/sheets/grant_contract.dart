// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      enableDrag: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      builder: (context) {
        return SizedBox(

            height: MediaQuery.of(context).size.height*0.9,
            child: MyChooseGrantContract(providerChooseEdu: providerChooseEdu));
      });
}

class MyChooseGrantContract extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;

  MyChooseGrantContract({Key? key, required this.providerChooseEdu})
      : super(key: key);

  @override
  State<MyChooseGrantContract> createState() => _MyChooseGrantContractState();
}

class _MyChooseGrantContractState extends State<MyChooseGrantContract> {
  int indexValue = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [GestureDetector(
                      onTap: (){   Navigator.of(context).pop();},
                      child:const Icon(Icons.close))],),
                MyWidgets.robotoFontText(
                    text: "chooseGrantContract".tr(), textSize: 25),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  decoration: BoxDecoration(
                      color: MyColors.appColorWhite(),

                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.4,
                        child: MaterialButton(
                          elevation: 0,
                          height: 45,
                          onPressed: () {
                            setState(() {
                              indexValue = 0;
                            });
                          },
                          color: indexValue == 0
                              ? MyColors.appColorBBA()
                              : Colors.grey.shade100,
                          shape:const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),

                              )),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*0.35,
                            child: Text("grant".tr(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                    color: indexValue == 0
                                        ? MyColors.appColorWhite()
                                        : MyColors.appColorBBA())),
                          ),
                        ).animate(

                            onPlay: (controller) => controller
                                .forward(from: 2))
                            .scaleXY(
                            end: 1,
                            delay: const Duration(milliseconds: 2000),
                            curve: Curves.linear)
                            .shimmer(
                            color: Colors.white,
                            delay: const Duration(milliseconds: 2000))
                            .elevation(end: 0),

                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.4,
                        child: MaterialButton(
                          elevation: 0,
                            height: 45,
                            color: indexValue != 1
                                ? Colors.grey.shade100
                                : MyColors.appColorBBA(),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),),),
                            onPressed: () {
                              setState(() {
                                indexValue = 1;
                              });
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: Text("contract".tr(),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: indexValue != 1
                                        ? MyColors.appColorBBA()
                                        : MyColors.appColorWhite(),
                                  )),
                            )).animate(

                            onPlay: (controller) => controller
                                .forward(from: 2,))
                            .scaleXY(
                            end: 1,
                            delay: const Duration(milliseconds: 2000),
                            curve: Curves.linear)
                            .shimmer(
                            color: Colors.white,
                            delay: const Duration(milliseconds: 2000))
                            .elevation(end: 0),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(itemBuilder: (context, index) => Text(
                    widget.providerChooseEdu.listGrantContractText[indexValue],
                    style: const TextStyle(fontSize: 16),
                  ), itemCount: 1,)
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: MaterialButton(
                        height: 45,
                        color: MyColors.appColorWhite(),
                        onPressed: () {
                          widget.providerChooseEdu.setGrantContract(
                              id: "1",
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
                                TextStyle(color: MyColors.appColorBlack())),
                      ),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.42,
                      child: MaterialButton(
                        height: 45,

                        color: MyColors.appColorWhite(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () {
                          widget.providerChooseEdu.setGrantContract(
                              id: "0",
                              name: widget
                                  .providerChooseEdu.listGrantContract[1]);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                            widget.providerChooseEdu.listGrantContract[1],
                            textAlign: TextAlign.center,

                            style:
                                TextStyle(color: MyColors.appColorBlack())),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
