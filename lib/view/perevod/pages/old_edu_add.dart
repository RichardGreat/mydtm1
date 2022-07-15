import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/provider_old_edu.dart';
import 'package:provider/provider.dart';

class OldEduAdd extends StatefulWidget {
  const OldEduAdd({Key? key}) : super(key: key);

  @override
  State<OldEduAdd> createState() => _OldEduAddState();
}

class _OldEduAddState extends State<OldEduAdd> {

  ProviderOldEdu providerOldEdu = ProviderOldEdu();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => providerOldEdu,
    child: Consumer<ProviderOldEdu>(builder: (context, value, child) => Scaffold(),),
    );
  }
}
