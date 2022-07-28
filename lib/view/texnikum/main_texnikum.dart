import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class MainTexnikum extends StatefulWidget {
  const MainTexnikum({Key? key}) : super(key: key);

  @override
  State<MainTexnikum> createState() => _MainTexnikumState();
}

class _MainTexnikumState extends State<MainTexnikum> {
  ProviderTexnikum providerTexnikum = ProviderTexnikum();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerTexnikum,
      child: Consumer<ProviderTexnikum>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorWhite(),
          body: ,
        ),
      ),
    );
  }
}
