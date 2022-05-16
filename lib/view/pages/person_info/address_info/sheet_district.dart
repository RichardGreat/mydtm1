import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
modelSheetDistrict({required BuildContext context,
  required ProviderAddressInfo providerAddressInfo}) {
  Map<String, String> nationMap = {
    "1": "Tuman Andijon",
    "2": "Tuman Buxoro",
    "3": "Tuman Farg'ona viloyati",
    "4": "Tuman Jizzax viloyati",
    "5": "Tuman Xorazm viloyati",
    "6": "Tuman Navoiy viloyati",
    "7": "Tuman Namangan viloyati",
    "8": "Tuman Qashqadaryo viloyati",
    "9": "Tuman Qoraqalpog'iston Respublikasi",
    "10": "Tuman Samarqand viloyati",
    "11": "Tuman Sirdaryo viloyati",
    "12": "Tuman Surxondaryo viloyati",
    "13": "Tuman Toshkent viloyati",
    "14": "Tuman Toshkent shahri"
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
            height: MediaQuery.of(context).size.height*0.6,
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
                      providerAddressInfo.setDistrict(distId:  nationMap.keys.elementAt(index),
                          distName: nationMap.values.elementAt(index));
                      Navigator.of(context).pop();
                    },
                  ),)
        );
      });
}
