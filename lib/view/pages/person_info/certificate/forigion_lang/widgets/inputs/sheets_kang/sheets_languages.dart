import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/provider_foriegn_lang.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelGetLang(
    {required BuildContext context,
      required ProviderForeignLang providerForeignLang}) {
  showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (_) {
        return SheetGetSetLang(providerForeignLang: providerForeignLang);
      });
}
// ignore: must_be_immutable
class SheetGetSetLang extends StatefulWidget {
  late ProviderForeignLang providerForeignLang;
  SheetGetSetLang({Key? key, required this.providerForeignLang}) : super(key: key);

  @override
  State<SheetGetSetLang> createState() => _SheetGetSetLangState();
}

class _SheetGetSetLangState extends State<SheetGetSetLang> {

  Future getRegionName()async{
    await widget.providerForeignLang.getLanguage(context: context);
    setState((){});
  }

  @override
  initState(){
    getRegionName() ;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: TextFormField(
                        controller:
                        widget.providerForeignLang.textEditingLangSearch,
                        minLines: 1,
                        onChanged: (value) {
                          widget.providerForeignLang.searchCertLang(
                              value: value);
                          setState((){});
                        },
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffix: IconButton(
                              onPressed: () {
                                widget.providerForeignLang
                                    .clearTextCerLang();
                                setState((){});
                              },
                              icon: const Icon(
                                Icons.clear,
                                size: 12,
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey400(),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey400(),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey400(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          widget.    providerForeignLang
                              .clearTextCerLang();
                          Navigator.of(context).pop();

                        },
                        icon: const Icon(Icons.arrow_downward_outlined))
                  ]),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                widget.providerForeignLang.listDataForeignLangTemp.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text:   widget.providerForeignLang
                            .listDataForeignLangTemp[index].name,
                      ),
                    ),
                  ),
                  onTap: () {
                    widget.   providerForeignLang.setCertLang(
                        distId:  widget. providerForeignLang
                            .listDataForeignLangTemp[index].code
                            .toString(),
                        distName:  widget. providerForeignLang
                            .listDataForeignLangTemp[index].name);
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
