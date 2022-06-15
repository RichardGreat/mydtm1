import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/privillage/provider_privilege.dart';
import 'package:mydtm/view/pages/person_info/privillage/widgets1/app_bar_privilege.dart';
import 'package:mydtm/view/pages/person_info/privillage/widgets1/body_no_privilege.dart';
import 'package:mydtm/view/pages/person_info/privillage/widgets1/body_privilege.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class Privilege extends StatefulWidget {
  const Privilege({Key? key}) : super(key: key);

  @override
  State<Privilege> createState() => _PrivilegeState();
}

class _PrivilegeState extends State<Privilege> {
  ProviderPrivilege providerPrivilege = ProviderPrivilege();


  @override
  initState(){
    providerPrivilege.getPrivilege();
   super.initState();
 }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerPrivilege,
      child: Consumer<ProviderPrivilege>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          appBar: appBarPrivilege(context: context, providerPrivilege: providerPrivilege),
          body: providerPrivilege.boolPrivilegeNot?
                    bodyNoPrivilege(context: context, providerPrivilege: providerPrivilege)
              : bodyPrivilege(context: context, providerPrivilege: providerPrivilege),
        ),
      ),
    );
  }
}
