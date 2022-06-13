
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/m6_profile/change_number.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:developer';

class ProviderProfile extends ChangeNotifier{

  TextEditingController textChangePhoneNum = TextEditingController();

  final formKeyChangePhone = GlobalKey<FormState>();
  bool myBoolWidget = false;
  bool boolButtonColor1 = false;

  Future boolButtonCol1({required bool boolValue}) async {
    boolButtonColor1 = boolValue;
  }

  NetworkChangePhoneNumber networkChangePhoneNumber = NetworkChangePhoneNumber();

  Future changePhoneNumber()async{
      try{
        String data = await networkChangePhoneNumber.getChangePhoneNumber(phoneNumber: textChangePhoneNum.text);
log(data);
      }catch(e){log(e.toString());}
  }

  ///
  Future goLoginPage({required BuildContext context})async{
    pushNewScreen(
      context,
      screen: const EnterFirst(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  Future logOut()async{
    
  }


  /// Change Phone




}
