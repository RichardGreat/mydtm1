import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

modelSheetProvince(
    {required BuildContext context,
    required ProviderAddressInfo providerAddressInfo}) {
  Map<String, String> nationMap = {
    "1": "Andijon",
    "2": "Buxoro",
    "3": "Farg'ona viloyati",
    "4": "Jizzax viloyati",
    "5": "Xorazm viloyati",
    "6": "Navoiy viloyati",
    "7": "Namangan viloyati",
    "8": "Qashqadaryo viloyati",
    "9": "Qoraqalpog'iston Respublikasi",
    "10": "Samarqand viloyati",
    "11": "Sirdaryo viloyati",
    "12": "Surxondaryo viloyati",
    "13": "Toshkent viloyati",
    "14": "Toshkent shahri"
  };
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: ListView.builder(
              itemCount: nationMap.length,
              itemBuilder: (context, index) => GestureDetector(
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
                  providerAddressInfo.setProvince(
                      pronId: nationMap.keys.elementAt(index),
                      proName: nationMap.values.elementAt(index));
                  Navigator.of(context).pop();
                },
              ),
            ));
      });
}
