import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget headTitle() {
  return Row(
    children: [
      Text(
        "nationCertTitle".tr(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      )
    ],
  );
}
