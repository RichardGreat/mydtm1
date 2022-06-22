import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/address_info/provider_address_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetDistrict(
    {required BuildContext context,
    required ProviderAddressInfo providerAddressInfo}) {
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (_) => SheetDistrict(providerAddressInfo: providerAddressInfo));
}

// providerAddressInfo.getDistrict(parentId: providerAddressInfo.provinceId);
class SheetDistrict extends StatefulWidget {
  late ProviderAddressInfo providerAddressInfo;

  SheetDistrict({Key? key, required this.providerAddressInfo})
      : super(key: key);

  @override
  State<SheetDistrict> createState() => _SheetDistrictState();
}

class _SheetDistrictState extends State<SheetDistrict> {
  Future getData() async {
    await widget.providerAddressInfo
        .getDistrict(parentId: widget.providerAddressInfo.provinceId);
    setState(() {});
  }

  @override
  initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.providerAddressInfo.boolGetDistrict
          ? Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  const SizedBox(height: 20),
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
                              controller: widget
                                  .providerAddressInfo.txtDistrictController,
                              minLines: 1,
                              onChanged: (value) {
                                widget.providerAddressInfo
                                    .searchDistrict(value: value);
                                setState(() {});
                              },
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                suffix: IconButton(
                                    onPressed: () {
                                      widget.providerAddressInfo
                                          .clearTextDistrict();
                                      setState(() {});
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
                                widget.providerAddressInfo
                                    .txtDistrictController.clear();
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(CupertinoIcons.chevron_down))
                        ]),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget
                          .providerAddressInfo.listGetDistrictTemp.length,
                      itemBuilder: (context, index) => GestureDetector(
                        child: Card(
                          margin: const EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                               widget.providerAddressInfo.listGetDistrictTemp
                                  [index].name,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              maxLines: 3,
                              textAlign: TextAlign.start,

                            ),
                          ),
                        ),
                        onTap: () {
                          widget.providerAddressInfo.setDistrict(
                              distId: widget.providerAddressInfo
                                  .listGetDistrictTemp[index].id
                                  .toString(),
                              distName: widget.providerAddressInfo
                                  .listGetDistrictTemp[index].name);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ))
          : MyWidgets.loaderDownload(context: context),
    );
  }
}
