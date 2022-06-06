import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetMaqsadli({required BuildContext context,
  required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) =>
              Container(
                margin: EdgeInsets.only(top: 15),
                  color: MyColors.appColorWhite(),
                  height: MediaQuery.of(context).size.height*0.2,
                  child: ListView.builder(
                    itemCount: providerChooseEdu.listGrantContract.length,
                    itemBuilder: (context, index) =>
                        GestureDetector(
                          onTap: () {
                            providerChooseEdu.setMaqsadli(
                                id: index.toString(),
                                name: providerChooseEdu
                                    .listmaqsadli[index]);
                            Navigator.of(context).pop();
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
        );
      });
}
