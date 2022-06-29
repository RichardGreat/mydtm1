import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetMaqsadli(
    {required BuildContext context,
    required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
      backgroundColor: MyColors.appColorWhite(),
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: MyChoosMaqsadli(providerChooseEdu: providerChooseEdu),
        );
      });
}

class MyChoosMaqsadli extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;

  MyChoosMaqsadli({Key? key, required this.providerChooseEdu})
      : super(key: key);

  @override
  State<MyChoosMaqsadli> createState() => _MyChoosMaqsadliState();
}

class _MyChoosMaqsadliState extends State<MyChoosMaqsadli> {
  int indexValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: Container(
        padding: const EdgeInsets.all(10),
        height:MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close))
              ],
            ),
            MyWidgets.robotoFontText(
                text: "targetSelection".tr(), textSize: 25),
            const SizedBox(height: 10),
            // Container(
            //   height: 50,
            //   padding:  EdgeInsets.all(4),
            //   decoration: BoxDecoration(
            //       color: MyColors.appColorWhite(),
            //       borderRadius: BorderRadius.circular(10)),
            //   child: SizedBox(
            //     height: 50,
            //     width: MediaQuery.of(context).size.width *0.8,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         SizedBox(
            //           width: MediaQuery.of(context).size.width *0.4,
            //           child: MaterialButton(
            //             elevation: 0,
            //             height: 45,
            //             onPressed: () {
            //               setState(() {
            //                 indexValue = 0;
            //               });
            //             },
            //             color: indexValue == 0
            //                 ? MyColors.appColorWhite()
            //                 : MyColors.appColorBlue1(),
            //             shape: const RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(10),
            //               bottomLeft: Radius.circular(10),
            //             )),
            //             child: Text("targeted".tr(),
            //                 style: TextStyle(
            //                     color: indexValue != 0
            //                         ? MyColors.appColorWhite()
            //                         : MyColors.appColorBlue1())),
            //           ),
            //         ),
            //         SizedBox(
            //           width: MediaQuery.of(context).size.width *0.4,
            //           child: MaterialButton(
            //             elevation: 0,
            //               height: 45,
            //               color: indexValue == 1
            //                   ? MyColors.appColorWhite()
            //                   : MyColors.appColorBlue1(),
            //               shape: const RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.only(
            //                   topRight: Radius.circular(10),
            //                   bottomRight: Radius.circular(10),
            //                 ),
            //               ),
            //               onPressed: () {
            //                 setState(() {
            //                   indexValue = 1;
            //                 });
            //               },
            //               child: Text("aimless".tr(),
            //                   textAlign: TextAlign.center,
            //                   style: TextStyle(
            //                     color: indexValue != 1
            //                         ? MyColors.appColorWhite()
            //                         : MyColors.appColorBlue1(),
            //                   ))),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.52,
              child:ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Text(
                widget.providerChooseEdu.listmaqsadliText[indexValue],
                style: const TextStyle(fontSize: 15),
              ),)


            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              color: MyColors.appColorWhite(),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,

                    child: MaterialButton(
                      height: 45,
                      color: MyColors.appColorWhite(),
                      onPressed: () {
                        widget.providerChooseEdu.setMaqsadli(
                            id: "0",
                            name: widget.providerChooseEdu.listmaqsadli[0]);
                        Navigator.of(context).pop();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Text("targeted".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: MyColors.appColorBlack())),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.4,

                    child: MaterialButton(
                      height: 45,
                      color: MyColors.appColorWhite(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {
                        widget.providerChooseEdu.setMaqsadli(
                            id: "1",
                            name: widget.providerChooseEdu.listmaqsadli[1]);
                        Navigator.of(context).pop();
                      },
                      child: Text("aimless".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: MyColors.appColorBlack())),
                    ),
                  ),
                ],
              ),
            ),
           const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
