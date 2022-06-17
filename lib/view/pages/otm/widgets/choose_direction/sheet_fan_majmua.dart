import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetFanMajmuaTest(
    {required BuildContext context,
      required ProviderChooseEdu providerChooseEdu}) {
  showModalBottomSheet(
      context: context,
      enableDrag: true,
      
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  MyWidgets.robotoFontText(text: "Test topshiriladigan fanlar majmuasi", textFontWeight: FontWeight.w600),
                  const SizedBox(height: 10),
                  tableFanMajmua(context: context, providerChooseEdu: providerChooseEdu),
                ],
              ),
            )
          ),
        );
      });
}





Widget tableFanMajmua({required BuildContext context,  required ProviderChooseEdu providerChooseEdu}){
  return Card(
    margin: EdgeInsets.all(4),
    child: Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      border: TableBorder.all(borderRadius: BorderRadius.circular(4),color: MyColors.appColorGrey400()),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
        2:  IntrinsicColumnWidth(),
        3:  IntrinsicColumnWidth(),
        4:  IntrinsicColumnWidth(),
        5:  IntrinsicColumnWidth(),
        // 3: FixedColumnWidth(150),
        // 4: FixedColumnWidth(200),
        // 5: FixedColumnWidth(250),


      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(

            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Fan nomi", style: TextStyle(color: Colors.blue.withOpacity(0.7), fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Ball", style: TextStyle(color: Colors.blue.withOpacity(0.7), fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Savollar soni", style: TextStyle(color: Colors.blue.withOpacity(0.7), fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Umumiy ball", style: TextStyle(color: Colors.blue.withOpacity(0.7), fontWeight: FontWeight.bold)),
              ),
            ]),
        TableRow(

            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(providerChooseEdu.modelFanMasjmua.data.main.b1.name.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(providerChooseEdu.modelFanMasjmua.data.main.b1.ball.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(providerChooseEdu.modelFanMasjmua.data.main.b1.count.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(providerChooseEdu.modelFanMasjmua.data.main.b1.totalBall.toString()+" ball", style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
              ),
            ]),
        TableRow(

            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(providerChooseEdu.modelFanMasjmua.data.main.b2.name.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(providerChooseEdu.modelFanMasjmua.data.main.b2.ball.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(providerChooseEdu.modelFanMasjmua.data.main.b2.count.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(providerChooseEdu.modelFanMasjmua.data.main.b2.totalBall.toString()+" ball", style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
              ),
            ]),
        TableRow(children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(providerChooseEdu.modelFanMasjmua.data.required[0].nameUz.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(providerChooseEdu.modelFanMasjmua.data.required[0].ball.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(providerChooseEdu.modelFanMasjmua.data.required[0].count.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${providerChooseEdu.modelFanMasjmua.data.required[0].totalBall} ball", style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
        ]),
        TableRow(children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(providerChooseEdu.modelFanMasjmua.data.required[1].nameUz.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(providerChooseEdu.modelFanMasjmua.data.required[1].ball.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(providerChooseEdu.modelFanMasjmua.data.required[1].count.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${providerChooseEdu.modelFanMasjmua.data.required[1].totalBall} ball", style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
        ]),
        TableRow(children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(providerChooseEdu.modelFanMasjmua.data.required[2].nameUz.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(providerChooseEdu.modelFanMasjmua.data.required[2].ball.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(providerChooseEdu.modelFanMasjmua.data.required[2].count.toString(), style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${providerChooseEdu.modelFanMasjmua.data.required[2].totalBall} ball", style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w500)),
          ),
        ]),

      ],
    ),
  );

}