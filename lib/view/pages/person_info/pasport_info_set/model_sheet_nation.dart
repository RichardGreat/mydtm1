import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';


modelSheetNation({required BuildContext context,
  required ProviderPersonInfo providerPersonInfo}) {
  Map<String, String> nationMap = {
    "1": "O'zbek",
    "2": "Qoraqalpoq",
    "3": "Rus"
  };
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),

            child: ListView.builder(
              itemCount: nationMap.length,
              itemBuilder: (context, index) =>
                  GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(8),

                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: MyWidgets.robotoFontText(
                          text: nationMap.values.elementAt(index),


                        ),
                      ),

                    ),
                    onTap: () {
                      providerPersonInfo.setNation(
                          nationId: nationMap.keys.elementAt(index),
                          nationName: nationMap.values.elementAt(index));
                      Navigator.of(context).pop();
                    },
                  ),)
        );
      });
}
