import 'package:flutter/cupertino.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';

Widget bodyMainHome(
    {required BuildContext context,
    required ProviderMainHome providerMainHome}) {
  return  SizedBox(
    child: ListView.builder(
      itemCount: providerMainHome.listHeightCount,
      itemBuilder: (context, index) => Text(""),
    ),
  );
}
