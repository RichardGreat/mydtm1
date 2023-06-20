import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetGraduatedDistrict(
    {required BuildContext context,
    required ProviderGraduated providerGraduateds}) {
  showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (_) => SheetDistrict(providerGraduated: providerGraduateds));
}


// ignore: must_be_immutable
class SheetDistrict extends StatefulWidget {
  late ProviderGraduated providerGraduated;

  SheetDistrict({Key? key, required this.providerGraduated}) : super(key: key);

  @override
  State<SheetDistrict> createState() => _SheetDistrictState();
}

class _SheetDistrictState extends State<SheetDistrict> {
  Future getData() async {
    await widget.providerGraduated
        .getDistrict(parentId: widget.providerGraduated.graduatedRegionId);
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
      child: widget.providerGraduated.boolGetDistrict
          ? Container(
              height: MediaQuery.of(context).size.height * 0.8,
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
                                  .providerGraduated.txtDistrictController,
                              minLines: 1,
                              onChanged: (value) {
                                widget.providerGraduated
                                    .searchDistrict(value: value);
                                setState(() {});
                              },
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                suffix: IconButton(
                                    onPressed: () {
                                      widget.providerGraduated
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
                                widget.providerGraduated.txtDistrictController
                                    .clear();
                                Navigator.of(context).pop();
                              },
                              icon:Icon(CupertinoIcons.chevron_down,
                                  color: MyColors.appColorBlack()), )
                        ]),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          widget.providerGraduated.listGetDistrictTemp.length,
                      itemBuilder: (context, index) => GestureDetector(
                        child: Card(
                          margin: const EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              widget.providerGraduated
                                  .listGetDistrictTemp[index].name,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              maxLines: 3,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                          ),
                        ),
                        onTap: () {
                          widget.providerGraduated.setDistrict(
                              distId: widget.providerGraduated
                                  .listGetDistrictTemp[index].id
                                  .toString(),
                              distName: widget.providerGraduated
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
