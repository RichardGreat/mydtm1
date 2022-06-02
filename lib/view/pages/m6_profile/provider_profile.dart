import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProviderProfile extends ChangeNotifier{



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


}
