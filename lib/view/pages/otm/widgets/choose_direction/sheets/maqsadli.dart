import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
sheetMaqsadli({required BuildContext context,
  required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
    backgroundColor: MyColors.appColorWhite(),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) =>
              Column(
                children: [
                  const SizedBox(height: 10),
                  MyWidgets.robotoFontText(text: "targetSelection".tr()),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                        color: MyColors.appColorWhite(),
                        height: MediaQuery.of(context).size.height*0.2,
                        child: ListView.builder(
                          itemCount: providerChooseEdu.listmaqsadli.length,
                          itemBuilder: (context, index) =>
                              GestureDetector(
                                onTap: () {


                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.NO_HEADER,
                                    animType: AnimType.BOTTOMSLIDE,
                                    
                                    title: "DTM",
                                    body: SingleChildScrollView(child: Container(
                                      margin:const EdgeInsets.all(10),
                                      child: Text(providerChooseEdu
                                        .listmaqsadliText[index],
                                    textAlign: TextAlign.justify,
                                    ),)),
                                    titleTextStyle: TextStyle(
                                        color: MyColors.appColorBlue1(),
                                        fontWeight: FontWeight.bold),
                                    descTextStyle: TextStyle(
                                        color: MyColors.appColorBlack(),
                                        fontWeight: FontWeight.bold),
                                    ///
                                    btnCancelText: "no".tr(),
                                    btnOkText: "yes".tr(),
                                    ///
                                    btnOkOnPress: () {
                                      providerChooseEdu.setMaqsadli(
                                          id: index.toString(),
                                          name: providerChooseEdu
                                              .listmaqsadli[index]);
                                      Navigator.of(context).pop();
                                    },

                                    btnCancelOnPress: () { },
                                  ).show();
                                },
                                child:  Card(
                                  margin: const EdgeInsets.all(8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      providerChooseEdu
                                          .listmaqsadli[index],
                                      overflow: TextOverflow.fade,
                                      softWrap: true,
                                      maxLines: 3,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),


                              ),)
                    ),
                  ),
                ],
              ),
        );
      });
}
