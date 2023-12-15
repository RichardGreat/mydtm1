import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

modelGetLangTypeTexnikum(
    {required BuildContext context,
      required Function f,
      required ProviderCertificateTexnikum providerCertificateTexnikum}) {

  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (_) {
        return SheetGetSetLangTypeTexnikum(ff: f,providerCertificateTexnikum: providerCertificateTexnikum);
      });
}
// ignore: must_be_immutable
class SheetGetSetLangTypeTexnikum extends StatefulWidget {
  ProviderCertificateTexnikum providerCertificateTexnikum;
   Function ff;
  SheetGetSetLangTypeTexnikum({super.key, required this.providerCertificateTexnikum, required this. ff,});

  @override
  State<SheetGetSetLangTypeTexnikum> createState() => _SheetGetSetLangTypeTexnikumState();
}

class _SheetGetSetLangTypeTexnikumState extends State<SheetGetSetLangTypeTexnikum> {

  Future getForeignLangType()async{

    await widget.providerCertificateTexnikum.getLanguageCertType(context: context);
    setState((){});
  }

  @override
  initState(){
    getForeignLangType() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.47,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: widget.providerCertificateTexnikum.boolCertType?  Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyWidgets.robotoFontText(text: "certType".tr(), textSize: 20,
                        textFontWeight: FontWeight.bold
                    ),
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
                    IconButton(
                        onPressed: () {
                          // widget.    providerCertificate
                          //     .clearTextCerLang();
                          Navigator.of(context).pop();

                        },
                        icon: const Icon(Icons.close))
                  ]),
            ),
            Expanded(
              child: ListView.builder(

                itemCount:
                widget.providerCertificateTexnikum.listLangTypeTemp.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text:   widget.providerCertificateTexnikum
                            .listLangTypeTemp[index].name,
                      ),
                    ),
                  ),
                  onTap: () {

                    widget.providerCertificateTexnikum.setLangType(
                        langTypeId:  widget. providerCertificateTexnikum
                            .listLangTypeTemp[index].code
                            .toString(),
                        langTypeName:  widget. providerCertificateTexnikum
                            .listLangTypeTemp[index].name);
                    widget.ff();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ):MyWidgets.loaderDownload(context: context));
  }
}
