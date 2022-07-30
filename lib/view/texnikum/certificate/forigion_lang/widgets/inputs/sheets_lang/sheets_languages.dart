import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

modelGetLangTexnikum(
    {required BuildContext context,
    required ProviderCertificateTexnikum providerCertificateTexnikum,
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
        return SheetGetSetLangTexnikum(
            providerCertificateTexnikum: providerCertificateTexnikum,
            f: fff,
            titleName: titleName);
      });
}

// ignore: must_be_immutable
class SheetGetSetLangTexnikum extends StatefulWidget {
  ProviderCertificateTexnikum providerCertificateTexnikum;
  String titleName;
  Function f;

  SheetGetSetLangTexnikum(
      {Key? key,
      required this.providerCertificateTexnikum,
      required this.f,
      required this.titleName})
      : super(key: key);

  @override
  State<SheetGetSetLangTexnikum> createState() => _SheetGetSetLangTexnikumState();
}

class _SheetGetSetLangTexnikumState extends State<SheetGetSetLangTexnikum> {
  Future getRegionName() async {
    await widget.providerCertificateTexnikum.getLanguage(context: context);
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
              padding: EdgeInsets.all(5),
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
                          widget.providerCertificateTexnikum.clearTextCerLang();
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close))
                  ]),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    widget.providerCertificateTexnikum.listDataForeignLangTemp.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text: widget.providerCertificateTexnikum
                            .listDataForeignLangTemp[index].name,
                      ),
                    ),
                  ),
                  onTap: () {
                    widget.providerCertificateTexnikum.setCertLang(
                        distId: widget.providerCertificateTexnikum
                            .listDataForeignLangTemp[index].code
                            .toString(),
                        distName: widget.providerCertificateTexnikum
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
