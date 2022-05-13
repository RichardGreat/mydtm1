import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';

modelSheet(
    {required BuildContext context,
    required ProviderEnterFirst providerEnterFirst}) {
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  onTap: () {},
                  title: Text("UZBEK"),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Qoraqal"),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Rus"),
                ),
              ],
            ),
          ),
        );
      });
}
