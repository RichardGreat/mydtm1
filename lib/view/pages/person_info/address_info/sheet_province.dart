import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetProvince(
    {required BuildContext context,
    required ProviderAddressInfo providerAddressInfo}) {
  showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (_) {
    return SheetProvince(providerAddressInfo: providerAddressInfo);
      });
}
class SheetProvince extends StatefulWidget {
  late ProviderAddressInfo providerAddressInfo;
   SheetProvince({Key? key, required this.providerAddressInfo}) : super(key: key);

  @override
  State<SheetProvince> createState() => _SheetProvinceState();
}

class _SheetProvinceState extends State<SheetProvince> {

  Future getRegionName()async{
    await widget.providerAddressInfo.getRegion(context: context);
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
                        widget.providerAddressInfo.txtEditControllerSearch,
                        minLines: 1,
                        onChanged: (value) {
                          widget. providerAddressInfo.searchRegion(
                              value: value);
                          setState((){});
                        },
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffix: IconButton(
                              onPressed: () {
                                widget.  providerAddressInfo
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
                          widget.    providerAddressInfo
                              .clearCloseRegionSheet();
                          Navigator.of(context).pop();

                        },
                        icon: const Icon(Icons.arrow_downward_outlined))
                  ]),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                widget.providerAddressInfo.listGetCountryTemp.length,
                itemBuilder: (context, index) => GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyWidgets.robotoFontText(
                        text:   widget.providerAddressInfo
                            .listGetCountryTemp[index].name,
                      ),
                    ),
                  ),
                  onTap: () {
                    widget.   providerAddressInfo.setProvince(
                        pronId:  widget. providerAddressInfo
                            .listGetCountryTemp[index].id
                            .toString(),
                        proName:  widget. providerAddressInfo
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
