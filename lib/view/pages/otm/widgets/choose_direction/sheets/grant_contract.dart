import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

sheetGrantContractChoose(
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
            child: MyChoosGrantContract(providerChooseEdu: providerChooseEdu));
      });
}

class MyChoosGrantContract extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;

  MyChoosGrantContract({Key? key, required this.providerChooseEdu})
      : super(key: key);

  @override
  State<MyChoosGrantContract> createState() => _MyChoosGrantContractState();
}

class _MyChoosGrantContractState extends State<MyChoosGrantContract> {
  int indexValue = 0;

  @override
  Widget build(BuildContext context) {

    double heightScreen(){

      if(MediaQuery.of(context).size.height >= 800){
        return MediaQuery.of(context).size.height*1.33;
      }else if(MediaQuery.of(context).size.height < 800 && MediaQuery.of(context).size.height >= 700){
        return MediaQuery.of(context).size.height*1.53;
      }
      else if(MediaQuery.of(context).size.height < 700 && MediaQuery.of(context).size.height >= 600){
        return MediaQuery.of(context).size.height*1.63;
      }
      else if(MediaQuery.of(context).size.height < 600 && MediaQuery.of(context).size.height >= 500){
        return MediaQuery.of(context).size.height*1.83;
      }
      else if(MediaQuery.of(context).size.height < 500 && MediaQuery.of(context).size.height >= 400){
        return MediaQuery.of(context).size.height*2.53;
      }
      return 700;
    }
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),

      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [GestureDetector(
                  onTap: (){   Navigator.of(context).pop();},
                  child:const Icon(Icons.close))],),
            MyWidgets.robotoFontText(
                text: "chooseGrantContract".tr(), textSize: 25),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                  color: MyColors.appColorWhite(),

                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: MaterialButton(
                      elevation: 0,
                      height: 40,
                      onPressed: () {
                        setState(() {
                          indexValue = 0;
                        });
                      },
                      color: indexValue == 0
                          ? MyColors.appColorBlue1()
                          : MyColors.appColorWhite(),
                      shape:const  RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),

                          )),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.35,
                        child: Text("grant".tr(),
                            style: TextStyle(
                                color: indexValue == 0
                                    ? MyColors.appColorWhite()
                                    : MyColors.appColorBlue1())),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: MaterialButton(
                      elevation: 0,
                        height: 40,
                        color: indexValue != 1
                            ? MyColors.appColorWhite()
                            : MyColors.appColorBlue1(),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),),),
                        onPressed: () {
                          setState(() {
                            indexValue = 1;
                          });
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.4,
                          child: Text("contract".tr(),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: indexValue != 1
                                    ? MyColors.appColorBlue1()
                                    : MyColors.appColorWhite(),
                              )),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(itemBuilder: (context, index) => Text(
                widget.providerChooseEdu.listGrantContractText[indexValue],
                style: TextStyle(fontSize: 16),
              ), itemCount: 1,)
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: MaterialButton(
                    height: 45,
                    color: MyColors.appColorWhite(),
                    onPressed: () {
                      widget.providerChooseEdu.setGrantContract(
                          id: "0",
                          name: widget
                              .providerChooseEdu.listGrantContract[0]);
                      Navigator.of(context).pop();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                        widget.providerChooseEdu.listGrantContract[0],
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: MyColors.appColorBlack())),
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: MaterialButton(
                    height: 45,

                    color: MyColors.appColorWhite(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      widget.providerChooseEdu.setGrantContract(
                          id: "1",
                          name: widget
                              .providerChooseEdu.listGrantContract[1]);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                        widget.providerChooseEdu.listGrantContract[1],
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: MyColors.appColorBlack())),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
