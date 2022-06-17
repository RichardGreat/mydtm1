import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/pages/m3_home/check_information_page/check_information_page.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:developer';

class ProviderServicePage extends ChangeNotifier{
  var box = Hive.box("online");


  ///
  /// Button
  Future checkUserStatus({required BuildContext context,
    required bool status,
    required String categoryName,
    required String categoryId })async{
    status
        ? {
      if(box.get("token").toString().length < 30){

        AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: "DTM",
            desc: "identification".tr(),
            titleTextStyle:TextStyle(color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
            descTextStyle: TextStyle(color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
            btnOkOnPress: () {
              pushNewScreen(
                context,
                screen: EnterFirst(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            btnOkText: "enter".tr()
        )..show(),

      }else{

        if(categoryId == "42")
                  {
                    pushNewScreen(
                      context,
                      screen: CheckInformation(serviceName: categoryName),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    )
                  }else{
          AwesomeDialog(
              context: context,
              dialogType: DialogType.INFO,
              animType: AnimType.BOTTOMSLIDE,
              title: "DTM",
              desc: "Xizmat yaqin vaqtda ishga tushadi",
              titleTextStyle:TextStyle(color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
              btnOkOnPress: () {
                // Navigator.of(context).pop();
              },
              btnOkText: "enter".tr()
          )..show(),
        }
              }

    }:{

      MyWidgets.awesomeDialogInfo(context: context, valueText: "serviceNot".tr())

    };
  }

}