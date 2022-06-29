import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/privillage/provider_privilege.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyNoPrivilege({required BuildContext context, required ProviderPrivilege providerPrivilege}){
  return Container(
    margin:const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const SizedBox(height: 20),
      MyWidgets.robotoFontText(text: "privileges".tr(), textSize: 28),
      const SizedBox(height: 15),
      Container(
        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        color: MyColors.appColorWhite(),
          boxShadow: [BoxShadow(color: MyColors.appColorGrey400(), spreadRadius: 0.5, blurRadius: 0.5)]
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const Icon(CupertinoIcons.info, size: 32),
        Text(
          "noPrivileges".tr(),
        maxLines: 3,
        style: TextStyle(
            color: MyColors.appColorBlack(),
            fontSize:  17,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto-Medium'),
      ),
        const Divider(),
        Text(
            "noPrivilegesText".tr(),
          maxLines: 6,
          softWrap: true,

          style: TextStyle(
              color: MyColors.appColorBlack(),
              fontSize:  17,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto-Medium'),
        )


      ],),),
        const SizedBox(height: 30),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     MaterialButton(
        //       height: 40,
        //       minWidth: double.infinity,
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(5)),
        //       color: MyColors.appColorBlue1(),
        //       child: Text("afertaAccept".tr(),
        //           style: TextStyle(color: MyColors.appColorWhite())),
        //       onPressed: () {
        //         AwesomeDialog(
        //             context: context,
        //             dialogType: DialogType.NO_HEADER,
        //             animType: AnimType.BOTTOMSLIDE,
        //             title: "DTM",
        //             desc: "chooseDirection".tr(),
        //             titleTextStyle: TextStyle(
        //                 color: MyColors.appColorBlue1(),
        //                 fontSize: 24,
        //                 fontWeight: FontWeight.bold),
        //             descTextStyle: TextStyle(
        //                 color: MyColors.appColorBlack(),
        //                 fontWeight: FontWeight.bold),
        //             btnCancelOnPress: () {
        //               Navigator.of(context).pop();
        //             },
        //             btnCancelText: "OK")
        //             .show();
        //         // providerCheckInformation.boolAfertaButton
        //         //     ? {
        //         //         Navigator.of(context).pop(),
        //         //         pushNewScreen(
        //         //           context,
        //         //           screen: ChooseEdu(funcState: function),
        //         //           withNavBar: false,
        //         //           pageTransitionAnimation:
        //         //               PageTransitionAnimation.cupertino,
        //         //         ),
        //         //       }
        //         //     : {};
        //       },
        //     ),
        //     // MaterialButton(onPressed: (){
        //     //   // pushNewScreen(context, screen: Privilege(funcState: func));
        //     // },
        //     //   height: 50,
        //     //   minWidth: MediaQuery.of(context).size.width*0.8,
        //     //   color: MyColors.appColorBlue1(),
        //     //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //     //   child: Text("continue".tr(), style: TextStyle(fontWeight: FontWeight.w600, color: MyColors.appColorWhite())),),
        //   ],
        // )
    ],),
  );
}