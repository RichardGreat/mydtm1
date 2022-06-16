import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';

modelGetLangLevel(
    {required BuildContext context,
      required Function f,
      required ProviderCertificate providerCertificate}) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (_) {
        return SheetGetSetLangLevel(ff: f,providerCertificate: providerCertificate);
      });
}
// ignore: must_be_immutable
class SheetGetSetLangLevel extends StatefulWidget {
  ProviderCertificate providerCertificate;
  Function ff;
  SheetGetSetLangLevel({ Key? key,required  this.ff, required this.providerCertificate}) : super(key: key);

  @override
  State<SheetGetSetLangLevel> createState() => _SheetGetSetLangLevelState();
}

class _SheetGetSetLangLevelState extends State<SheetGetSetLangLevel> {

  Future getLangLevel()async{
    await widget.providerCertificate.getLanguageCertLevel(context: context);
    setState((){});
  }

  @override
  initState(){
    getLangLevel() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: widget.providerCertificate.boolCertType?  Column(
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
                widget.providerCertificate.listLangLevelTemp.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text: widget.providerCertificate
                            .listLangLevelTemp[index].name,
                      ),
                    ),
                  ),
                  onTap: () {
                    widget.   providerCertificate.setLangLevel(
                        langLevelId:  widget. providerCertificate
                            .listLangLevelTemp[index].code
                            .toString(),
                        langLeveName:  widget. providerCertificate
                            .listLangLevelTemp[index].name);
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
