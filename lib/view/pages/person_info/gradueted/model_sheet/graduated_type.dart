import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

modelSheetGraduatedType(
    {required BuildContext contexts,
    required ProviderGraduated providerGraduated}) {
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: contexts,
      builder: (_) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) => providerGraduated
                  .boolGEduType
              ? Container(
                  height: MediaQuery.of(contexts).size.height * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: ListView.builder(
                    itemCount: providerGraduated.listGeneralEduType.length,
                    itemBuilder: (context, index) => GestureDetector(
                      child: Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: MyWidgets.robotoFontText(
                            text: providerGraduated
                                .listGeneralEduType[index].name,
                          ),
                        ),
                      ),
                      onTap: () {
                        providerGraduated.setGraduatedType(
                            id: providerGraduated.listGeneralEduType[index].id
                                .toString(),
                            name: providerGraduated
                                .listGeneralEduType[index].name);
                        Navigator.of(contexts).pop();
                      },
                    ),
                  ))
              : MyWidgets.loaderDownload(context: contexts),
        );
      });
}
// class GetData extends StatefulWidget {
//   ProviderGraduated providerGraduated;
//    GetData({Key? key, required this.providerGraduated}) : super(key: key);
//
//   @override
//   State<GetData> createState() => _GetDataState();
// }
//
// class _GetDataState extends State<GetData> {
//
//   @override
//   initState(){
//     widget.providerGraduated.getGraduatedType(providerGraduated: widget.providerGraduated);
//     setState((){
//
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return  Scaffold(body: );
//
//   }
// }
