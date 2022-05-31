import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
modelSheetDistrict({required BuildContext context,
  required ProviderAddressInfo providerAddressInfo}) {
  showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    barrierColor: Colors.black.withOpacity(0.2),
    context: context,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) => providerAddressInfo.boolGetDistrict
          ? Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: ListView.builder(
                itemCount: providerAddressInfo.modelGetDistrict.data.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text: providerAddressInfo
                            .modelGetDistrict.data[index].name,
                      ),
                    ),
                  ),
                  onTap: () {
                    providerAddressInfo.setDistrict(
                        distId: providerAddressInfo
                            .modelGetDistrict.data[index].id
                            .toString(),
                        distName: providerAddressInfo
                            .modelGetDistrict.data[index].name);
                    Navigator.of(context).pop();
                  },
                ),
              ))
          : const Center(
              child: CupertinoActivityIndicator(),
            ),
    ),
  );
}
