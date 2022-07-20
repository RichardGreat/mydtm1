import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/appBar_old_edu.dart';
import 'package:mydtm/view/perevod/pages/old_edu/body_old_edu/body_main_old_edu.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class OldEduAdd extends StatefulWidget {
  const OldEduAdd({Key? key}) : super(key: key);

  @override
  State<OldEduAdd> createState() => _OldEduAddState();
}

class _OldEduAddState extends State<OldEduAdd> {
  ProviderOldEdu providerOldEdu = ProviderOldEdu();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerOldEdu,
      child: Consumer<ProviderOldEdu>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: MyColors.appColorGrey100(),
            appBar:
                appBarOldEdu(context: context, providerOldEdu: providerOldEdu),
            body: providerOldEdu.boolUploadIndicatorServer
                ? SafeArea(
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: bodyMainOldEdu(
                          context: context, providerOldEdu: providerOldEdu),
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text("pleaseWait".tr()),
                       const SizedBox(height: 20),
                     const   CupertinoActivityIndicator(),
                      ],
                    ),
                  )),
      ),
    );
  }
}
