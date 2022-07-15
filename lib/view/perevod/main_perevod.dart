import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/provider_main_perevod.dart';
import 'package:provider/provider.dart';

class MainPerevod extends StatefulWidget {
  String serviceName;
   MainPerevod({Key? key, required this.serviceName}) : super(key: key);

  @override
  State<MainPerevod> createState() => _MainPerevodState();
}

class _MainPerevodState extends State<MainPerevod> {

  ProviderPerevodMain providerPerevodMain = ProviderPerevodMain();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => providerPerevodMain,
    child: Consumer<ProviderPerevodMain>(builder: (context, value, child) => Scaffold(),),
    );
  }
}
