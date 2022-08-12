import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/privillage/add_invalid/add_invalid.dart';
import 'package:mydtm/view/pages/person_info/privillage/provider_privilege.dart';
import 'package:mydtm/view/pages/person_info/privillage/widgets1/app_bar_privilege.dart';
import 'package:mydtm/view/pages/person_info/privillage/widgets1/body_no_privilege.dart';
import 'package:mydtm/view/pages/person_info/privillage/widgets1/body_privilege.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class Privilege extends StatefulWidget {
  Function funcState;

  Privilege({Key? key, required this.funcState,}) : super(key: key);

  @override
  State<Privilege> createState() => _PrivilegeState();
}

class _PrivilegeState extends State<Privilege> {
  ProviderPrivilege providerPrivilege = ProviderPrivilege();


  @override
  initState(){
    getPrivellage();
   super.initState();
 }
  Future getPrivellage()async{
   await providerPrivilege.getPrivilege();
   setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerPrivilege,
      child: Consumer<ProviderPrivilege>(
        builder: (context, value, child) => WillPopScope(
          onWillPop: ()async{

            return true;
          },
          child: Scaffold(

            backgroundColor: MyColors.appColorGrey100(),
            appBar: appBarPrivilege(context: context, providerPrivilege: providerPrivilege),
            body:
            providerPrivilege.boolGetDataPrivilege?
            Column(
              children: [
                !providerPrivilege.boolAddInvalide ?
                const SizedBox(height: 20):const SizedBox.shrink(),
                !providerPrivilege.boolAddInvalide ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: MyColors.appColorWhite(),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width*0.9,
                      onPressed: (){
                        pushNewScreen(context, screen: InvalidAdd(),
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            withNavBar: false);
                      }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle, color: MyColors.appColorBlue1()),
                          SizedBox(
                              width:  MediaQuery.of(context).size.width*0.6,
                              child: Text("addInvalid".tr())),
                        ],
                      ),),
                  ],
                ):const SizedBox.shrink(),
              ! providerPrivilege.boolAddInvalide ?
                const SizedBox(height: 30):const SizedBox.shrink(),
                Expanded(child:  providerPrivilege.boolPrivilegeNot?
                bodyNoPrivilege(context: context, providerPrivilege: providerPrivilege)
                    : bodyPrivilege(context: context, providerPrivilege: providerPrivilege)
               ),
              ],
            )
            :Center(child: MyWidgets.loaderDownload(context: context),)
            ,
          ),
        ),
      ),
    );
  }
}
