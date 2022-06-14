import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetGraduatedName(
    {required BuildContext context,
      required ProviderGraduated providerGraduated}) {
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (_) => SheetGraduatedName(providerGraduated: providerGraduated));
}


// ignore: must_be_immutable
class SheetGraduatedName extends StatefulWidget {
  late ProviderGraduated providerGraduated;

  SheetGraduatedName({Key? key, required this.providerGraduated}) : super(key: key);

  @override
  State<SheetGraduatedName> createState() => _SheetGraduatedNameState();
}

class _SheetGraduatedNameState extends State<SheetGraduatedName> {
  Future getData() async {
    await widget.providerGraduated
        .getGraduatedName();
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
      child: widget.providerGraduated.boolGetGraduatedName
          ? widget.providerGraduated.boolGetGraduatedNameError?
          Container(child: Center(child: MyWidgets.robotoFontText(text:widget.providerGraduated.modelGetGraduatedNameError.errors)),)
          : Container(
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
                              .providerGraduated.txtGraduatedNameController,
                          minLines: 1,
                          onChanged: (value) {
                            widget.providerGraduated
                                .searchGraduatedName(value: value);
                            setState(() {});
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffix: IconButton(
                                onPressed: () {
                                  widget.providerGraduated
                                      .clearTextGraduatedName();
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
                            widget.providerGraduated.txtGraduatedNameController
                                .clear();
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_downward_outlined))
                    ]),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:
                  widget.providerGraduated.listGetNameTemp.length,
                  itemBuilder: (context, index) => GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.providerGraduated
                              .listGetNameTemp[index].name,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    onTap: () {
                      widget.providerGraduated.setGraduatedName(
                          grdNameId:  widget.providerGraduated
                              .listGetNameTemp[index].id
                              .toString(),
                          gradName:  widget.providerGraduated
                              .listGetNameTemp[index].name);
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
