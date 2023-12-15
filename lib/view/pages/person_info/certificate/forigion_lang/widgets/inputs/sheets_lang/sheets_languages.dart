import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

modelGetLang(
    {required BuildContext context,
    required ProviderCertificate providerCertificate,
    required Function fff,
    required String titleName}) {
  showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (_) {
        return SheetGetSetLang(
            providerCertificate: providerCertificate,
            f: fff,
            titleName: titleName);
      });
}

// ignore: must_be_immutable
class SheetGetSetLang extends StatefulWidget {
  ProviderCertificate providerCertificate;
  String titleName;
  Function f;

  SheetGetSetLang(
      {super.key,
      required this.providerCertificate,
      required this.f,
      required this.titleName});

  @override
  State<SheetGetSetLang> createState() => _SheetGetSetLangState();
}

class _SheetGetSetLangState extends State<SheetGetSetLang> {
  Future getRegionName() async {
    await widget.providerCertificate.getLanguage(context: context);
    setState(() {});
  }

  @override
  initState() {
    getRegionName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
              padding: const EdgeInsets.all(5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.8,
                    //   height: 50,
                    //   child: TextFormField(
                    //     controller:
                    //     widget.providerForeignLang.textEditingLangSearch,
                    //     minLines: 1,
                    //     onChanged: (value) {
                    //       widget.providerForeignLang.searchCertLang(
                    //           value: value);
                    //       setState((){});
                    //     },
                    //     textAlignVertical: TextAlignVertical.center,
                    //     decoration: InputDecoration(
                    //       prefixIcon: const Icon(Icons.search),
                    //       suffix: IconButton(
                    //           onPressed: () {
                    //             widget.providerForeignLang
                    //                 .clearTextCerLang();
                    //             setState((){});
                    //           },
                    //           icon: const Icon(
                    //             Icons.clear,
                    //             size: 12,
                    //           )),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide(
                    //           color: MyColors.appColorGrey400(),
                    //         ),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide(
                    //           color: MyColors.appColorGrey400(),
                    //         ),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide(
                    //           color: MyColors.appColorGrey400(),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    MyWidgets.robotoFontText(
                        text: widget.titleName,
                        textSize: 20,
                        textFontWeight: FontWeight.bold),
                    IconButton(
                        onPressed: () {
                          widget.providerCertificate.clearTextCerLang();
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close))
                  ]),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    widget.providerCertificate.listDataForeignLangTemp.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text: widget.providerCertificate
                            .listDataForeignLangTemp[index].name,
                      ),
                    ),
                  ),
                  onTap: () {
                    widget.providerCertificate.setCertLang(
                        distId: widget.providerCertificate
                            .listDataForeignLangTemp[index].code
                            .toString(),
                        distName: widget.providerCertificate
                            .listDataForeignLangTemp[index].name);
                    widget.f();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
