import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/state_menegment/provider_sms.dart';

Widget registrated(
    {required BuildContext context,
    required ProviderSms providerSms,
    required String message}) {
  return Center(
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 30),
          MaterialButton(
            height: 45,
            onPressed: () {
              // Navigator.pushAndRemoveUntil(context,
              //     CupertinoPageRoute(builder: (context) => const EnterSystem(),
              //     ), (route) => false);
            },
            textColor: const Color.fromRGBO(255, 255, 255, 1),
            minWidth: double.infinity,
            color: const Color.fromRGBO(46, 196, 192, 1),
            child: const Text("Asosiy ekranga qaytish"),
          )
        ],
      ),
    ),
  );
}
