import 'package:flutter/material.dart';

Widget headTitle({required String nameService}) {
  return Text(
    nameService,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  );
}
