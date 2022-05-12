import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/app_bar.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_button.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/inputs.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';
import 'package:provider/provider.dart';

class EnterFirst extends StatefulWidget {
  const EnterFirst({Key? key}) : super(key: key);

  @override
  State<EnterFirst> createState() => _EnterFirstState();
}

class _EnterFirstState extends State<EnterFirst> {
  ProviderEnterFirst providerEnterFirst = ProviderEnterFirst();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerEnterFirst,
      child: Consumer<ProviderEnterFirst>(
        builder: (context, value, child) => Scaffold(
          appBar: enterFirstAppBar(
              context: context, providerEnterFirst: providerEnterFirst),
          body: Column(
            children: [
              enterFirstBodyInput(
                  context: context, providerEnterFirst: providerEnterFirst),
              const SizedBox(height: 20),
              enterButton(context: context, providerEnterFirst: providerEnterFirst)
            ],
          )
        ),
      ),
    );
  }
}
