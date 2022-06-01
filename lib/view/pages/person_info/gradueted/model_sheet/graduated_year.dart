import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

modelSheetGraduatedYear(
    {required BuildContext contexts,
      required ProviderGraduated providerGraduated}) {

  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: contexts,
      builder: (_) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) => providerGraduated
              .boolGraduatedYear
              ? Container(
              height: MediaQuery.of(contexts).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller:
                          providerGraduated.textEditYearSearch,
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          onChanged: (values) {

                            providerGraduated.searchYear(value: values);
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            counter: const SizedBox.shrink(),
                            contentPadding:
                            const EdgeInsets.only(left: 8, right: 8),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: MyColors.appColorBlue1(),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: MyColors.appColorGrey400(),
                                width: 1.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: MyColors.appColorBlue1(),
                                width: 1.5,
                              ),
                            ),
                            errorStyle: TextStyle(
                              color: MyColors.appColorRed(),
                              fontWeight: FontWeight.w500,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: MyColors.appColorBlue1(),
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          providerGraduated.closeGraduatedSheet(context: context);
                        },
                        icon: Icon(CupertinoIcons.chevron_down,
                            color: MyColors.appColorBlack()),
                      )
                      // GestureDetector(child: Padding(
                      //   padding: const EdgeInsets.only(right: 10),
                      //   child: Icon(CupertinoIcons.chevron_down, color: MyColors.appColorBlack()),
                      // ),)
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: providerGraduated.listGraduatedYearTemp.length,
                      itemBuilder: (context, index) => GestureDetector(
                        child: Card(
                          margin: const EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: MyWidgets.robotoFontText(
                              text: providerGraduated
                                  .listGraduatedYearTemp[index],
                            ),
                          ),
                        ),
                        onTap: () {
                          providerGraduated.setMethodGraduatedYear(
                              id: providerGraduated.listGraduatedYearTemp
                                  .toString());

                          Navigator.of(contexts).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ))
              : MyWidgets.loaderDownload(context: contexts),
        );
      });
}
// class GetData extends StatefulWidget {
//   ProviderGraduated providerGraduated;
//    GetData({Key? key, required this.providerGraduated}) : super(key: key);
//
//   @override
//   State<GetData> createState() => _GetDataState();
// }
//
// class _GetDataState extends State<GetData> {
//
//   @override
//   initState(){
//     widget.providerGraduated.getGraduatedType(providerGraduated: widget.providerGraduated);
//     setState((){
//
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return  Scaffold(body: );
//
//   }
// }
