import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
modelSheetGraduatedYearPerevod(
    {required BuildContext contexts, required ProviderOldEdu providerOldEdu}) {
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      barrierColor: Colors.black.withOpacity(0.2),
      context: contexts,

      builder: (_) {
        return SizedBox(
            height: MediaQuery.of(contexts).size.height * 0.4,
            child: GetEduGraduatedYearPerevod(providerOldEdu: providerOldEdu));
      });
}

class GetEduGraduatedYearPerevod extends StatefulWidget {
  ProviderOldEdu providerOldEdu;

  GetEduGraduatedYearPerevod({Key? key, required this.providerOldEdu}) : super(key: key);

  @override
  State<GetEduGraduatedYearPerevod> createState() => _GetEduGraduatedYearPerevodState();
}

class _GetEduGraduatedYearPerevodState extends State<GetEduGraduatedYearPerevod> {


  List<String> listGraduatedYear = [
  "firstYear".tr(),
  "secondYear".tr(),
  "thirdYear".tr(),
  "fourthYear".tr(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       margin: const EdgeInsets.all(10),
              //       height: 50,
              //       width: MediaQuery.of(context).size.width * 0.6,
              //       child: TextFormField(
              //         controller:
              //         widget. providerOldEdu.textControllerCountryPerevod,
              //         maxLines: 1,
              //         keyboardType: TextInputType.text,
              //         onChanged: (values) {
              //
              //           widget. providerOldEdu.searchCountryPerevod(values: values.toString());
              //           setState(() {});
              //         },
              //         decoration: InputDecoration(
              //           prefixIcon: const Icon(Icons.search),
              //           counter: const SizedBox.shrink(),
              //           contentPadding:
              //           const EdgeInsets.only(left: 8, right: 8),
              //           fillColor: Colors.white,
              //           focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(8),
              //             borderSide: BorderSide(
              //               color: MyColors.appColorBlue1(),
              //             ),
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(8),
              //             borderSide: BorderSide(
              //               color: MyColors.appColorGrey400(),
              //               width: 1.5,
              //             ),
              //           ),
              //           focusedErrorBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(8),
              //             borderSide: BorderSide(
              //               color: MyColors.appColorBlue1(),
              //               width: 1.5,
              //             ),
              //           ),
              //           errorStyle: TextStyle(
              //             color: MyColors.appColorRed(),
              //             fontWeight: FontWeight.w500,
              //           ),
              //           errorBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(8),
              //             borderSide: BorderSide(
              //               color: MyColors.appColorBlue1(),
              //               width: 1.5,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     IconButton(
              //       onPressed: () {
              //         widget.   providerOldEdu.closeWindowPerevod(context: context);
              //       },
              //       icon: Icon(CupertinoIcons.chevron_down,
              //           color: MyColors.appColorBlack()),
              //     )
              //     // GestureDetector(child: Padding(
              //     //   padding: const EdgeInsets.only(right: 10),
              //     //   child: Icon(CupertinoIcons.chevron_down, color: MyColors.appColorBlack()),
              //     // ),)
              //   ],
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount:
               listGraduatedYear.length,
                  itemBuilder: (context, index) => GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: MyWidgets.robotoFontText(
                          text:
                              listGraduatedYear[index],
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {});
                      widget.providerOldEdu.setGraduatedYears(
                      year:   "${index+1}".toString(),
                        graduatedYearName: listGraduatedYear[index]
                      );

                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ))

    );
  }
}
