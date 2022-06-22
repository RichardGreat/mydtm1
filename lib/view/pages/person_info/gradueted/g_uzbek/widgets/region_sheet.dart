import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetProvinceGraduated(
    {required BuildContext context,
      required ProviderGraduated providerGraduated}) {
  showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (_) {
        return SheetProvince(providerGraduated: providerGraduated);
      });
}
class SheetProvince extends StatefulWidget {
  late ProviderGraduated providerGraduated;
  SheetProvince({Key? key, required this.providerGraduated}) : super(key: key);

  @override
  State<SheetProvince> createState() => _SheetProvinceState();
}

class _SheetProvinceState extends State<SheetProvince> {

  Future getRegionName()async{
    await widget.providerGraduated.getRegion(context: context);
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
                        widget.providerGraduated.txtEditControllerSearch,
                        minLines: 1,
                        onChanged: (value) {
                          widget. providerGraduated.searchRegion(
                              value: value);
                          setState((){});
                        },
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffix: IconButton(
                              onPressed: () {
                                widget.  providerGraduated
                                    .clearCloseRegionSheet();
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
                          widget.    providerGraduated
                              .clearCloseRegionSheet();
                          Navigator.of(context).pop();

                        },
                        icon:  Icon(CupertinoIcons.chevron_down,
                            color: MyColors.appColorBlack()),)
                  ]),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                widget.providerGraduated.listGetCountryTemp.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text:   widget.providerGraduated
                            .listGetCountryTemp[index].name,
                      ),
                    ),
                  ),
                  onTap: () {
                    widget.   providerGraduated.setProvince(
                        pronId:  widget. providerGraduated
                            .listGetCountryTemp[index].id
                            .toString(),
                        proName:  widget. providerGraduated
                            .listGetCountryTemp[index].name);
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
