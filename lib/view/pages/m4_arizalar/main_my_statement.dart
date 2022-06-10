import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m4_arizalar/body_ariza/body_ariza.dart';
import 'package:mydtm/view/pages/m4_arizalar/provider_ariza.dart';
import 'package:provider/provider.dart';
class MainMyStatement extends StatefulWidget {
  const MainMyStatement({Key? key}) : super(key: key);

  @override
  State<MainMyStatement> createState() => _MainMyStatementState();
}

class _MainMyStatementState extends State<MainMyStatement> {
  ProviderAriza providerAriza = ProviderAriza();
  @override
  initState(){
    providerAriza.getQaydVaraqa();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => providerAriza,
    child: Consumer<ProviderAriza>(builder: (context, value, child) => Scaffold(
      body: SafeArea(child: bodyAriza(context: context, providerAriza: providerAriza)),
      
    ),),
    );
  }
}
