import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

sheetGrantContractChoose({required BuildContext context,
  required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) =>
              SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: providerChooseEdu.listGrantContract.length,
                    itemBuilder: (context, index) =>
                        GestureDetector(
                            onTap: () {
                              providerChooseEdu.setGrantContract(
                                  id: index.toString(),
                                  name: providerChooseEdu
                                      .listGrantContract[index]);
                            },
                            child:  Card(
                              margin: const EdgeInsets.all(8),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  providerChooseEdu
                                      .listGrantContract[index],
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
